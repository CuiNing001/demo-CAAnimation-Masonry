//
//  SecondViewController.m
//  Masonry
//
//  Created by mading shouyou on 2018/6/28.
//  Copyright © 2018年 mading shouyou. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (strong, nonatomic) UIView *view_1;
@property (strong, nonatomic) UIView *view_2;
@property (strong, nonatomic) UIView *view_3;
@property (strong, nonatomic) UIView *view_4;
@property (strong, nonatomic) UIView *view_5;
@property (strong, nonatomic) UIView *view_6;
@property (strong, nonatomic) UIView *view_7;
@property (strong, nonatomic) UIView *view_8;
@property (strong, nonatomic) UIView *view_9;
@property (strong, nonatomic) UILabel *label_1;
@property (strong, nonatomic) UILabel *label_2;
@property (strong, nonatomic) UILabel *label_3;
@property (strong, nonatomic) UILabel *label_4;
@property (strong, nonatomic) UILabel *label_5;
@property (strong, nonatomic) UILabel *label_6;
@property (strong, nonatomic) UILabel *label_7;
@property (strong, nonatomic) UILabel *label_8;
@property (strong, nonatomic) UILabel *label_9;
@property (strong, nonatomic) UIImageView *imageView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"CABaseAnimation";
    
    self.view_1 = [[UIView alloc]init];
    self.view_2 = [[UIView alloc]init];
    self.view_3 = [[UIView alloc]init];
    self.view_4 = [[UIView alloc]init];
    self.view_5 = [[UIView alloc]init];
    self.view_6 = [[UIView alloc]init];
    self.view_7 = [[UIView alloc]init];
    self.view_8 = [[UIView alloc]init];
    self.view_9 = [[UIView alloc]init];
    
    [self.view addSubview:_view_1];
    [self.view addSubview:_view_2];
    [self.view addSubview:_view_3];
    [self.view addSubview:_view_4];
    [self.view addSubview:_view_5];
    [self.view addSubview:_view_6];
    [self.view addSubview:_view_7];
    [self.view addSubview:_view_8];
    [self.view addSubview:_view_9];
    
    _view_1.backgroundColor = COLOR_RANDOM;
    _view_2.backgroundColor = COLOR_RANDOM;
    _view_3.backgroundColor = COLOR_RANDOM;
    _view_4.backgroundColor = COLOR_RANDOM;
    _view_5.backgroundColor = COLOR_RANDOM;
    _view_6.backgroundColor = COLOR_RANDOM;
    _view_7.backgroundColor = COLOR_RANDOM;
    _view_8.backgroundColor = COLOR_RANDOM;
    _view_9.backgroundColor = COLOR_RANDOM;
    
    __weak typeof(self)weakSelf = self;
    [_view_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(200, 100));
        make.top.mas_equalTo(weakSelf.view.mas_top).with.offset(200);
        make.centerX.mas_equalTo(weakSelf.view.mas_centerX);
    }];
    [_view_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(weakSelf.view_1).multipliedBy(0.5);
        make.centerX.mas_equalTo(weakSelf.view_1.mas_centerX).centerOffset(CGPointMake(-55, 0));
        make.top.mas_equalTo(weakSelf.view_1.mas_bottom).offset(10);
    }];
    [_view_3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(weakSelf.view_1).multipliedBy(0.5);
        make.centerX.mas_equalTo(weakSelf.view_1.mas_centerX).centerOffset(CGPointMake(55, 0));
        make.top.mas_equalTo(weakSelf.view_1.mas_bottom).offset(10);
    }];
    [_view_4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(weakSelf.view_1);
        make.top.mas_equalTo(weakSelf.view_3.mas_bottom).offset(10);
        make.left.mas_equalTo(weakSelf.view).offset(20);
    }];
    [_view_5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 60));
        make.top.mas_equalTo(weakSelf.view_3.mas_bottom).offset(10);
        make.left.mas_equalTo(weakSelf.view_4.mas_right).offset(10);
    }];
    [_view_6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(200, 40));
        make.top.mas_equalTo(weakSelf.view_4.mas_bottom).with.offset(10);
        make.centerX.mas_equalTo(weakSelf.view.mas_centerX);
    }];
    [_view_7 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(weakSelf.view_6).multipliedBy(1.2);
        make.top.mas_equalTo(weakSelf.view_6.mas_bottom).offset(10);
        make.left.mas_equalTo(weakSelf.view.mas_left).offset(10);
    }];
    [_view_8 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(weakSelf.view_7);
        make.top.mas_equalTo(weakSelf.view_7.mas_bottom).with.offset(10);
        make.right.mas_equalTo(weakSelf.view.mas_right).offset(-10);
    }];
    [_view_9 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(200, 60));
        make.top.mas_equalTo(weakSelf.view_8.mas_bottom).offset(10);
        make.left.mas_equalTo(weakSelf.view).offset(10);
    }];
    
    self.label_1 = [[UILabel alloc]init];
    self.label_2 = [[UILabel alloc]init];
    self.label_3 = [[UILabel alloc]init];
    self.label_4 = [[UILabel alloc]init];
    self.label_5 = [[UILabel alloc]init];
    self.label_6 = [[UILabel alloc]init];
    self.label_7 = [[UILabel alloc]init];
    self.label_8 = [[UILabel alloc]init];
    self.label_9 = [[UILabel alloc]init];
    
    [_view_1 addSubview:_label_1];
    [_view_2 addSubview:_label_2];
    [_view_3 addSubview:_label_3];
    [_view_4 addSubview:_label_4];
    [_view_5 addSubview:_label_5];
    [_view_6 addSubview:_label_6];
    [_view_7 addSubview:_label_7];
    [_view_8 addSubview:_label_8];
    [_view_9 addSubview:_label_9];
    
    _label_1.text = @"transform.rotation";
    _label_2.text = @"position";
    _label_3.text = @"scale";
    _label_4.text = @"opacity";
    _label_5.text = @"translation";
    _label_6.text = @"bounds";
    _label_7.text = @"cornerRadius";
    _label_8.text = @"backgroundColor";
    _label_9.text = @"groupAnimation";
    
    _label_1.textColor = [UIColor whiteColor];
    _label_2.textColor = [UIColor whiteColor];
    _label_3.textColor = [UIColor whiteColor];
    _label_4.textColor = [UIColor whiteColor];
    _label_5.textColor = [UIColor whiteColor];
    _label_6.textColor = [UIColor whiteColor];
    _label_7.textColor = [UIColor whiteColor];
    _label_8.textColor = [UIColor whiteColor];
    _label_9.textColor = [UIColor whiteColor];
    
    [_label_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(weakSelf.view_1);
    }];
    [_label_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(weakSelf.view_2);
    }];
    [_label_3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(weakSelf.view_3);
    }];
    [_label_4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(weakSelf.view_4);
    }];
    [_label_5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(weakSelf.view_5);
    }];
    [_label_6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(weakSelf.view_6);
    }];
    [_label_7 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(weakSelf.view_7);
    }];
    [_label_8 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(weakSelf.view_8);
    }];
    [_label_9 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(weakSelf.view_9);
    }];
    
    UITapGestureRecognizer *tap_1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapOne:)];
    UITapGestureRecognizer *tap_2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapTwo:)];
    UITapGestureRecognizer *tap_3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapThree:)];
    UITapGestureRecognizer *tap_4 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapFour:)];
    UITapGestureRecognizer *tap_5 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapFive:)];
    UITapGestureRecognizer *tap_6 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapSix:)];
    UITapGestureRecognizer *tap_7 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapSeven:)];
    UITapGestureRecognizer *tap_8 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapEight:)];
    UITapGestureRecognizer *tap_9 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapNine:)];
    
    [_view_1 addGestureRecognizer:tap_1];
    [_view_2 addGestureRecognizer:tap_2];
    [_view_3 addGestureRecognizer:tap_3];
    [_view_4 addGestureRecognizer:tap_4];
    [_view_5 addGestureRecognizer:tap_5];
    [_view_6 addGestureRecognizer:tap_6];
    [_view_7 addGestureRecognizer:tap_7];
    [_view_8 addGestureRecognizer:tap_8];
    [_view_9 addGestureRecognizer:tap_9];
    
}

