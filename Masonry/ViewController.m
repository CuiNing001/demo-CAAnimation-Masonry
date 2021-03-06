//
//  ViewController.m
//  Masonry
//
//  Created by mading shouyou on 2017/12/20.
//  Copyright © 2017年 mading shouyou. All rights reserved.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
   // [self loadSubView];
    
   // [self layoutView];
    
   // [self masonryLayout];
    
    [self masonry];
    
    
}

- (void)layoutView{

    //1.首先，创建视图控件，添加到self.view上
    
    UIView *view_1 = [[UIView alloc] init];
    view_1.backgroundColor = [UIColor redColor];
    [self.view addSubview:view_1];
    UIView *view_2 = [[UIView alloc] init];
    view_2.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view_2];
    UIView *view_3 = [[UIView alloc] init];
    view_3.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view_3];
    
    //2.然后，记得要把AutoresizingMask布局关掉
    view_1.translatesAutoresizingMaskIntoConstraints = NO;
    view_2.translatesAutoresizingMaskIntoConstraints = NO;
    view_3.translatesAutoresizingMaskIntoConstraints = NO;
    
    //3.接着，添加约束，先添加边距约束，再添加宽高约束（个人习惯）
    /*
     * 添加约束 公式：item1.attribute = multiplier ⨉ item2.attribute + constant
     */
    
    //view_1(红色)top 距离self.view的top
    NSLayoutConstraint *view_1TopToSuperViewTop = [NSLayoutConstraint constraintWithItem:view_1
                                                                               attribute:NSLayoutAttributeTop
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                  toItem:self.view
                                                                               attribute:NSLayoutAttributeTop
                                                                              multiplier:1
                                                                                constant:30];
    //view_1(红色)left 距离self.view的left
    NSLayoutConstraint *view_1LeftToSuperViewLeft = [NSLayoutConstraint constraintWithItem:view_1
                                                                                 attribute:NSLayoutAttributeLeft
                                                                                 relatedBy:NSLayoutRelationEqual
                                                                                    toItem:self.view
                                                                                 attribute:NSLayoutAttributeLeft
                                                                                multiplier:1
                                                                                  constant:30];
    //view_1(红色)right 距离view_2(绿色)的left
    NSLayoutConstraint *view_1RightToview_2Left = [NSLayoutConstraint constraintWithItem:view_2
                                                                               attribute:NSLayoutAttributeLeft
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                  toItem:view_1
                                                                               attribute:NSLayoutAttributeRight
                                                                              multiplier:1
                                                                                constant:30];
    //view_1(红色)bottom 距离view_3(蓝色)的top
    NSLayoutConstraint *view_1BottomToview_3Top = [NSLayoutConstraint constraintWithItem:view_1
                                                                               attribute:NSLayoutAttributeBottom
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                  toItem:view_3
                                                                               attribute:NSLayoutAttributeTop
                                                                              multiplier:1
                                                                                constant:- 30];
    
    //view_2(绿色)right 距离self.view的right
    NSLayoutConstraint *view_2RightToSuperViewRight = [NSLayoutConstraint constraintWithItem:view_2
                                                                                   attribute:NSLayoutAttributeRight
                                                                                   relatedBy:NSLayoutRelationEqual
                                                                                      toItem:self.view
                                                                                   attribute:NSLayoutAttributeRight
                                                                                  multiplier:1
                                                                                    constant:- 30];
    
    //view_2(绿色)centerY 和 view_1(红色)的centerY 一致
    NSLayoutConstraint *view_2CenterYToView_1CenterY = [NSLayoutConstraint constraintWithItem:view_2
                                                                                    attribute:NSLayoutAttributeCenterY
                                                                                    relatedBy:NSLayoutRelationEqual
                                                                                       toItem:view_1
                                                                                    attribute:NSLayoutAttributeCenterY
                                                                                   multiplier:1
                                                                                     constant:0];
    
    //view_3(蓝色)left 距离 self.view left
    NSLayoutConstraint *view_3LeftToSuperViewLeft = [NSLayoutConstraint constraintWithItem:view_3
                                                                                 attribute:NSLayoutAttributeLeft
                                                                                 relatedBy:NSLayoutRelationEqual
                                                                                    toItem:self.view
                                                                                 attribute:NSLayoutAttributeLeft
                                                                                multiplier:1
                                                                                  constant:30];
    
    //view_3(蓝色)right 距离 self.view right
    NSLayoutConstraint *view_3RightToSuperViewRight = [NSLayoutConstraint constraintWithItem:view_3
                                                                                   attribute:NSLayoutAttributeRight
                                                                                   relatedBy:NSLayoutRelationEqual
                                                                                      toItem:self.view
                                                                                   attribute:NSLayoutAttributeRight
                                                                                  multiplier:1
                                                                                    constant:- 30];
    
    //view_3(蓝色)Bottom 距离 self.view bottom
    NSLayoutConstraint *view_3BottomToSuperViewBottom = [NSLayoutConstraint constraintWithItem:view_3
                                                                                     attribute:NSLayoutAttributeBottom
                                                                                     relatedBy:NSLayoutRelationEqual
                                                                                        toItem:self.view
                                                                                     attribute:NSLayoutAttributeBottom
                                                                                    multiplier:1
                                                                                      constant:- 30];
    
    //view_1(红色)width 和view_2(绿色)的width相等
    NSLayoutConstraint *view_1WidthToview_2Width = [NSLayoutConstraint constraintWithItem:view_2
                                                                                attribute:NSLayoutAttributeWidth
                                                                                relatedBy:NSLayoutRelationEqual
                                                                                   toItem:view_1
                                                                                attribute:NSLayoutAttributeWidth
                                                                               multiplier:1
                                                                                 constant:0];
    
    //view_1(红色)height 和view_2(绿色)的height相等
    NSLayoutConstraint *view_1HeightToview_2Height = [NSLayoutConstraint constraintWithItem:view_2
                                                                                  attribute:NSLayoutAttributeHeight
                                                                                  relatedBy:NSLayoutRelationEqual
                                                                                     toItem:view_1
                                                                                  attribute:NSLayoutAttributeHeight
                                                                                 multiplier:1
                                                                                   constant:0];
    
    //view_1(红色)height 和 view_3(蓝色)的height相等
    NSLayoutConstraint *view_1HeightToview_3Height = [NSLayoutConstraint constraintWithItem:view_3
                                                                                  attribute:NSLayoutAttributeHeight
                                                                                  relatedBy:NSLayoutRelationEqual
                                                                                     toItem:view_1
                                                                                  attribute:NSLayoutAttributeHeight
                                                                                 multiplier:1
                                                                                   constant:0];
    
    //添加约束，因为view_1、2、3是同层次关系，且他们公有的父视图都是self.view，所以这里把约束都添加到self.view上即可
    [self.view addConstraints:@[view_1TopToSuperViewTop,
                                view_1LeftToSuperViewLeft,
                                view_1RightToview_2Left,
                                view_2RightToSuperViewRight,
                                view_1WidthToview_2Width,
                                view_1BottomToview_3Top,
                                view_2CenterYToView_1CenterY,
                                view_3LeftToSuperViewLeft,
                                view_3RightToSuperViewRight,
                                view_3BottomToSuperViewBottom,
                                view_1HeightToview_2Height,
                                view_1HeightToview_3Height]];
    
    [self.view layoutIfNeeded];
    
  }

