//
//  HomeHeaderView.m
//  Electricity
//
//  Created by lgl on 2017/6/15.
//  Copyright © 2017年 lgl. All rights reserved.
//

#import "HomeHeaderView.h"

@implementation HomeHeaderView

- (instancetype)initWithFrame:(CGRect)frame andData:(NSDictionary *)data andVC:(HomeViewController *)vc{
    self = [super initWithFrame:frame];
    if (self) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, WIDTH/2)];
        _scrollView.pagingEnabled = YES;
        _scrollView.userInteractionEnabled = YES;
        _scrollView.bounces = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.delegate = self;
        [self addSubview:_scrollView];

#warning --- 这里的3是测试数据 要根据返回数据 改
        _scrollView.contentSize = CGSizeMake(WIDTH * 3, WIDTH/2);
        for(UIView *view in _scrollView.subviews){
            if([view isKindOfClass:[UIImageView class]])
                [view removeFromSuperview];
        }
        for (int i = 0; i < 3; i++) {
            UIImageView *bannerImageView = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH * i, 0, WIDTH, WIDTH/2)];
            bannerImageView.image = [UIImage imageNamed:@"1.png"];
            bannerImageView.userInteractionEnabled = YES;
            bannerImageView.tag = 100 + i;
            bannerImageView.layer.masksToBounds = YES;
            bannerImageView.contentMode = UIViewContentModeScaleAspectFill;
            [_scrollView addSubview:bannerImageView];
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
            [bannerImageView addGestureRecognizer:tap];
        }
        
        _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_scrollView.frame) - 30 * KSizeScale, WIDTH, 30 * KSizeScale)];
        _pageControl.currentPage = 0;
        _pageControl.pageIndicatorTintColor = [UIColor colorFromHexString:kd7dcdc];
        _pageControl.currentPageIndicatorTintColor = [UIColor colorFromHexString:KFFB27D];
        [_pageControl addTarget:self action:@selector(pageControl:) forControlEvents:UIControlEventValueChanged];
        _pageControl.numberOfPages = 3;
        CGSize pointSize = [_pageControl sizeForNumberOfPages:3];
        CGFloat pageX = -(_pageControl.bounds.size.width - pointSize.width) / 2 + 15 * KSizeScale;
        [_pageControl setBounds:CGRectMake(pageX, _pageControl.bounds.origin.y, _pageControl.bounds.size.width, _pageControl.bounds.size.height)];
        [self addSubview:_pageControl];

        UIView *otherView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_scrollView.frame), WIDTH, 100 * KSizeScale)];
//        otherView.backgroundColor = [UIColor yellowColor];
        [self addSubview:otherView];
        
        NSArray *array = @[@"新品", @"抢购", @"分类", @"品牌"];
        for (int i = 0; i < array.count; i++) {
            UIButton *otherButton = [UIButton buttonWithType:UIButtonTypeCustom];
            otherButton.frame = CGRectMake(WIDTH/4 * i, 0, WIDTH/4, CGRectGetHeight(otherView.frame));
            [otherButton setImage:[UIImage imageNamed:@"tabbar-icon-home-hl"] forState:UIControlStateNormal];
            [otherButton setTitle:array[i] forState:UIControlStateNormal];
            [otherButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [otherButton addTarget:self action:@selector(otherButton:) forControlEvents:UIControlEventTouchUpInside];
            otherButton.tag = 200 + i;
            [otherView addSubview:otherButton];
            otherButton.titleEdgeInsets = UIEdgeInsetsMake(0, -30, -40, 0);
            otherButton.imageEdgeInsets = UIEdgeInsetsMake(-40, 0, 0, -30);
        }
        
        UIView *noticeView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(otherView.frame), WIDTH, 100 * KSizeScale)];
//        noticeView.backgroundColor = [UIColor orangeColor];
        noticeView.clipsToBounds = YES;
        [self addSubview:noticeView];
        
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 0.5)];
        line.backgroundColor = [UIColor blackColor];
        [noticeView addSubview:line];
        
        UILabel *noticeLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100 * KSizeScale, 100 * KSizeScale)];
        noticeLabel.font = [UIFont fontWithName:nil size:20];
        noticeLabel.text = @"  最    新\n  公    告";
        noticeLabel.numberOfLines = 2;
        [noticeView addSubview:noticeLabel];
        
        UIView *line1 = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(noticeLabel.frame), 10 * KSizeScale, 0.5, 80 * KSizeScale)];
        line1.backgroundColor = [UIColor blackColor];
        [noticeView addSubview:line1];

#warning --- 这个数组也是需要拿后台的
        NSArray *array1 = @[@"商城成立通知", @"月销售额过千万啦", @"你好你好你好"];
        for (int i = 0; i < array1.count; i++) {
            UIButton *noticeButton = [UIButton buttonWithType:UIButtonTypeCustom];
            noticeButton.frame = CGRectMake(CGRectGetMaxX(line1.frame) + 10 * KSizeScale, 20 * KSizeScale + 40 * KSizeScale * i, WIDTH - 100 * KSizeScale, 20 * KSizeScale);
            noticeButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            [noticeButton setImage:[UIImage imageNamed:@"message"] forState:UIControlStateNormal];
            [noticeButton setTitle:array1[i] forState:UIControlStateNormal];
            [noticeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [noticeButton addTarget:self action:@selector(otherButton:) forControlEvents:UIControlEventTouchUpInside];
            noticeButton.tag = 204 + i;
            [noticeView addSubview:noticeButton];
            noticeButton.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
            noticeButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        }        
        
        UIView *line2 = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(noticeView.frame) - 0.5, WIDTH, 0.5)];
        line2.backgroundColor = [UIColor blackColor];
        [noticeView addSubview:line2];
    }
    return self;
}

- (void)otherButton:(UIButton *)button{
    if (button.tag < 204) {//other
        
    }else{//notice
        
    }
    NSLog(@"button.tag=%lu", button.tag);
}

- (void)tapClick:(UITapGestureRecognizer *)tap{
    UIImageView *view = (UIImageView *)tap.view;
    NSLog(@"view.tag=%lu", view.tag);
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGPoint point = _scrollView.contentOffset;
    int i = point.x / WIDTH;
    
    _pageControl.currentPage = i;
}

- (void)pageControl:(UIPageControl *)pC{
    int i = (int)_pageControl.currentPage;
    [UIView animateWithDuration:0.5 animations:^{
        _scrollView.contentOffset = CGPointMake(WIDTH * i, 0);
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
