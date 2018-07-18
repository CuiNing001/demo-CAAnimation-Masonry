//
//  MoreAnimationViewController.m
//  Masonry
//
//  Created by mading shouyou on 2018/7/12.
//  Copyright © 2018年 mading shouyou. All rights reserved.
//

#import "MoreAnimationViewController.h"

@interface MoreAnimationViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UIVisualEffectView *sideBarView;
@property (strong, nonatomic) NSMutableArray *buttonArr;

@end

static int touchCount = 0;

@implementation MoreAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"MoreViewBlockAnimation";
    self.view.backgroundColor = COLOR_BG_MAIN;
    
    [self setUpUI];
    [self viewSetUpUI];
}

- (void)setUpUI{
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(moreAnimation:)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    self.sideBarView = [[UIVisualEffectView alloc]initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark]];
    self.sideBarView.frame = CGRectMake(SCREEN_WIDTH,0,0,0);
    [self.view addSubview:self.sideBarView];
//    self.sideBarView.alpha = 0.5;
    self.sideBarView.layer.masksToBounds = YES;
    self.sideBarView.layer.cornerRadius = 10;
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(10, 10, SCREEN_WIDTH-230, 480) style:UITableViewStylePlain];
    [self.sideBarView.contentView addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.buttonArr = @[@"包含时间和动画",@"带完成后回调",@"可设置延时时间和过渡效果",@"Spring动画",@"keyframes动画",@"转场动画"].mutableCopy;
    tableView.layer.masksToBounds = YES;
    tableView.layer.cornerRadius = 10;
}

- (void)moreAnimation:(UIBarButtonItem *)sender{
    touchCount++;
    if (touchCount%2==0) {
        [UIView animateWithDuration:2 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:5.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.sideBarView.frame = CGRectMake(SCREEN_WIDTH,0,0,0);
        } completion:^(BOOL finished) {
            
        }];
    }else{
        [UIView animateWithDuration:2 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:5.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.sideBarView.frame = CGRectMake(190, 90, SCREEN_WIDTH-20-190, 500);
        } completion:^(BOOL finished) {
            
        }];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.buttonArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text = self.buttonArr[indexPath.row];
    cell.textLabel.numberOfLines = 2;
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.backgroundColor = COLOR_RANDOM;
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    cell.textLabel.font = [UIFont systemFontOfSize:12];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0)
    {
        [self viewAnimationOne];
    }
    else if (indexPath.row==1)
    {
        [self viewAnimationTwo];
    }
    else if (indexPath.row==2)
    {
        [self viewAnimationThree];
    }
    else if (indexPath.row==3)
    {
        [self viewAnimationFour];
    }
    else if (indexPath.row==4)
    {
        [self viewAnimationFive];
    }
    else if (indexPath.row==5)
    {
        [self viewAnimationSix];
    }
}

- (void)viewSetUpUI{
    UIView *view_1 = [[UIView alloc]init];
    [self.view addSubview:view_1];
    __weak typeof(self)weakSelf = self;
    [view_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(150, 100));
        make.centerX.mas_equalTo(weakSelf.view.mas_centerX);
        make.bottom.mas_equalTo(weakSelf.view.mas_bottom).with.offset(-50);
    }];
    view_1.backgroundColor = COLOR_RANDOM;
    view_1.layer.masksToBounds = YES;
    view_1.layer.cornerRadius = 5;
    UITapGestureRecognizer *tap_1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(viewOneTap:)];
    [view_1 addGestureRecognizer:tap_1];
    view_1.tag = 1001;
    
    UIView *view_2 = [[UIView alloc]init];
    [self.view addSubview:view_2];
    [view_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(view_1).multipliedBy(0.7);
        make.bottom.mas_equalTo(view_1.mas_top).offset(-10);
        make.left.mas_equalTo(weakSelf.view.mas_left).offset(20);
    }];
    view_2.backgroundColor = COLOR_RANDOM;
    view_2.layer.masksToBounds = YES;
    view_2.layer.cornerRadius = 5;
    UITapGestureRecognizer *tap_2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(viewTwoTap:)];
    [view_2 addGestureRecognizer:tap_2];
    view_2.tag = 1002;
    
    UILabel *label_1 = [[UILabel alloc]init];
    [view_1 addSubview:label_1];
    [label_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(view_1);
    }];
    label_1.textColor = [UIColor whiteColor];
    label_1.text = @"label_1";
    label_1.font = [UIFont systemFontOfSize:12];
    label_1.tag = 1003;
    
    UIView *view_3 = [[UIView alloc]init];
    [self.view addSubview:view_3];
    [view_3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 100));
        make.left.equalTo(self.view).mas_offset(10);
        make.top.equalTo(self.view).offset(150);
    }];
    view_3.backgroundColor = COLOR_RANDOM;
    view_3.layer.masksToBounds = YES;
    view_3.layer.cornerRadius = 5;
    UILabel *label_3 = [[UILabel alloc]init];
    [view_3 addSubview:label_3];
    [label_3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(view_3);
    }];
    label_3.text = @"label_3";
    label_3.textColor = [UIColor whiteColor];
    label_3.font = [UIFont systemFontOfSize:12];
    view_3.tag = 1004;
    
}

