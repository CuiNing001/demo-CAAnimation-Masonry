//
//  AppDelegate.m
//  Masonry
//
//  Created by mading shouyou on 2017/12/20.
//  Copyright © 2017年 mading shouyou. All rights reserved.
//

#import "AppDelegate.h"
#import "CTabbarViewController.h"

@interface AppDelegate ()<UITabBarControllerDelegate>

@property(strong, nonatomic) CTabbarViewController *tabBarController;
@property(assign, nonatomic) NSInteger selectIndex;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.tabBarController = [[CTabbarViewController alloc]init];
    
//    [tabBarController.tabBar setBarStyle:UIBarStyleBlack];
    self.window.rootViewController = _tabBarController;
    self.tabBarController.delegate = self;
    self.window.backgroundColor = [UIColor whiteColor];
    // 设置导航栏返回按钮颜色
    [[UINavigationBar appearance]setTintColor:[UIColor whiteColor]];
    [self.window makeKeyAndVisible];
    
    self.selectIndex = 0;
    
    return YES;
}


- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    
    // 获取当前页面tabbar的index,添加点击动画
    NSInteger index = [tabBarController.viewControllers indexOfObject:viewController];
    [self animationWithIndex:index];
    
    // 点击的tabbar button不是当前页面的button运行点击动画
//    if (self.selectIndex!=index) {
//        [self animationWithIndex:index];
//    }
}

// tabbar点击图标添加动画
- (void)animationWithIndex:(NSInteger )index{
    NSMutableArray *itemArr = [NSMutableArray array];
    for (UIView *itemView in self.tabBarController.tabBar.subviews) {
        if ([itemView isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [itemArr addObject:itemView];
        }
    }
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.duration = 0.5;
    animation.repeatCount = 1;
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 1)];
    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.3, 1.3, 1)];
    [[itemArr[index] layer]addAnimation:animation forKey:nil];
    
    // 存储当前tabbar的index
//    self.selectIndex = index;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
