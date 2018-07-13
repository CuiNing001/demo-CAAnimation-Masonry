//
//  FifthViewController.m
//  Masonry
//
//  Created by mading shouyou on 2018/7/11.
//  Copyright © 2018年 mading shouyou. All rights reserved.
//

#import "FifthViewController.h"
#import "MoreAnimationViewController.h"

@interface FifthViewController ()

@property (strong, nonatomic) UIImageView *gifImageView;
@property (strong, nonatomic) UIImageView *rabbitImageView;
@property (strong, nonatomic) UILabel *imageLabel;
@property (strong, nonatomic) UILabel *viewAniLabel;
@property (strong, nonatomic) UILabel *viewBlockAniLabel;

@property (strong, nonatomic) UIView *view_1;
@property (strong, nonatomic) UIView *view_2;
@property (strong, nonatomic) UILabel *label_1;
@property (strong, nonatomic) UILabel *label_2;

@property (assign, nonatomic) CGRect originalFrame;


@end

@implementation FifthViewController

- (void)viewWillDisappear:(BOOL)animated{
    CATransition *animation = [CATransition animation];
    animation.type = kCATransitionFade;
    animation.duration = 0.25;
    [self.tabBarController.view.layer addAnimation:animation forKey:@"animation"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"View类方法动画";
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = item;
    
    // gif 动图
    [self setUpUI];
    
    // View类动画
    [self viewAniSetUpUI];
    
    // view block动画
    [self viewBlockAnimation];
}

- (void)setUpUI{

    __weak typeof(self)weakSelf = self;
    self.imageLabel = [[UILabel alloc]init];
    [self.view addSubview:self.imageLabel];
    [_imageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top).offset(100);
        make.left.equalTo(weakSelf.view.mas_left).offset(10);
        make.right.equalTo(weakSelf.view.mas_right).offset(-10);
        make.height.mas_equalTo(40);
    }];
    _imageLabel.text = @"  [UIImage animationImageNamed:@\"\" duration:1]\n  [UIImage animtaionWithImages:imageArr duration:1]";
    _imageLabel.font = [UIFont systemFontOfSize:12];
    _imageLabel.textColor = [UIColor whiteColor];
    _imageLabel.numberOfLines = 0;
    _imageLabel.backgroundColor = [UIColor blackColor];
    _imageLabel.layer.masksToBounds = YES;
    _imageLabel.layer.cornerRadius = 2;
    
    /*
     * [UIImage animationImageNamed:@"" duration:1]
     */
    self.gifImageView = [[UIImageView alloc]init];
    [self.view addSubview:_gifImageView];
    
    [_gifImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top).offset(150);
        make.left.equalTo(weakSelf.view.mas_left).offset(10);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    self.gifImageView.image = [UIImage animatedImageNamed:@"ani_" duration:0.4];
    
     /*
      * 设置五秒后停止动画
      * @param:selector   需要执行的方法
      * @param:object     需要传递的参数
      * @param:afterDelay 延迟时间
      */
//    [self performSelector:@selector(stopImageAnimation) withObject:nil afterDelay:5];
    
    /*
     * [UIImage animtaionWithImages:imageArr duration:1];
     */
    self.rabbitImageView = [[UIImageView alloc]init];
    [self.view addSubview:_rabbitImageView];
    [_rabbitImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(weakSelf.gifImageView);
        make.centerY.mas_equalTo(weakSelf.gifImageView);
        make.left.mas_equalTo(weakSelf.gifImageView.mas_right).offset(10);
    }];
    UIImage *image = [UIImage animatedImageNamed:@"rabbit_" duration:1];
    NSArray *imageArr = [NSArray arrayWithArray:image.images];
//    NSArray *imageArr = [NSArray arrayWithObjects:[UIImage imageNamed:@"rabbit_"],
//                                                  [UIImage imageNamed:@"rabbit_1"],
//                                                  [UIImage imageNamed:@"rabbit_2"],nil];
    _rabbitImageView.animationImages = imageArr;
    _rabbitImageView.animationDuration = 2;
    _rabbitImageView.animationRepeatCount = 0;
    [_rabbitImageView startAnimating];
    
    // 设置五秒后停止动画
//    [self performSelector:@selector(stopRabbitAnimation) withObject:nil afterDelay:5];
    
}


- (void)stopImageAnimation{
    _gifImageView.image = [UIImage imageNamed:@"ani_0"];
}

- (void)stopRabbitAnimation{
    [_rabbitImageView stopAnimating];
}

