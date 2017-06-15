//
//  UIScrollView+Refresh.h
//  Electricity
//
//  Created by lgl on 2017/6/14.
//  Copyright © 2017年 lgl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (Refresh)

/// 添加下拉刷新控件
- (void)addHeaderWithRefreshingTarget:(id)target action:(SEL)action;

/// 添加上拉加载控件
- (void)addFooterWithRefreshingTarget:(id)target action:(SEL)action;

/// 上拉加载控件结束刷新
- (void)footerEndRefresh;

/// 下拉刷新控件结束刷新
- (void)headerEndRefresh;

/// 开始刷新状态
- (void)footerBeginRefresh;

/// 进入刷新状态
- (void)headerBeginRefresh;

/// 移除上拉加载控件
- (void)removeFooterRefreshView;

/// 移除下拉刷新控件
- (void)removeHeaderRefreshView;

/// 没有更多数据
- (void)endRefreshingWithNoMoreData;

@end
