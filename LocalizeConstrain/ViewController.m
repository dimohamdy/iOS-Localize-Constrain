//
//  ViewController.m
//  LocalizeConstraint
//
//  Created by dimo.hamdy on 9/29/15.
//  Copyright (c) 2015 dimo.hamdy. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+LocalizeConstrint.h"
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

@end
