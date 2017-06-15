//
//  BasicTableView.m
//  Electricity
//
//  Created by lgl on 2017/6/14.
//  Copyright © 2017年 lgl. All rights reserved.
//

#import "BasicTableView.h"

@interface BasicTableView (){
    int _page;
    NSString *_refresh;
}

@end

@implementation BasicTableView


- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addRefresh];
    }
    return self;
}

- (void)addRefresh{
    [self addHeaderWithRefreshingTarget:self action:@selector(headerRefresh)];
    [self addFooterWithRefreshingTarget:self action:@selector(footerRefresh)];
}

- (void)headerRefresh{
    _page = 0;
    _refresh = @"headerView";
    [self downLoad];
}

- (void)footerRefresh{
    _page+=1;
    _refresh = @"footerView";
    [self downLoad];
}

- (void)setIsRefreshHeader:(BOOL)isRefreshHeader{
    if (isRefreshHeader == NO) {
        [self removeHeaderRefreshView];
    }
}

- (void)setIsRefreshFooter:(BOOL)isRefreshFooter{
    if (isRefreshFooter == NO) {
        [self removeFooterRefreshView];
    }
}

- (void)downLoad{
    if ([self.delegateT respondsToSelector:@selector(downLoadWithType:andPageNum:)]) {
        [self.delegateT downLoadWithType:_refresh andPageNum:_page];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
