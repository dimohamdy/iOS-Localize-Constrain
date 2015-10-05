//
//  UIView+viewRecursion.m
//  LocalizeConstraint
//
//  Created by Hamdy on 10/5/15.
//  Copyright © 2015 Hamdy. All rights reserved.
//

#import "UIView+viewRecursion.h"

@implementation UIView (viewRecursion)
- (NSMutableArray*)allSubViews
{
    NSMutableArray *arr=[[NSMutableArray alloc] init];
    [arr addObject:self];
    for (UIView *subview in self.subviews)
    {
        [arr addObjectsFromArray:(NSArray*)[subview allSubViews]];
    }

    return arr;
}

- (void)logViewHierarchy
{
//    NSLog(@"%@", self);
    for (UIView *subview in self.subviews)
    {
        [subview logViewHierarchy];
    }
}

@end
