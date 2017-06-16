//
//  RecommendCollectionReusableView.m
//  Electricity
//
//  Created by lgl on 2017/6/16.
//  Copyright © 2017年 lgl. All rights reserved.
//

#import "RecommendCollectionReusableView.h"

@implementation RecommendCollectionReusableView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)createUI{
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake((WIDTH - 200 * KSizeScale)/2, 25 * KSizeScale, 50 * KSizeScale, 0.5)];
    line.backgroundColor = [UIColor blackColor];
    [self addSubview:line];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(line.frame), 0, 100 * KSizeScale, 50 * KSizeScale)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"为您推荐";
    [self addSubview:label];
    
    UIView *line1 = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(label.frame), 25 * KSizeScale, 50 * KSizeScale, 0.5)];
    line1.backgroundColor = [UIColor blackColor];
    [self addSubview:line1];

}

@end