- (void)loadSubView{

    // 1.创建控件
    UIView *redView = [[UIView alloc]init];
    
    redView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:redView];
    
    UIView *greenView = [[UIView alloc]init];
    
    greenView.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:greenView];
    
    UIView *yellowView = [[UIView alloc]init];
    
    yellowView.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:yellowView];
    
    // 2.关闭自动布局
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    
    greenView.translatesAutoresizingMaskIntoConstraints = NO;
    
    yellowView.translatesAutoresizingMaskIntoConstraints = NO;
    
    // 3.添加约束
    // 3.1添加redview约束
    // 3.1.1：距离父视图top
    NSLayoutConstraint *redViewLayout_top = [NSLayoutConstraint constraintWithItem:redView
                                                                         attribute:NSLayoutAttributeTop
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:self.view
                                                                         attribute:NSLayoutAttributeTop
                                                                        multiplier:1
                                                                          constant:30];
    
    // 3.1.2：距离父视图left
    NSLayoutConstraint *redViewLayout_left = [NSLayoutConstraint constraintWithItem:redView
                                                                          attribute:NSLayoutAttributeLeft
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self.view
                                                                          attribute:NSLayoutAttributeLeft
                                                                         multiplier:1
                                                                           constant:30];
    
    // 3.1.3：距离下方view的高度
    NSLayoutConstraint *redViewLayout_bottom = [NSLayoutConstraint constraintWithItem:redView
                                                                            attribute:NSLayoutAttributeBottom
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:yellowView
                                                                            attribute:NSLayoutAttributeBottom
                                                                           multiplier:1
                                                                             constant:-30];
    
    // 3.1.4：距离右边view的宽度
    NSLayoutConstraint *redViewLayout_right = [NSLayoutConstraint constraintWithItem:redView
                                                                           attribute:NSLayoutAttributeRight
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:greenView
                                                                           attribute:NSLayoutAttributeRight
                                                                          multiplier:1
                                                                            constant:30];
    
    // 3.2添加greenView约束
    // 3.2.1：距离self.view右边距
    NSLayoutConstraint *greenViewLayout_right = [NSLayoutConstraint constraintWithItem:greenView
                                                                             attribute:NSLayoutAttributeRight
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:self.view
                                                                             attribute:NSLayoutAttributeRight
                                                                            multiplier:1
                                                                              constant:-30];
    
    // 3.2.2：redview和greenview的中心点center_Y一致
    NSLayoutConstraint *greenViewLyout_center = [NSLayoutConstraint constraintWithItem:greenView
                                                                             attribute:NSLayoutAttributeCenterY
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:redView
                                                                             attribute:NSLayoutAttributeCenterY
                                                                            multiplier:1
                                                                              constant:0];
    
    // 3.3添加yellowview约束
    // 3.3.1：yellowView距离父视图左侧约束
    NSLayoutConstraint *yellowViewLayout_left = [NSLayoutConstraint constraintWithItem:yellowView
                                                                        attribute:NSLayoutAttributeLeft
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self.view
                                                                        attribute:NSLayoutAttributeLeft
                                                                       multiplier:1
                                                                         constant:30];
    
    // 3.3.2：yellowview距离父视图右边距约束
    NSLayoutConstraint *yellowViewLayout_right = [NSLayoutConstraint constraintWithItem:yellowView
                                                                        attribute:NSLayoutAttributeRight
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self.view
                                                                        attribute:NSLayoutAttributeRight
                                                                       multiplier:1
                                                                         constant:-30];
    
    // 3.3.3：yellowview距离父视图底部约束
    NSLayoutConstraint *yellowViewLayout_bottom = [NSLayoutConstraint constraintWithItem:yellowView
                                                                               attribute:NSLayoutAttributeBottom
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                  toItem:self.view
                                                                               attribute:NSLayoutAttributeBottom
                                                                              multiplier:1
                                                                                constant:-30];
    
    // 3.4：redview和greenview宽度相等
    NSLayoutConstraint *widthLayout = [NSLayoutConstraint constraintWithItem:greenView
                                                                   attribute:NSLayoutAttributeWidth
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:redView
                                                                   attribute:NSLayoutAttributeWidth
                                                                  multiplier:1
                                                                    constant:0];
    
    // 3.5：redview和greenview高度相等
    NSLayoutConstraint *heightLayout = [NSLayoutConstraint constraintWithItem:greenView
                                                                    attribute:NSLayoutAttributeHeight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:redView
                                                                    attribute:NSLayoutAttributeHeight
                                                                   multiplier:1
                                                                     constant:0];
    
    // 3.6：redview和yellowview高度相等
    NSLayoutConstraint *equalHeightLayout = [NSLayoutConstraint constraintWithItem:yellowView
                                                                         attribute:NSLayoutAttributeHeight
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:redView
                                                                         attribute:NSLayoutAttributeHeight
                                                                        multiplier:1
                                                                          constant:0];
    
    //4.约束添加到self.view上
    [self.view addConstraints:@[redViewLayout_top,
                                redViewLayout_left,
                                redViewLayout_right,
                                redViewLayout_bottom,
                                greenViewLayout_right,
                                greenViewLyout_center,
                                yellowViewLayout_left,
                                yellowViewLayout_right,
                                yellowViewLayout_bottom,
                                widthLayout,
                                heightLayout,
                                equalHeightLayout]];
    
    
    [self.view layoutIfNeeded];
    
    
    
    
}

