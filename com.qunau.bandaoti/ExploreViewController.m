//
//  ExploreViewController.m
//  com.qunau.bandaoti
//
//  Created by cy on 15/12/16.
//  Copyright © 2015年 Qunau. All rights reserved.
//

#import "ExploreViewController.h"
#import "LoginUserModel.h"

@interface ExploreViewController ()

@end

@implementation ExploreViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [LoginUserModel getUserWithSuccess:^(LoginUser *user) {
        NSLog(@"获取到用户的 AuditState == %ld",(long)user.AuditState);
    } failure:^(NSString *error) {
        NSLog(@"获取到用户出错 == %@",error);
    }];
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
