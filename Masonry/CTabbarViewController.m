//
//  CTabbarViewController.m
//  Masonry
//
//  Created by mading shouyou on 2018/6/28.
//  Copyright © 2018年 mading shouyou. All rights reserved.
//

#import "CTabbarViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"

@interface CTabbarViewController ()

@end

@implementation CTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    FirstViewController *firstVC = [FirstViewController new];
    UINavigationController *navFirst = [[UINavigationController alloc]initWithRootViewController:firstVC];
    firstVC.title = @"FIRST";
    firstVC.view.backgroundColor = COLOR_BG_MAIN;
    [navFirst.navigationBar setBarStyle:UIBarStyleBlack];
//    navFirst.navigationBar.barTintColor = [UIColor blackColor];
//    [navFirst.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    navFirst.tabBarItem.image = [[UIImage imageNamed:@"first_tabbar_nor"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navFirst.tabBarItem.selectedImage = [[UIImage imageNamed:@"first_tabbar_sel"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    SecondViewController *secVC = [SecondViewController new];
    UINavigationController *navSec = [[UINavigationController alloc]initWithRootViewController:secVC];
    secVC.title = @"SECOND";
    secVC.view.backgroundColor = COLOR_BG_MAIN;
    [navSec.navigationBar setBarStyle:UIBarStyleBlack];
    navSec.tabBarItem.image = [[UIImage imageNamed:@"second_tabbar_nor"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navSec.tabBarItem.selectedImage = [[UIImage imageNamed:@"second_tabbar_sel"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    ThirdViewController *thirdVC = [ThirdViewController new];
    UINavigationController *navThird = [[UINavigationController alloc]initWithRootViewController:thirdVC];
    thirdVC.title = @"THREE";
    thirdVC.view.backgroundColor = COLOR_BG_MAIN;
    [navThird.navigationBar setBarStyle:UIBarStyleBlack];
    navThird.tabBarItem.image = [[UIImage imageNamed:@"third_tabbar_nor"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navThird.tabBarItem.selectedImage = [[UIImage imageNamed:@"third_tabbar_sel"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    FourthViewController *fourthVC = [FourthViewController new];
    UINavigationController *navFourth = [[UINavigationController alloc]initWithRootViewController:fourthVC];
    fourthVC.title = @"FOUR";
    fourthVC.view.backgroundColor = COLOR_BG_MAIN;
    [navFourth.navigationBar setBarStyle:UIBarStyleBlack];
    navFourth.tabBarItem.image = [[UIImage imageNamed:@"fourth_tabbar_nor"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navFourth.tabBarItem.selectedImage = [[UIImage imageNamed:@"fourth_tabbar_sel"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    NSArray *vcArray = [NSArray arrayWithObjects:navFirst,navSec,navThird,navFourth, nil];
    self.viewControllers = vcArray;
    
    [[UITabBarItem appearance]setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor]} forState:UIControlStateNormal];
    [[UITabBarItem appearance]setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor greenColor]} forState:UIControlStateSelected];
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
