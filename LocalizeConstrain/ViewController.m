//
//  ViewController.m
//  TestRTL
//
//  Created by Hamdy on 9/29/15.
//  Copyright (c) 2015 Hamdy. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeToArabic:(id)sender {
    
    [self changeViewRTL:self.view];
    for (UIView *tempView in self.view.subviews) {
        
        [self changeViewRTL:tempView];
    }
    
}
-(void)changeViewRTL:(UIView*)tempView{
    
    for (NSLayoutConstraint *constrain in tempView.constraints) {
        
        
        NSLayoutAttribute firstAttribute = constrain.firstAttribute;
        NSLayoutAttribute secondAttribute = constrain.secondAttribute;
        
        if ((firstAttribute == NSLayoutAttributeLeading || firstAttribute == NSLayoutAttributeTrailing ||firstAttribute == NSLayoutAttributeLeft || firstAttribute == NSLayoutAttributeRight ) && (secondAttribute == NSLayoutAttributeLeading || secondAttribute == NSLayoutAttributeTrailing || secondAttribute == NSLayoutAttributeLeft || secondAttribute == NSLayoutAttributeRight)) {
            
            firstAttribute = [self changeAttributeValue:firstAttribute];
            secondAttribute = [self changeAttributeValue:secondAttribute];
            
            constrain.constant *= -1;
            NSLayoutConstraint *constrainNew =  [NSLayoutConstraint constraintWithItem:constrain.firstItem attribute:firstAttribute relatedBy:constrain.relation toItem:constrain.secondItem attribute:secondAttribute multiplier:constrain.multiplier constant:constrain.constant];
            [tempView removeConstraint:constrain];
            [tempView addConstraint:constrainNew];
            
        }
        
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
