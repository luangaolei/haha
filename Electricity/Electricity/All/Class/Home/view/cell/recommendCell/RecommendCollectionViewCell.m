//
//  RecommendCollectionViewCell.m
//  Electricity
//
//  Created by lgl on 2017/6/16.
//  Copyright © 2017年 lgl. All rights reserved.
//

#import "RecommendCollectionViewCell.h"

@implementation RecommendCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)createUI{
    self.backgroundColor = [UIColor whiteColor];
    
    _bigImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, (WIDTH - 30 * KSizeScale)/2, 130 * KSizeScale)];
    _bigImageView.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:_bigImageView];
    
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_bigImageView.frame) + 10 * KSizeScale, CGRectGetWidth(_bigImageView.frame), 20 * KSizeScale)];
    _titleLabel.text = @"推荐商品标题标题";
    _titleLabel.font = [UIFont fontWithName:nil size:k11Special_font * KSizeScale];
    _titleLabel.textAlignment = NSTextAlignmentLeft;
    _titleLabel.textColor = [UIColor colorFromHexString:K3a3a3a];
    [self.contentView addSubview:_titleLabel];
    
    _priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_titleLabel.frame) + 10 * KSizeScale, CGRectGetWidth(_bigImageView.frame), 20 * KSizeScale)];
    _priceLabel.text = @"¥ 1000";
    _priceLabel.font = [UIFont fontWithName:nil size:k11Special_font * KSizeScale];
    _priceLabel.textAlignment = NSTextAlignmentLeft;
    _priceLabel.textColor = [UIColor redColor];
    [self.contentView addSubview:_priceLabel];
    
}

@end
