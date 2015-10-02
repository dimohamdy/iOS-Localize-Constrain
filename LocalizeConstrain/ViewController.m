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
    
    for (NSLayoutConstraint *constrain in self.view.constraints) {
        
        
        NSLayoutAttribute firstAttribute = constrain.firstAttribute;
        NSLayoutAttribute secondAttribute = constrain.secondAttribute;
        
        if ((firstAttribute == NSLayoutAttributeLeading || firstAttribute == NSLayoutAttributeTrailing) && (secondAttribute == NSLayoutAttributeLeading || secondAttribute == NSLayoutAttributeTrailing)) {
            
            if (constrain.firstAttribute == NSLayoutAttributeLeading) {
                firstAttribute = NSLayoutAttributeTrailing;
            } else if (constrain.firstAttribute == NSLayoutAttributeTrailing) {
                firstAttribute = NSLayoutAttributeLeading;
            }
            
            if (constrain.secondAttribute == NSLayoutAttributeLeading) {
                secondAttribute = NSLayoutAttributeTrailing;
            } else if (constrain.secondAttribute == NSLayoutAttributeTrailing) {
                secondAttribute = NSLayoutAttributeLeading;
            }
            
            constrain.constant *= -1;
            NSLayoutConstraint *constrainNew =  [NSLayoutConstraint constraintWithItem:constrain.firstItem attribute:firstAttribute relatedBy:constrain.relation toItem:constrain.secondItem attribute:secondAttribute multiplier:constrain.multiplier constant:constrain.constant];
            [self.view removeConstraint:constrain];
            [self.view addConstraint:constrainNew];
            
        }
        
    }

    
}
@end