/*
 * 如果动画不放在按钮事件中，直接放到viewDidLoad里，程序首先执行这个controller，这时动画是不会显示的
 * 出现这个问题是因为开机时候系统有个动画，系统动画和这个动画重复了
 */
- (void)viewDidAppear:(BOOL)animated{
    [self addAnimation];
}

- (void)addAnimation{
    self.imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"football"]];
    [self.view addSubview:_imageView];
    
    __weak typeof(self)weakSelf = self;
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view.mas_left).offset(10);
        make.top.equalTo(weakSelf.view.mas_top).offset(100);
    }];
    

    CABasicAnimation *rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    rotation.toValue = [NSNumber numberWithFloat:4 * M_PI];
    rotation.duration = 2;
    rotation.repeatCount = HUGE_VALF;
    rotation.autoreverses = YES;
    rotation.removedOnCompletion = NO;
    //指定动画是否为累加效果,默认为NO
    rotation.cumulative = YES;
    //属性动画是否以当前动画效果为基础,默认为NO
    rotation.additive = YES;
    rotation.fillMode = kCAFillModeBackwards;
    [_imageView.layer addAnimation:rotation forKey:@"rotation"];
}

- (void)tapOne:(UITapGestureRecognizer *)tap{
    
    /*
     * M_PI: 180°弧度
     * rotation:旋转动画keyPath
     * transform.rotation.y: 延y轴旋转
     * transform.rotation.x: 延x轴旋转
     * transform.rotation.z: 中心点旋转
     * HUGE_VALF/HUGE_VAL/HUGE_VALL: 无穷大
     * autoreverses: 是否自动重复
     * repeatCount: 重复次数
     * kCAMediaTimingFunctionLinear: 表示时间方法为线性,匀速转动
     */
    
    CABasicAnimation *rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    rotation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    rotation.toValue = [NSNumber numberWithFloat:4 * M_PI];
    rotation.duration = 2;
    rotation.repeatCount = 1;
    rotation.autoreverses = NO;
    UIView *view = tap.view;
//    rotation.beginTime = CACurrentMediaTime()+2;
    [view.layer addAnimation:rotation forKey:@"rotation"];
}
- (void)tapTwo:(UITapGestureRecognizer *)tap{
    
    CABasicAnimation *position = [CABasicAnimation animationWithKeyPath:@"position"];
    position.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    position.toValue = [NSValue valueWithCGPoint:_view_1.center];
    position.removedOnCompletion = YES;
    position.duration = 1;
    position.fillMode = kCAFillModeBackwards;
    [_view_2.layer addAnimation:position forKey:@"positionAnimation"];
    
    
    
}
- (void)tapThree:(UITapGestureRecognizer *)tap{
    
    CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scale.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    scale.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 1)];
