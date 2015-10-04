//
//  UIViewController+LocalizeConstrint.m
//  LocalizeConstraint
//
//  Created by Hamdy on 10/4/15.
//  Copyright (c) 2015 Hamdy. All rights reserved.
//

#import "UIViewController+LocalizeConstrint.h"

@implementation UIViewController (LocalizeConstrint)
-(void)changeViewRTL:(UIView*)tempView{
    NSMutableArray *constraintsToAdd = [[NSMutableArray alloc]init];
    NSMutableArray *constraintsToRemove = [[NSMutableArray alloc]init];
    
    for (NSLayoutConstraint *constraint in tempView.constraints) {
        
        
        NSLayoutAttribute firstAttribute = constraint.firstAttribute;
        NSLayoutAttribute secondAttribute = constraint.secondAttribute;
        
        if ((firstAttribute == NSLayoutAttributeLeading || firstAttribute == NSLayoutAttributeTrailing ||firstAttribute == NSLayoutAttributeLeft || firstAttribute == NSLayoutAttributeRight ) && (secondAttribute == NSLayoutAttributeLeading || secondAttribute == NSLayoutAttributeTrailing || secondAttribute == NSLayoutAttributeLeft || secondAttribute == NSLayoutAttributeRight)) {
            
            firstAttribute = [self changeAttributeValue:firstAttribute];
            secondAttribute = [self changeAttributeValue:secondAttribute];
            
            constraint.constant *= -1;
            NSLayoutConstraint *constraintNew =  [NSLayoutConstraint constraintWithItem:constraint.firstItem attribute:firstAttribute relatedBy:constraint.relation toItem:constraint.secondItem attribute:secondAttribute multiplier:constraint.multiplier constant:constraint.constant];
            
            
            [constraintsToRemove addObject:constraint];
            [constraintsToAdd addObject:constraintNew];
            
            
        }
        
    }
    
    for (NSLayoutConstraint *constraint in constraintsToRemove) {
        [tempView removeConstraint:constraint];
    }
    for (NSLayoutConstraint *constraint in constraintsToAdd) {
        [tempView addConstraint:constraint];
    }
}
-(NSLayoutAttribute)changeAttributeValue:(NSLayoutAttribute)attribute{
    switch (attribute) {
        case NSLayoutAttributeLeading:
            attribute = NSLayoutAttributeTrailing;
        case NSLayoutAttributeTrailing:
            attribute = NSLayoutAttributeLeading;
            break;
        case NSLayoutAttributeLeft:
            attribute = NSLayoutAttributeRight;
            break;
        case NSLayoutAttributeRight:
            attribute = NSLayoutAttributeLeft;
            break;
        default:
            break;
    }
    return attribute;
}
@end
