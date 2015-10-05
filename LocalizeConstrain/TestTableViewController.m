//
//  TestTableViewController.m
//  LocalizeConstraint
//
//  Created by Hamdy on 10/5/15.
//  Copyright © 2015 Hamdy. All rights reserved.
//

#import "TestTableViewController.h"
#import "UIViewController+LocalizeConstrint.h"
#import "UIView+viewRecursion.h"

@interface TestTableViewController ()

@end

@implementation TestTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    
    }
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

    for(UIView *v in [self.view allSubViews])
    {
        [self changeViewRTL:v];
        if([v isKindOfClass:[UILabel class]])
        {
            NSLog(@"Found %@",v.constraints.description);
        }
        
        
    }

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