- (void)viewAniSetUpUI{
    
     __weak typeof(self)weakSelf = self;
    self.viewAniLabel = [[UILabel alloc]init];
    [self.view addSubview:self.viewAniLabel];
    [self.viewAniLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.gifImageView.mas_bottom).offset(10);
        make.left.equalTo(weakSelf.view.mas_left).offset(10);
        make.right.equalTo(weakSelf.view.mas_right).offset(-10);
        make.height.mas_equalTo(20);
    }];
    _viewAniLabel.backgroundColor = [UIColor blackColor];
    _viewAniLabel.textColor = [UIColor whiteColor];
    _viewAniLabel.text = @"  View类方法动画";
    _viewAniLabel.font = [UIFont systemFontOfSize:12];
    _viewAniLabel.layer.masksToBounds = YES;
    _viewAniLabel.layer.cornerRadius = 2;

    self.view_1 = [UIView new];
    [self.view addSubview:self.view_1];
    [self.view_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(weakSelf.view);
        make.top.mas_equalTo(weakSelf.viewAniLabel.mas_bottom).offset(10);
        make.size.mas_equalTo(CGSizeMake(200, 100));
    }];
    _view_1.backgroundColor = COLOR_RANDOM;
    _view_1.layer.masksToBounds = YES;
    _view_1.layer.cornerRadius = 5;
    
    self.label_1 = [UILabel new];
    [_view_1 addSubview:_label_1];
    [_label_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(weakSelf.view_1);
    }];
    _label_1.text = @"view_1";
    _label_1.textColor = [UIColor whiteColor];
    _label_1.font = [UIFont systemFontOfSize:12];
    
    self.view_2 = [UIView new];
    [self.view addSubview:_view_2];
    [_view_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(weakSelf.view_1).multipliedBy(0.5);
        make.top.mas_equalTo(weakSelf.view_1.mas_bottom).offset(5);
        make.left.mas_equalTo(weakSelf.view).offset(50);
    }];
    _view_2.backgroundColor = COLOR_RANDOM;
    _view_2.layer.masksToBounds = YES;
    _view_2.layer.cornerRadius = 5;
//    self.originalFrame = _view_2.frame;
//    NSLog(@"view_2:%@--origina:%@",NSStringFromCGRect(_view_2.frame),NSStringFromCGRect(_originalFrame));
    
    self.label_2 = [UILabel new];
    [self.view_2 addSubview:_label_2];
    [_label_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(weakSelf.view_2);
    }];
    _label_2.textColor = [UIColor whiteColor];
    _label_2.font = [UIFont systemFontOfSize:12];
    _label_2.text = @"view_2";
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(changeFrame:)];
    [_view_2 addGestureRecognizer:tap];
    
    UITapGestureRecognizer *tap_1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(changeAnimation:)];
    [_view_1 addGestureRecognizer:tap_1];
}

#pragma mark - 修改尺寸动画
- (void)changeFrame:(UITapGestureRecognizer *)tap{
    self.originalFrame = _view_2.frame;
//    NSLog(@"view_2:%@--origina:%@",NSStringFromCGRect(_view_2.frame),NSStringFromCGRect(_originalFrame));
    [UIView beginAnimations:@"frameAnimation" context:nil];
    [UIView setAnimationDuration:2];
    [UIView setAnimationRepeatCount:1.0f];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationWillStartSelector:@selector(startAni:)];
    [UIView setAnimationDidStopSelector:@selector(stopAni:)];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    _view_2.frame = _view_1.frame;
    [UIView commitAnimations];
}

- (void)startAni:(NSString *)aniID {
    
}

- (void)stopAni:(NSString *)aniID {
    
    [UIView beginAnimations:@"frameAni" context:nil];
    [UIView setAnimationDuration:2];
    [UIView setAnimationRepeatCount:1.0f];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    _view_2.frame = self.originalFrame;
    [UIView commitAnimations];
}
# pragma mark - 转场动画
- (void)changeAnimation:(UITapGestureRecognizer *)tap{
    UIView *view = tap.view;
    [UIView beginAnimations:@"animation" context:nil];
    [UIView setAnimationDuration:2];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationRepeatCount:1];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:view cache:YES];
    [UIView commitAnimations];
}

