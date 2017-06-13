//
//  StartViewController.h
//  BodyBuilding
//
//  Created by iUX Studio 01 on 15/5/6.
//  Copyright (c) 2015年 iUX Studio 01. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StartViewController : UIViewController <UIScrollViewDelegate, UIPageViewControllerDelegate>

@property(strong,nonatomic)UIImageView *imageView;
@property(strong,nonatomic)UIScrollView *scroll;
@property(strong,nonatomic)UIPageControl *page;

@end
