//
//  UIScrollView+Refresh.m
//  Electricity
//
//  Created by lgl on 2017/6/14.
//  Copyright © 2017年 lgl. All rights reserved.
//

#import "UIScrollView+Refresh.h"
#import <objc/runtime.h>

@implementation UIScrollView (Refresh)

- (void)addHeaderWithRefreshingTarget:(id)target action:(SEL)action
{
    self.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:target refreshingAction:action];
}

- (void)addFooterWithRefreshingTarget:(id)target action:(SEL)action
{
    self.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:target refreshingAction:action];
}

- (void)headerEndRefresh
{
    [self.mj_header endRefreshing];
}

- (void)headerBeginRefresh
{
    [self.mj_header beginRefreshing];
}

- (void)footerEndRefresh
{
    [self.mj_footer endRefreshing];
}

- (void)footerBeginRefresh
{
    [self.mj_footer beginRefreshing];
}

- (void)removeHeaderRefreshView
{
    [self.mj_header removeFromSuperview];
    self.mj_header = nil;
}

- (void)removeFooterRefreshView
{
    [self.mj_footer removeFromSuperview];
    self.mj_footer = nil;
}

- (void)endRefreshingWithNoMoreData
{
    [self.mj_footer endRefreshingWithNoMoreData];
}

@end
