//
//  MyTabBarController.m
//  Electricity
//
//  Created by lgl on 2017/6/13.
//  Copyright © 2017年 lgl. All rights reserved.
//

#import "MyTabBarController.h"
#import "HomeViewController.h"
#import "ClassifyViewController.h"
#import "ShopCarViewController.h"
#import "MyViewController.h"

@interface MyTabBarController ()

@end

@implementation MyTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    HomeViewController *homeVc = [[HomeViewController alloc]init];
    [self addOneChildVc:homeVc title:@"首页" imageName:@"tabbar-icon-home" selectedImageName:@"tabbar-icon-home-hl"];
    
    
    ClassifyViewController *workVc = [[ClassifyViewController alloc]init];
    [self addOneChildVc:workVc title:@"分类" imageName:@"tabbar-icon-works" selectedImageName:@"tabbar-icon-works-hl"];
    
    ShopCarViewController *cosVc = [[ShopCarViewController alloc]init];
    [self addOneChildVc:cosVc title:@"购物车" imageName:@"tabbar-icon-makeup" selectedImageName:@"tabbar-icon-makeup-hl"];
    
    MyViewController *myVc = [[MyViewController alloc]init];
    [self addOneChildVc:myVc title:@"我的" imageName:@"tabbar-icon-me" selectedImageName:@"tabbar-icon-me-hl"];
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tabbar-bg"]];
    self.tabBar.backgroundColor = [UIColor whiteColor];
}

- (void)addOneChildVc:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName{
    UIImage *image = [UIImage imageNamed:imageName];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.image = image;
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = selectedImage;
    
    [childVc.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                [UIColor colorFromHexString:K8c96a0], NSForegroundColorAttributeName, [UIFont fontWithName:nil size:11], NSFontAttributeName, nil] forState:UIControlStateNormal];
    
    [childVc.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                [UIColor colorFromHexString:KEE750C], NSForegroundColorAttributeName, [UIFont fontWithName:nil size:11], NSFontAttributeName, nil] forState:UIControlStateSelected];
    
    childVc.title = title;
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:childVc];
    [self addChildViewController:nav];
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
