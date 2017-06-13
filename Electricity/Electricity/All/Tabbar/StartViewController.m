//
//  StartViewController.m
//  BodyBuilding
//
//  Created by iUX Studio 01 on 15/5/6.
//  Copyright (c) 2015年 iUX Studio 01. All rights reserved.
//

#import "StartViewController.h"
#import "MyTabBarController.h"
//#import "WorksViewController.h"
//#import "MyViewController.h"
//#import "CosmeticViewController.h"
//#import "InformationViewController.h"
#define LTCount 4
@interface StartViewController ()

@end

@implementation StartViewController
@synthesize imageView,scroll,page;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor blackColor];
    //在背景色上添加一个背景图
    imageView =[[UIImageView alloc]init];
//    imageView.image=[UIImage imageNamed:@"start2.png"];
    imageView.frame=[UIScreen mainScreen].applicationFrame;
    imageView.userInteractionEnabled=YES;
    [self.view addSubview: imageView];
    
    scroll =[[UIScrollView alloc]init];
    scroll.frame=[UIScreen mainScreen].applicationFrame;
    scroll.showsHorizontalScrollIndicator=NO;
    CGSize size =scroll.frame.size;
    scroll.backgroundColor = kUIColorFromRGB(0xf5fafa);
    scroll.contentSize=CGSizeMake(size.width * LTCount, 0);
    scroll.pagingEnabled=YES;
    scroll.delegate=self;
    [imageView addSubview:scroll];

    NSArray *imageName;
    if (Is667Screen) {
        imageName = @[@"ip6-1.png", @"ip6-2.png", @"ip6-3.png", @"ip6-4.png"];
    }else if (Is960Screen) {
        imageName = @[@"ip6plus-1.png", @"ip6plus-2.png", @"ip6plus-3.png", @"ip6plus-4.png"];
    }else{
        imageName = @[@"1.png", @"2.png", @"3.png", @"4.png"];
    }

    for (int i = 0; i < LTCount; i++){
        UIImageView *imageView1 =[[UIImageView alloc]init];
        imageView1.image=[UIImage imageNamed:imageName[i]];
        imageView1.userInteractionEnabled=YES;
        imageView1.frame=CGRectMake(i*size.width, 0, size.width, size.height);
        [scroll addSubview:imageView1];
        
        if (i == LTCount-1){
            UIButton *startBtn =[UIButton buttonWithType:(UIButtonTypeCustom)];
            [startBtn addTarget:self action:@selector(start) forControlEvents:(UIControlEventTouchUpInside)];
            startBtn.frame=CGRectMake(0, size.height*0.86, 140, 40);
            startBtn.center=CGPointMake(size.width*0.5, size.height*0.924);
            [imageView1 addSubview:startBtn];
            imageView.userInteractionEnabled=YES;
        }
    }
    
    page = [[UIPageControl alloc]init];
    page.center = CGPointMake(WIDTH * 0.5, HEIGHT * 0.98);
    page.numberOfPages = LTCount;
    page.bounds = CGRectMake(0, 0, 150, 0);
    page.pageIndicatorTintColor = [UIColor whiteColor];
//    page.currentPageIndicatorTintColor = [UIColor colorFromHexString:KFFB27D];
    [self.view addSubview:page];
    
}

- (void)start
{
    //开始Memory
    [UIApplication sharedApplication].statusBarHidden = NO;
    
//    application.statusBarHidden=NO;
    //    保证程序不退出继续停留在页面
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *str=[NSString stringWithFormat:@"%@",[defaults valueForKey:@"newtoken"]];

    if ([str isEqualToString:@"no"]||[defaults valueForKey:@"newtoken"]==nil)
    {
        
        MyTabBarController * tab = [[MyTabBarController alloc]init];
        tab.selectedIndex =0;
//        [self presentViewController:tab animated:YES completion:nil];
        self.view.window.rootViewController = tab;
        [defaults setObject:@"no" forKey:@"newtoken"];
    }
    
//    [UIApplication sharedApplication].statusBarHidden = NO;

//    self.view.window.rootViewController = [[UINavModelController alloc] initWithRootViewController:[[FirstViewController alloc] init]] ;
}

//滚动时候的调用的方法
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //设置分页【跟着滚动视图和分页的数目变化而变化】
    page.currentPage=scrollView.contentOffset.x / scrollView.frame.size.width;
}

//设置状态栏是否隐藏
-(BOOL)prefersStatusBarHidden{
    return YES;
}

#pragma mark - 屏幕方向控制
//- (BOOL)shouldAutorotate
//{
//    return NO;
//}
//
//- (UIInterfaceOrientationMask)supportedInterfaceOrientations
//{
//    return UIInterfaceOrientationMaskPortrait;
//}
@end
