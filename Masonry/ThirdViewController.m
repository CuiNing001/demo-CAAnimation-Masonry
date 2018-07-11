//
//  ThirdViewController.m
//  Masonry
//
//  Created by mading shouyou on 2018/6/28.
//  Copyright © 2018年 mading shouyou. All rights reserved.
//

#import "ThirdViewController.h"
#import "BezierPathViewController.h"

@interface ThirdViewController ()

@property (strong, nonatomic) UIView *animationView;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"CAKeyframeAnimation";
    
    // 修改系统返回按钮
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = item;
    
    NSArray *itemArr = [NSArray arrayWithObjects:@"values_square",@"vualues_radius",@"path_cyclo",@"path_BezierPath", nil];
    UISegmentedControl *segment = [[UISegmentedControl alloc]initWithItems:itemArr];
    [self.view addSubview:segment];
    __weak typeof(self)weakSelf = self;
    [segment mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view).offset(10);
        make.top.equalTo(weakSelf.view).offset(100);
        make.right.equalTo(weakSelf.view).offset(-10);
        make.height.mas_equalTo(40);
    }];
    
    [segment addTarget:self action:@selector(chooseAnimation:) forControlEvents:UIControlEventValueChanged];
    
    self.animationView = [[UIView alloc]init];
    _animationView.backgroundColor = COLOR_RANDOM;
    [self.view addSubview:_animationView];
    [_animationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(weakSelf.view);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    
}

- (void)chooseAnimation:(UISegmentedControl *)sender{
    
    if (sender.selectedSegmentIndex==0)
    {
        [self animationZero];
    }
    else if (sender.selectedSegmentIndex==1)
    {
        [self animationOne];
    }
    else if (sender.selectedSegmentIndex==2)
    {
        [self animaitonTwo];
    }
    else if (sender.selectedSegmentIndex==3)
    {
        [self animationThree];
    }
}

-(void)animationZero{
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyAnimation.duration = 4;
    keyAnimation.fillMode = kCAFillModeBackwards;
    keyAnimation.removedOnCompletion = NO;
    keyAnimation.repeatCount = 2;
    keyAnimation.autoreverses = NO;
    keyAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    CGPoint myPoint = _animationView.center;
    NSValue *value_0 = [NSValue valueWithCGPoint:myPoint];
    NSValue *value_1 = [NSValue valueWithCGPoint:CGPointMake(myPoint.x+100, myPoint.y)];
    NSValue *value_2 = [NSValue valueWithCGPoint:CGPointMake(myPoint.x+100, myPoint.y+100)];
    NSValue *value_3 = [NSValue valueWithCGPoint:CGPointMake(myPoint.x, myPoint.y+100)];
    NSValue *value_4 = [NSValue valueWithCGPoint:CGPointMake(myPoint.x, myPoint.y)];
    keyAnimation.values = [NSArray arrayWithObjects:value_0,value_1,value_2,value_3,value_4, nil];
    NSNumber *number_0 = [NSNumber numberWithFloat:0.0];
    NSNumber *number_1 = [NSNumber numberWithFloat:0.1];
    NSNumber *number_2 = [NSNumber numberWithFloat:0.2];
    NSNumber *number_3 = [NSNumber numberWithFloat:0.8];
    NSNumber *number_4 = [NSNumber numberWithFloat:1.0];
    keyAnimation.keyTimes = [NSArray arrayWithObjects:number_0,number_1,number_2,number_3,number_4, nil];
    [_animationView.layer addAnimation:keyAnimation forKey:@"positionAni"];
}

- (void)animationOne{
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"cornerRadius"];
    keyAnimation.duration =4;
    keyAnimation.repeatCount = 2;
    keyAnimation.autoreverses = NO;
    keyAnimation.removedOnCompletion = NO;
    keyAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    NSNumber *number_0 = [NSNumber numberWithFloat:0];
    NSNumber *number_1 = [NSNumber numberWithFloat:50];
    NSNumber *number_2 = [NSNumber numberWithBool:20];
    NSNumber *number_3 = [NSNumber numberWithFloat:50];
    NSNumber *number_4 = [NSNumber numberWithFloat:0];
    keyAnimation.values = @[number_0,number_1,number_2,number_3,number_4];
    [_animationView.layer addAnimation:keyAnimation forKey:@"radiusAnimation"];
}

- (void)animaitonTwo{
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    // 创建路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGFloat x = _animationView.frame.origin.x;
    CGFloat y = _animationView.frame.origin.y;
    // 路径范围
    CGPathAddEllipseInRect(path, NULL, CGRectMake(x-100, y, 200, 200));
    keyAnimation.path = path;
    // 释放路径(带Create的函数创建的对象都需要手动释放,否则会内存泄露)
    CFRelease(path);
    keyAnimation.duration = 10;
    [_animationView.layer addAnimation:keyAnimation forKey:@"pathAnimation"];
}

- (void)animationThree{
    
//    CGPoint layerCenter = CGPointMake(CGRectGetWidth(self.view.frame)/2, CGRectGetWidth(self.view.frame)/2);
//    CAShapeLayer *layer = [CAShapeLayer layer];
//    layer.frame = self.view.bounds;
//    layer.lineWidth = 6.0;
//    layer.strokeColor = [UIColor redColor].CGColor;
//    layer.fillColor = [UIColor whiteColor].CGColor;
//
//    UIBezierPath* path = [UIBezierPath bezierPath];
//    [path addArcWithCenter:layerCenter radius:50 startAngle:0.0 endAngle:M_PI*2 clockwise:YES];
//    layer.path = path.CGPath;
//
//    UIGraphicsBeginImageContext(self.view.bounds.size);
//    [path stroke];
//    [path fill];
//    UIGraphicsEndImageContext();
//    
//    [self.view.layer addSublayer:layer];
    
    BezierPathViewController *bezierVC = [[BezierPathViewController alloc]init];
    bezierVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:bezierVC animated:YES];
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
