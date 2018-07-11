//
//  BezierPathViewController.m
//  Masonry
//
//  Created by mading shouyou on 2018/7/10.
//  Copyright © 2018年 mading shouyou. All rights reserved.
//

#import "BezierPathViewController.h"
#import "BezierPathView.h"

@interface BezierPathViewController ()

@end

@implementation BezierPathViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"BezierPath";
    self.view.backgroundColor = COLOR_BG_MAIN;
    
    BezierPathView *bezierPath = [[BezierPathView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:bezierPath];
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