- (void)masonryLayout{

    // 1.创建控件
    UIView *redView = [[UIView alloc]init];
    
    redView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:redView];
    
    UIView *greenView = [[UIView alloc]init];
    
    greenView.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:greenView];
    
    UIView *yellowView = [[UIView alloc]init];
    
    yellowView.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:yellowView];
    
    // 2.关闭自动布局
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    
    greenView.translatesAutoresizingMaskIntoConstraints = NO;
    
    yellowView.translatesAutoresizingMaskIntoConstraints = NO;
    
    // 3.masonry布局
    // 3.1redview约束
    __weak typeof(self)weakSelf = self;
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        // 距上30
        make.top.equalTo(weakSelf.view.mas_top).with.offset(30);
        
        // 距左30
        make.left.equalTo(weakSelf.view.mas_left).with.offset(30);
        
        
    }];
    
    // 3.2greenview约束
    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        // 和redview中心点平行
        make.centerY.equalTo(redView.mas_centerY).with.offset(0);
        
        // 距右30
        make.right.equalTo(weakSelf.view.mas_left).with.offset(-30);
        
        // 距离redview30
        make.left.equalTo(redView.mas_left).with.offset(30);
        
        // 宽高和redview相同
        make.width.equalTo(redView);
        
        make.height.equalTo(redView);
    }];
    
    //3.3 yellowview约束
    [yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        // 上距离redview30px
        make.top.equalTo(redView.mas_bottom).with.offset(30);
        
        // 距离左30
        make.left.equalTo(weakSelf.view.mas_left).with.offset(30);
        
        // 距离右30
        make.right.equalTo(weakSelf.view.mas_right).with.offset(-30);
        
        // 高度和redview相同
        make.height.equalTo(redView);
        
        
    }];
    
}