//    scale.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(2, 2, 2)];
    scale.toValue = [NSNumber numberWithFloat:0.5];
    scale.removedOnCompletion = YES;
    scale.duration = 2;
    scale.fillMode = kCAFillModeBackwards;
//    scale.beginTime = CACurrentMediaTime()+2;
    [_view_3.layer addAnimation:scale forKey:@"scaleAnimation"];
   
}

- (void)tapFour:(UITapGestureRecognizer *)tap{
    
    CABasicAnimation *opacity = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacity.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    opacity.fromValue = [NSNumber numberWithFloat:1.0f];
    opacity.toValue = [NSNumber numberWithFloat:0.3];
    opacity.removedOnCompletion = YES;
    opacity.duration = 3;
    opacity.fillMode = kCAFillModeForwards;
    [_view_4 .layer addAnimation:opacity forKey:@"optionAnimation"];
}

- (void)tapFive:(UITapGestureRecognizer *)tap{
//    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"bounds"];
//    animation.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 50, 20)];
//    animation.duration = 2;
//    animation.removedOnCompletion = YES;
//    animation.fillMode = kCAFillModeForwards;
//    [_view_5.layer addAnimation:animation forKey:@"boundsAnimationr"];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation"];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(0, 100)];
    animation.duration = 3;
    animation.repeatCount =1;
    animation.autoreverses = NO;
    animation.removedOnCompletion = YES;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [_view_5.layer addAnimation:animation forKey:@"translation"];
}

- (void)tapSix:(UITapGestureRecognizer *)tap{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"bounds.size.width"];
//    animation.toValue = [NSValue valueWithCGSize:CGSizeMake(200, 200)];
    animation.toValue = [NSNumber numberWithFloat:400];
    animation.duration = 2;
    animation.repeatCount = 1;
    animation.autoreverses = NO;
    animation.removedOnCompletion = NO;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [_view_6.layer addAnimation:animation forKey:@"sizeAnimationr"];
}

- (void)tapSeven:(UITapGestureRecognizer *)tap{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    animation.toValue = [NSNumber numberWithFloat:20.0];
    animation.duration = 2;
    animation.repeatCount = 1;
    animation.autoreverses = NO;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [_view_7.layer addAnimation:animation forKey:@"radiusAnimation"];
}

- (void)tapEight:(UITapGestureRecognizer *)tap{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    animation.toValue = (id)COLOR_RANDOM.CGColor;
    animation.duration = 2;
//    animation.repeatCount = 1;
//    animation.autoreverses = NO;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [_view_8.layer addAnimation:animation forKey:@"backgroundColorAnimation"];
}

- (void)tapNine:(UITapGestureRecognizer *)tap{
    CABasicAnimation *animation_1 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animation_1.toValue = [NSNumber numberWithFloat:4*M_PI];
    CABasicAnimation *animation_2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation_2.toValue = [NSNumber numberWithFloat:0.2];
    CABasicAnimation *animation_3 = [CABasicAnimation animationWithKeyPath:@"position"];
    animation_3.toValue = [NSValue valueWithCGPoint:CGPointMake(1125, 1000)];
    CABasicAnimation *animation_4 = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    animation_4.toValue = [NSNumber numberWithFloat:30.0];
    CABasicAnimation *animation_5 = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation_5.toValue = [NSNumber numberWithFloat:0.5];
    CABasicAnimation *animation_6 = [CABasicAnimation animationWithKeyPath:@"position"];
    animation_6.toValue = [NSValue valueWithCGPoint:CGPointMake(50.0, 100.0)];
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = [NSArray arrayWithObjects:animation_1,animation_2,animation_3,animation_4,animation_5,animation_6, nil];
    animationGroup.duration = 5;
    [_view_9.layer addAnimation:animationGroup forKey:@"animationGroup"];
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
