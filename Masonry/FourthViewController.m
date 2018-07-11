//
//  FourthViewController.m
//  Masonry
//
//  Created by mading shouyou on 2018/6/28.
//  Copyright © 2018年 mading shouyou. All rights reserved.
//

#import "FourthViewController.h"

@interface FourthViewController ()<UITableViewDelegate,UITableViewDataSource,CAAnimationDelegate>

@property (strong, nonatomic) UIView *view_1;
@property (strong, nonatomic) UIView *view_2;

@property (strong, nonatomic) UILabel *label_1;
@property (strong, nonatomic) UILabel *label_2;

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *animationArr;
@property (strong, nonatomic) NSArray *animationArrName;
@property (strong, nonatomic) NSArray *animationArr_1;
@property (strong, nonatomic) NSArray *animationArr_1Name;

@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"CATransition";
    
    [self setUpUI];
    [self setUpTableView];
}

- (void)setUpUI{
    
    self.view_1 = [UIView new];
    _view_1.backgroundColor = COLOR_RANDOM;
    self.view_2 = [UIView new];
    _view_2.backgroundColor = COLOR_RANDOM;
    
    [self.view addSubview:_view_1];
    [self.view addSubview:_view_2];
    
    _view_1.layer.masksToBounds = YES;
    _view_1.layer.cornerRadius = 75;
    
    _view_2.layer.masksToBounds = YES;
    _view_2.layer.cornerRadius = 60;
    
    __weak typeof(self)weakSelf = self;
    [_view_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(150, 150));
        make.centerX.mas_equalTo(weakSelf.view).offset(80);
        make.centerY.mas_equalTo(weakSelf.view).offset(-80);
    }];
    [_view_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(weakSelf.view_1).multipliedBy(0.8);
        make.center.mas_equalTo(weakSelf.view_1);
    }];
    
    self.label_1 = [UILabel new];
    _label_1.text = @"label_1";
    _label_1.textColor = [UIColor whiteColor];
    [_view_1 addSubview:_label_1];
    [_label_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(weakSelf.view_1);
    }];
    self.label_2 = [UILabel new];
    _label_2.text = @"label_2";
    _label_2.textColor = [UIColor whiteColor];
    [_view_2 addSubview:_label_2];
    [_label_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(weakSelf.view_2);
    }];
}

- (void)setUpTableView{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 88, 140, 750) style:UITableViewStyleGrouped];
    [self.view addSubview:_tableView];
    self.tableView.backgroundColor = COLOR_RANDOM;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    self.animationArr = [NSArray arrayWithObjects:@"kCATransitionFade",@"kCATransitionMoveIn",@"kCATransitionPush",@"kCATransitionReveal", nil];
    self.animationArrName = @[@"淡入淡出",@"覆盖",@"推出",@"揭开"];
    self.animationArr_1 = @[@"cube",@"suckEffect",@"oglFlip",@"rippleEffect",@"p7ageCurl",@"pageUnCurl",@"cameraIrisHollowClose",@"cameraIrisHollowOpen"];
    self.animationArr_1Name = @[@"翻转",@"移到左上角消失",@"绕中心翻转",@"文本抖动",@"渐变",@"翻书",@"镜头打开",@"镜头关闭"];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    CATransition *transition = [CATransition animation];
//    transition.type = @"rippleEffect";
//    transition.subtype = kCATransitionFromLeft;
//    transition.duration = 3.0f;
//    _view_2.hidden = YES;
//    [_view_2.layer addAnimation:transition forKey:@"transition"];
    _view_2.hidden = NO;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return self.animationArr.count;
    }else{
        return self.animationArr_1.count;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section==0) {
        NSString *title = @"公用API";
        return title;
    }else{
        NSString *title = @"私有API";
        return title;
    }
}
// 修改header title颜色和background颜色
-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section{
    UITableViewHeaderFooterView *headerView = (UITableViewHeaderFooterView *)view;
    headerView.textLabel.textColor = [UIColor whiteColor];
//    headerView.contentView.backgroundColor = [UIColor yellowColor];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    if (indexPath.section==0) {
        cell.textLabel.text = self.animationArr[indexPath.row];
        cell.detailTextLabel.text = self.animationArrName[indexPath.row];
    }else{
        cell.textLabel.text = self.animationArr_1[indexPath.row];
        cell.detailTextLabel.text = self.animationArr_1Name[indexPath.row];
    }
    cell.textLabel.font = [UIFont systemFontOfSize:10];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:10];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0)
    {
        if (indexPath.row==0)
        {
            [self addTransitionWithType:kCATransitionFade subType:kCATransitionFromLeft];
        }
        else if (indexPath.row==1)
        {
            [self addTransitionWithType:kCATransitionMoveIn subType:kCATransitionFromRight];
        }
        else if (indexPath.row==2)
        {
            [self addTransitionWithType:kCATransitionPush subType:kCATransitionFromTop];
        }
        else if (indexPath.row==3)
        {
            [self addTransitionWithType:kCATransitionReveal subType:kCATransitionFromBottom];
        }
    }
    else
    {
        if (indexPath.row==0)
        {
            [self addTransitionWithType:@"cube" subType:kCATransitionFromLeft];
        }
        else if (indexPath.row==1)
        {
            [self addTransitionWithType:@"suckEffect" subType:kCATransitionFromRight];
        }
        else if (indexPath.row==2)
        {
            [self addTransitionWithType:@"oglFlip" subType:kCATransitionFromTop];
        }
        else if (indexPath.row==3)
        {
            [self addTransitionWithType:@"rippleEffect" subType:kCATransitionFromBottom];
        }
        else if (indexPath.row==4)
        {
            [self addTransitionWithType:@"p7ageCurl" subType:kCATransitionFromLeft];
        }
        else if (indexPath.row==5)
        {
            [self addTransitionWithType:@"pageUnCurl" subType:kCATransitionFromRight];
        }
        else if (indexPath.row==6)
        {
            [self addTransitionWithType:@"cameraIrisHollowClose" subType:kCATransitionFromTop];
        }
        else if (indexPath.row==7)
        {
            [self addTransitionWithType:@"cameraIrisHollowOpen" subType:kCATransitionFromBottom];
        }
    }
}

- (void)addTransitionWithType:(NSString *)key subType:(NSString *)subType{
    CATransition *animation = [CATransition animation];
    animation.type = key;
    animation.subtype = subType;
    animation.duration = 3.0f;
    _view_2.hidden = YES;
    animation.delegate = self;
    [_view_2.layer addAnimation:animation forKey:@"animation"];
}

// 动画结束后恢复view_2状态
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    _view_2.hidden = NO;
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
