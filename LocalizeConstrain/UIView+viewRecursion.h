//
//  UIView+viewRecursion.h
//  LocalizeConstraint
//
//  Created by Hamdy on 10/5/15.
//  Copyright © 2015 Hamdy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (viewRecursion)
- (NSMutableArray*) allSubViews;
- (void)logViewHierarchy;
@end
