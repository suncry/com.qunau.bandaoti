//
//  MainTabBarController.m
//  com.qunau.bandaoti
//
//  Created by cy on 15/12/13.
//  Copyright © 2015年 Qunau. All rights reserved.
//

#import "MainTabBarController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIViewController *vc = [[UIStoryboard storyboardWithName:@"Explore" bundle:nil] instantiateInitialViewController];
    [self setViewControllers:@[vc,vc,vc]];
    
    
    UITabBarController *qwe = [[UITabBarController alloc] ]
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
