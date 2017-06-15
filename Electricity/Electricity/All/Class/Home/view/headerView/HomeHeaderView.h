//
//  HomeHeaderView.h
//  Electricity
//
//  Created by lgl on 2017/6/15.
//  Copyright © 2017年 lgl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"

@interface HomeHeaderView : UIView<UIScrollViewDelegate>{
    UIScrollView *_scrollView;
    UIPageControl *_pageControl;
}

- (instancetype)initWithFrame:(CGRect)frame andData:(NSDictionary *)data andVC:(HomeViewController *)vc;

@end
