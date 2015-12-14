//
//  MainTabBarController.m
//  com.qunau.bandaoti
//
//  Created by cy on 15/12/13.
//  Copyright © 2015年 Qunau. All rights reserved.
//

#import "MainTabBarController.h"

@interface MainTabBarController ()
@property (nonatomic,retain) NSArray *tabNameArray;
@property (nonatomic,retain) NSArray *tabImageArray;
@property (nonatomic,retain) NSArray *tabSelectedImageArray;
@end

@implementation MainTabBarController

#pragma mark 属性初始化

- (NSArray *)tabNameArray {
    return @[@"发现",@"旅途",@"心愿",@"我"];
}

- (NSArray *)tabImageArray {
    return @[@"explore",@"trip",@"wish",@"self"];
}

- (NSArray *)tabSelectedImageArray {
    return @[@"explore_active",@"trip_active",@"wish_active",@"self_active"];
}

#pragma mark life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIViewController *explore = [[UIStoryboard storyboardWithName:@"Explore" bundle:nil] instantiateInitialViewController];
    UIViewController *trip = [[UIStoryboard storyboardWithName:@"Trip" bundle:nil] instantiateInitialViewController];
    UIViewController *wish = [[UIStoryboard storyboardWithName:@"Wish" bundle:nil] instantiateInitialViewController];
    UIViewController *me = [[UIStoryboard storyboardWithName:@"Me" bundle:nil] instantiateInitialViewController];
    [self setViewControllers:@[explore,trip,wish,me]];
    
    for (int i = 0; i < self.viewControllers.count; i++) {
        NSString *title = self.tabNameArray[i];
        UIImage *tabImage = [UIImage imageNamed:self.tabImageArray[i]];
        //暂时 没有设置 selectedImage  图片有问题？
//        UIImage *tabSelectedImage = [UIImage imageNamed:self.tabSelectedImageArray[i]];

//        (self.viewControllers[i]).tabBarItem = [[UITabBarItem alloc] initWithTitle:title
//                                                                             image:tabImage
//                                                                     selectedImage:tabSelectedImage];
        (self.viewControllers[i]).tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:tabImage tag:i];

    }
}

@end