- (void)viewOneTap:(UITapGestureRecognizer *)tap{
    
}

- (void)viewTwoTap:(UITapGestureRecognizer *)tap{
    
}

#pragma mark - 参数包含时间和动画,无结束回调事件
- (void)viewAnimationOne{
    UIView *view_1 = [self.view viewWithTag:1001];
    UIView *view_2 = [self.view viewWithTag:1002];
    
    [UIView animateWithDuration:2 animations:^{
        view_2.center = view_1.center;
    }];
}

#pragma mark - 参数包含时间和动画,有结束回调事件
- (void)viewAnimationTwo{
    UIView *view_1 = [self.view viewWithTag:1001];
    UIView *view_2 = [self.view viewWithTag:1002];
    [UIView animateWithDuration:2 animations:^{
        view_1.layer.cornerRadius = 50;
        view_2.layer.cornerRadius = 35;
    } completion:^(BOOL finished) {
        
    }];
    
}

#pragma mark - 参数包含动画时间/延时时间/过渡效果,有结束回调事件
- (void)viewAnimationThree{
    UIView *view_1 = [self.view viewWithTag:1001];
    UIView *view_2 = [self.view viewWithTag:1002];
    [UIView animateWithDuration:2 delay:2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        view_1.layer.cornerRadius = 5;
        view_2.layer.cornerRadius = 5;
        view_2.frame = view_1.frame;
    } completion:^(BOOL finished) {
        
    }];
}

#pragma mark - Spring动画:参数有动画时间/延时时间/震动效果/初始速度/过渡效果,有结束回调事件
- (void)viewAnimationFour{
    UIView *view_1 = [self.view viewWithTag:1001];
    UIView *view_2 = [self.view viewWithTag:1002];
    [UIView animateWithDuration:2 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        view_2.frame = CGRectMake(50, view_1.frame.origin.y-10-view_1.frame.size.height*0.7, view_1.frame.size.width*0.7, view_1.frame.size.height*0.7);
    } completion:^(BOOL finished) {
        
    }];
}

#pragma mark - Keyframes动画:参数有动画时间/延时时间/过渡效果,有结束回调事件,需要在动画回调内添加关键帧
- (void)viewAnimationFive{
    UIView *view_1 = [self.view viewWithTag:1001];
    UIView *view_2 = [self.view viewWithTag:1002];
    [UIView animateKeyframesWithDuration:8.0 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeCubicPaced animations:^{
        [UIView addKeyframeWithRelativeStartTime:.0f relativeDuration:1.0/4 animations:^{
            view_1.backgroundColor = COLOR_RANDOM;
        }];
        [UIView addKeyframeWithRelativeStartTime:1.0/4 relativeDuration:1.0/4 animations:^{
            view_2.frame = CGRectMake(50, view_1.frame.origin.y-10-view_1.frame.size.height*0.7, 100, 100);
            view_2.layer.cornerRadius = 50;
// ?????           view_1.layer.transform = CATransform3DMakeRotation(M_PI, 0, 1, 0);
        }];
        [UIView addKeyframeWithRelativeStartTime:1.0/4 relativeDuration:1.0/4 animations:^{
            view_1.backgroundColor = COLOR_RANDOM;
            view_2.center = view_1.center;
        }];
        [UIView addKeyframeWithRelativeStartTime:1.0/4 relativeDuration:1.0/4 animations:^{
            view_1.backgroundColor = COLOR_RANDOM;
            view_2.frame = CGRectMake(50, view_1.frame.origin.y-10-view_1.frame.size.height*0.7, view_1.frame.size.width*0.7, view_1.frame.size.height*0.7);
            view_2.layer.cornerRadius = 5;
        }];
    } completion:^(BOOL finished) {
        
    }];
}

#pragma mark - 转场动画:参数有fromView/toView/动画时间/过渡效果
- (void)viewAnimationSix{
    // 单个视图转场效果
    UIView *view_1 = [self.view viewWithTag:1001];
    UILabel *label_3 = [view_1 viewWithTag:1003];
    [UIView transitionWithView:view_1 duration:2 options:UIViewAnimationOptionTransitionFlipFromBottom animations:^{
        label_3.text = @"label_3";
    } completion:^(BOOL finished) {
        
    }];
    
    // 两个视图转场效果:会将fromView从父视图删除,将toView添加到视图
    UIView *view_3 = [self.view viewWithTag:1004];
    UIView *view_4 = [[UIView alloc]initWithFrame:view_3.frame];
    [self.view addSubview:view_4];
    view_4.backgroundColor = COLOR_RANDOM;
    view_4.layer.masksToBounds = YES;
    view_4.layer.cornerRadius = 50;
    [UIView transitionFromView:view_3 toView:view_4 duration:2 options:UIViewAnimationOptionTransitionCrossDissolve completion:^(BOOL finished) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidDisappear:(BOOL)animated{
    touchCount++;
}

- (NSMutableArray *)buttonArr{
    if (!_buttonArr) {
        self.buttonArr = [NSMutableArray array];
    }
    return _buttonArr;
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
