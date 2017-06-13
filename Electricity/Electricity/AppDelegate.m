//
//  AppDelegate.m
//  Electricity
//
//  Created by lgl on 2017/6/13.
//  Copyright © 2017年 lgl. All rights reserved.
//

#import "AppDelegate.h"
#import "MyTabBarController.h"
#import "CustomTabbarController.h"
#import "StartViewController.h"
#import "HomeViewController.h"
#import "ClassifyViewController.h"
#import "ShopCarViewController.h"
#import "MyViewController.h"

@interface AppDelegate (){
    UIButton *_redBtn;
}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //引导页
    NSString *key=(NSString *)kCFBundleVersionKey;
    NSString *version =[[[NSBundle mainBundle]infoDictionary]objectForKey:@"CFBundleShortVersionString"];
    NSString *saveVersion =[[NSUserDefaults standardUserDefaults] objectForKey:key];

    //判断是不是第一次用【是否一样】
    if ([version isEqualToString:saveVersion]){
        MyTabBarController *tab = [[MyTabBarController alloc]init];
//        tab = [self createTabBar];
        tab.selectedIndex = 0;
        tab.tabBar.backgroundColor = [UIColor whiteColor];
        self.window.rootViewController = tab;
    }else{
        application.statusBarHidden=YES;
        // 版本号不一样：第一次使用新版本
        // 将新版本号写入沙盒
        [[NSUserDefaults standardUserDefaults]setObject:version forKey:key];
        [[NSUserDefaults standardUserDefaults]synchronize];
        //显示启动动画页面
        self.window.rootViewController = [[StartViewController alloc]init];
        
        [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"isQiDongYe"];
    }
    
    [self.window makeKeyAndVisible];
    
    
    return YES;
}

- (CustomTabbarController *)createTabBar{
    
    HomeViewController *home = [[HomeViewController alloc]init];
    UINavigationController *homeNav = [[UINavigationController alloc]initWithRootViewController:home];
    homeNav.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"菜谱" image:[UIImage imageNamed:@"tabbar-icon-home"] selectedImage:[[UIImage imageNamed:@"tabbar-icon-home-hl"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    ClassifyViewController *classify = [[ClassifyViewController alloc]init];
    UINavigationController *classifyNav = [[UINavigationController alloc]initWithRootViewController:classify];
    classify.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"发现" image:[UIImage imageNamed:@"tabbar-icon-works"] selectedImage:[[UIImage imageNamed:@"tabbar-icon-works-hl"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    ShopCarViewController *car = [[ShopCarViewController alloc]init];
    UINavigationController *carNav = [[UINavigationController alloc]initWithRootViewController:car];
    carNav.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"广场" image:[UIImage imageNamed:@"tabbar-icon-makeup"] selectedImage:[[UIImage imageNamed:@"tabbar-icon-makeup-hl"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    MyViewController *my = [[MyViewController alloc]init];
    UINavigationController *myNav = [[UINavigationController alloc]initWithRootViewController:my];
    myNav.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"我的" image:[UIImage imageNamed:@"tabbar-icon-me"] selectedImage:[[UIImage imageNamed:@"tabbar-icon-me-hl"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
//    MyTabBarController *myTabBarController = [[MyTabBarController alloc]init];
    CustomTabbarController *myTabBarController = [[CustomTabbarController alloc]init];
    myTabBarController.viewControllers = @[homeNav, classifyNav, carNav, myNav];
    
    return myTabBarController;
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
