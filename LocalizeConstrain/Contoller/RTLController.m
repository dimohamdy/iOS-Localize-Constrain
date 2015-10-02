//
//  RTLController.m
//  TestRTL
//
//  Created by Hamdy on 9/29/15.
//  Copyright (c) 2015 Hamdy. All rights reserved.
//

#import "RTLController.h"

@implementation RTLController

#pragma mark - Public

- (void)disableRTLForView:(UIView *)view
{
    [self updateSubviewForParentViewIfPossible:view];
}

#pragma mark - Private

- (void)updateConstraintForView:(UIView *)view
{
    NSMutableArray *constraintsToRemove = [[NSMutableArray alloc] init];
    NSMutableArray *constraintsToAdd = [[NSMutableArray alloc] init];
    
    for (NSLayoutConstraint *constraint in view.constraints) {
        
        NSLayoutAttribute firstAttribute = constraint.firstAttribute;
        NSLayoutAttribute secondAttribute = constraint.secondAttribute;
        
        if (constraint.firstAttribute == NSLayoutAttributeLeading) {
            firstAttribute = NSLayoutAttributeLeft;
        } else if (constraint.firstAttribute == NSLayoutAttributeTrailing) {
            firstAttribute = NSLayoutAttributeRight;
        }
        
        if (constraint.secondAttribute == NSLayoutAttributeLeading) {
            secondAttribute = NSLayoutAttributeLeft;
        } else if (constraint.secondAttribute == NSLayoutAttributeTrailing) {
            secondAttribute = NSLayoutAttributeRight;
        }
        
        NSLayoutConstraint *updatedConstraint = [self constraintWithFirstAttribute:firstAttribute secondAtribute:secondAttribute fromConstraint:constraint];
        [constraintsToRemove addObject:constraint];
        [constraintsToAdd addObject:updatedConstraint];
        
    }
    
    for (NSLayoutConstraint *constraint in constraintsToRemove) {
        [view removeConstraint:constraint];
    }
    for (NSLayoutConstraint *constraint in constraintsToAdd) {
        [view addConstraint:constraint];
    }
}

- (void)updateSubviewForParentViewIfPossible:(UIView *)mainView
{
    NSArray *subViews = mainView.subviews;
    [self updateConstraintForView:mainView];
    
    if (subViews.count) {
        for (UIView * subView in subViews) {
            [self updateConstraintForView:subView];
            [self updateSubviewForParentViewIfPossible:subView];
        }
    }
}

- (NSLayoutConstraint *)constraintWithFirstAttribute:(NSLayoutAttribute)firstAttribute secondAtribute:(NSLayoutAttribute)secondAttribute fromConstraint:(NSLayoutConstraint *)originalConstraint
{
    NSLayoutConstraint *updatedConstraint =
    [NSLayoutConstraint constraintWithItem:originalConstraint.firstItem
                                 attribute:firstAttribute
                                 relatedBy:originalConstraint.relation
                                    toItem:originalConstraint.secondItem
                                 attribute:secondAttribute
                                multiplier:originalConstraint.multiplier
                                  constant:originalConstraint.constant];
    return updatedConstraint;
}
@end