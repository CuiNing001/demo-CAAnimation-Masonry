//
//  FirstViewController.m
//  Masonry
//
//  Created by mading shouyou on 2018/6/28.
//  Copyright © 2018年 mading shouyou. All rights reserved.
//

#import "FirstViewController.h"
#import <SDCycleScrollView/SDCycleScrollView.h>
#import "CollectionViewCell.h"

@interface FirstViewController ()<SDCycleScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UIView *view_1;
@property (strong, nonatomic) UIView *view_2;
@property (strong, nonatomic) UIView *view_3;
@property (strong, nonatomic) UIView *view_4;
@property (strong, nonatomic) UIView *view_5;
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UICollectionView *collection;
@property (strong, nonatomic) SDCycleScrollView *cycleView;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpUI];
}

- (void)setUpUI{
    
    self.view_1 = [[UIView alloc]init];
    self.view_2    = [[UIView alloc]init];
    self.view_3 = [[UIView alloc]init];
    self.view_4 = [[UIView alloc]init];
    self.view_5 = [[UIView alloc]init];
    [self.view addSubview:_view_1];
    [self.view addSubview:_view_2];
    [self.view addSubview:_view_3];
    [self.view addSubview:_view_4];
    [self.view addSubview:_view_5];
    _view_1.backgroundColor = COLOR_RANDOM;
    _view_2.backgroundColor = COLOR_RANDOM;
    _view_3.backgroundColor = COLOR_RANDOM;
    _view_4.backgroundColor = COLOR_RANDOM;
    _view_5.backgroundColor = COLOR_RANDOM;
    
    __weak typeof(self)weakSelf = self;
    [_view_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view).offset(88);
        make.left.equalTo(weakSelf.view).offset(0);
        make.right.equalTo(weakSelf.view).offset(0);
        make.height.mas_equalTo(40);
    }];
    [_view_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view_1.mas_bottom).offset(0);
        make.left.equalTo(weakSelf.view).offset(0);
        make.right.equalTo(weakSelf.view).offset(0);
        make.height.equalTo(weakSelf.view).multipliedBy(0.2);
    }];
    [_view_3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view_2.mas_bottom).offset(0);
        make.left.equalTo(weakSelf.view.mas_left).offset(0);
        make.right.equalTo(weakSelf.view.mas_right).offset(0);
        make.height.equalTo(weakSelf.view_2);
    }];
    [_view_4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view_3.mas_bottom).offset(0);
        make.left.equalTo(weakSelf.view).offset(0);
        make.right.equalTo(weakSelf.view).offset(0);
        make.bottom.equalTo(weakSelf.view_5.mas_top).offset(0);
    }];
    [_view_5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view).offset(0);
        make.right.equalTo(weakSelf.view).offset(0);
        make.bottom.equalTo(weakSelf.view.mas_bottom).offset(-83);
        make.height.mas_equalTo(30);
    }];
    
    
    UILabel *copyRight = [[UILabel alloc]init];
    copyRight.text = @"Copyright © 2018 Apple Inc. All rights reserved.";
    copyRight.font = [UIFont systemFontOfSize:10];
    [self.view_5 addSubview:copyRight];
    [copyRight mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(weakSelf.view_5);
    }];
    
    UIImageView *logo = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"logo"]];
    [self.view_1 addSubview:logo];
    [logo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(70, 25));
        make.left.equalTo(weakSelf.view_1.mas_left).offset(10);
        make.centerY.mas_equalTo(weakSelf.view_1.mas_centerY);
    }];
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view_1 addSubview:loginBtn];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setTintColor:[UIColor whiteColor]];
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.view_1.mas_centerY);
        make.right.equalTo(weakSelf.view_1.mas_right).offset(-10);
    }];
    UIButton *registBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view_1 addSubview:registBtn];
    [registBtn setTitle:@"注册" forState:UIControlStateNormal];
    [registBtn setTintColor:[UIColor whiteColor]];
    registBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [registBtn addTarget:self action:@selector(regist) forControlEvents:UIControlEventTouchUpInside];
    [registBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.view_1.mas_centerY);
        make.right.equalTo(loginBtn.mas_left).offset(-10);
    }];
    
    self.cycleView = [[SDCycleScrollView alloc]init];
    [self.view_2 addSubview:_cycleView];
    self.cycleView.localizationImageNamesGroup = @[@"1.jpg",@"2.jpg"];
    self.cycleView.delegate = self;
    [self.cycleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view_2.mas_top).offset(0);
        make.left.equalTo(weakSelf.view_2.mas_left).offset(0);
        make.bottom.equalTo(weakSelf.view_2.mas_bottom).offset(0);
        make.right.equalTo(weakSelf.view_2.mas_right).offset(0);
    }];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(40, 40);
    flowLayout.minimumLineSpacing = 10;
    flowLayout.minimumInteritemSpacing = 10;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    self.collection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, self.view_3.frame.origin.y, SCREEN_WIDTH,self.view.frame.size.height/5) collectionViewLayout:flowLayout];
    [self.view_3 addSubview:self.collection];
    self.collection.dataSource = self;
    self.collection.delegate = self;
    self.collection.backgroundColor = COLOR_BG_MAIN;
    [self.collection registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"collectionCell"];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, self.view_4.frame.origin.y, SCREEN_WIDTH, 300) style:UITableViewStyleGrouped];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"tableViewCell"];
    [self.view_4 addSubview:self.tableView];
}

- (void)login{
    NSLog(@"login");
}
- (void)regist{
    NSLog(@"regist");
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 2;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableViewCell" forIndexPath:indexPath];
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"tableViewCell"];
    cell.textLabel.text = @"111";
    cell.detailTextLabel.text = @"aaa";
    return cell;
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