- (void)viewBlockAnimation{
    __weak typeof(self)weakSelf = self;
    self.viewBlockAniLabel = [UILabel new];
    [self.view addSubview:_viewBlockAniLabel];
    [_viewBlockAniLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.view_2.mas_bottom).offset(10);
        make.left.mas_equalTo(weakSelf.view.mas_left).offset(10);
        make.right.mas_equalTo(weakSelf.view.mas_right).offset(-10);
        make.height.mas_equalTo(20);
    }];
    _viewBlockAniLabel.backgroundColor = [UIColor blackColor];
    _viewBlockAniLabel.textColor = [UIColor whiteColor];
    _viewBlockAniLabel.text = @"  View类方法动画block";
    _viewBlockAniLabel.layer.masksToBounds = YES;
    _viewBlockAniLabel.layer.cornerRadius = 2;
    _viewBlockAniLabel.font = [UIFont systemFontOfSize:12];
    
    UIView *view_1 = [[UIView alloc]init];
    [self.view addSubview:view_1];
    [view_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(weakSelf.view);
        make.top.mas_equalTo(weakSelf.viewBlockAniLabel.mas_bottom).offset(10);
        make.size.mas_equalTo(weakSelf.view_1);
    }];
    view_1.backgroundColor = COLOR_RANDOM;
//    view_1.layer.masksToBounds = YES;
    view_1.layer.cornerRadius = 5;
    view_1.layer.shadowColor = COLOR_RANDOM.CGColor;
    view_1.layer.shadowOffset = CGSizeMake(10, 5);
    view_1.layer.shadowOpacity = 0.5;
    view_1.layer.shadowRadius = 5;
    UILabel *label_1 = [[UILabel alloc]init];
    [view_1 addSubview:label_1];
    [label_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(view_1);
    }];
    label_1.text = @"view_1";
    label_1.textColor = [UIColor whiteColor];
    label_1.font = [UIFont systemFontOfSize:12];
//    label_1.shadowOffset = CGSizeMake(5, 5);
//    label_1.shadowColor = [UIColor orangeColor];
    
    UIView *view_2 = [[UIView alloc]init];
    [self.view addSubview:view_2];
    [view_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(view_1).multipliedBy(0.5);
        make.right.mas_equalTo(weakSelf.view.mas_right).offset(-50);
        make.top.mas_equalTo(view_1.mas_bottom).offset(5);
    }];
    view_2.backgroundColor = COLOR_RANDOM;
    view_2.layer.cornerRadius = 5;
    view_2.layer.shadowColor = COLOR_RANDOM.CGColor;
    view_2.layer.shadowOpacity = 0.5;
    view_2.layer.shadowOffset = CGSizeMake(10, 5);
    UILabel *label_2 = [[UILabel alloc]init];
    [view_2 addSubview:label_2];
    [label_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(view_2);
    }];
    label_2.font = [UIFont systemFontOfSize:12];
    label_2.textColor = [UIColor whiteColor];
    label_2.text = @"view_2";
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(view_2);
        make.left.mas_equalTo(weakSelf.view).offset(50);
        make.centerY.mas_equalTo(view_2.mas_centerY);
    }];
    button.backgroundColor = COLOR_RANDOM;
    button.layer.cornerRadius = 5;
    button.layer.shadowOffset = CGSizeMake(10, 5);
    button.layer.shadowOpacity = 0.5;
    button.layer.shadowColor = COLOR_RANDOM.CGColor;
    [button setTitle:@"MORE" forState:UIControlStateNormal];
    [button setTintColor:[UIColor whiteColor]];
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    [button addTarget:self action:@selector(moreAnimation:) forControlEvents:UIControlEventTouchUpInside];
    
    UITapGestureRecognizer *tap_1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(view1Animation:)];
    [view_1 addGestureRecognizer:tap_1];
    
    UITapGestureRecognizer *tap_2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(view2Animation:)];
    [view_2 addGestureRecognizer:tap_2];
}

- (void)moreAnimation:(UIButton *)sender{
    MoreAnimationViewController *moreVC = [[MoreAnimationViewController alloc]init];
    moreVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:moreVC animated:YES];
}

#pragma mark - block动画
- (void)view1Animation:(UITapGestureRecognizer *)tap{
    UIView *view = tap.view;
    [UIView animateWithDuration:2 animations:^{
        view.transform = CGAffineTransformMakeScale(0.5, 0.5);
    }];
    
    [self performSelector:@selector(originalScale:) withObject:view afterDelay:2];
    
}

- (void)originalScale:(UIView *)view{
    [UIView animateWithDuration:2 animations:^{
        view.layer.transform = CATransform3DMakeScale(1, 1, 1);
    }];
}

- (void)view2Animation:(UITapGestureRecognizer *)tap{
    UIView *view = tap.view;
    [UIView animateWithDuration:2 animations:^{
        view.layer.transform = CATransform3DMakeScale(2, 2, 1);
    } completion:^(BOOL finished) {
        view.layer.transform = CATransform3DMakeScale(1, 1, 1);
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