- (void)masonry{

    /*
     * 需求
     *
     * 我们需要布局红(view_1)、绿(view_2)、蓝(view_3)三个view位置如图所示，
     * 他们距离父视图边距以及相互之间的距离都为30px，红色view和绿色view宽度相等，
     * 并且三个view的高度相等。并且在横屏时，他们的位置还是一样保持不变。
     *
     */
    
    //1.首先，创建视图控件，添加到self.view上
    
    UIView *view_1 = [[UIView alloc] init];
    view_1.backgroundColor = [UIColor redColor];
    [self.view addSubview:view_1];
    UIView *view_2 = [[UIView alloc] init];
    view_2.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view_2];
    UIView *view_3 = [[UIView alloc] init];
    view_3.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view_3];
    
    //2.然后，记得要把AutoresizingMask布局关掉
    view_1.translatesAutoresizingMaskIntoConstraints = NO;
    view_2.translatesAutoresizingMaskIntoConstraints = NO;
    view_3.translatesAutoresizingMaskIntoConstraints = NO;
    
    //3.接着，添加约束
    
    __weak __typeof(self) weakSelf = self;//这里用一个弱引用来表示self，用于下面的Block中
    
    //先确定view_1的约束
    [view_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top).with.offset(30); //view_1的上，距离self.view是30px
        make.left.equalTo(weakSelf.view.mas_left).with.offset(30); //view_1de左，距离self.view是30px
    }];
    
    //然后确定view_2的约束
    [view_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(view_1.mas_centerY).with.offset(0); //view2 Y方向上的中心线和view_1相等
        make.left.equalTo(view_1.mas_right).with.offset(30); //view2 的左距离view_1的右距离为30px
        make.right.equalTo(weakSelf.view.mas_right).with.offset(-30); //view_2的右距离self.view30px
        make.width.equalTo(view_1); //view_2的宽度和view_1相等
        make.height.equalTo(view_1); //view_2的高度和view_1相等
    }];
    
    //最后确定view_3的约束
    [view_3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view_1.mas_bottom).with.offset(30); //view_3的上距离view_1的底部 30px
        make.left.equalTo(weakSelf.view.mas_left).with.offset(30); //view_3的左距离self.view 30px
        make.bottom.equalTo(weakSelf.view.mas_bottom).with.offset(30);//view_3的底部距离self.view 30px
        make.right.equalTo(weakSelf.view.mas_right).with.offset(-30); //view_3的右距离self.view 30px
        make.height.equalTo(view_1);//view_3的高度和view_1相等
    }];
    
 }


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
