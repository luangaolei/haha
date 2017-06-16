//
//  AdCollectionViewCell.m
//  Electricity
//
//  Created by lgl on 2017/6/16.
//  Copyright © 2017年 lgl. All rights reserved.
//

#import "AdCollectionViewCell.h"

@implementation AdCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)createUI{
    self.backgroundColor = [UIColor whiteColor];
    
    _bigImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 10 * KSizeScale, WIDTH, 100 * KSizeScale)];
    _bigImageView.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:_bigImageView];
    
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10 * KSizeScale, 10 * KSizeScale, 200 * KSizeScale, 11 * KSizeScale)];
    _titleLabel.text = @"标题标题标题标题标题";
    _titleLabel.font = [UIFont fontWithName:nil size:k11Special_font * KSizeScale];
    _titleLabel.textAlignment = NSTextAlignmentLeft;
    _titleLabel.textColor = [UIColor colorFromHexString:K3a3a3a];
    [_bigImageView addSubview:_titleLabel];
    
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_bigImageView.frame) + 10 * KSizeScale, WIDTH, 200 * KSizeScale)];
    [self.contentView addSubview:bgView];
    
    for (int i = 0; i < 4; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake((i/2)*(WIDTH/2), (i%2)*100 * KSizeScale, WIDTH/2, 100 * KSizeScale)];
        imageView.backgroundColor = [UIColor colorWithRed:arc4random() % 256 / 256.0 green:arc4random() % 256 / 256.0 blue:arc4random() % 256 / 256.0 alpha:1];
        imageView.tag = 300 + i;
        [bgView addSubview:imageView];

    }
}

//- (void)refreshWithModel:(PumpkinColumnModel *)model{
//    _columnNameLabel.text = model.name;
//    [_columnImageView sd_setImageWithURL:[NSURL URLWithString:model.photoUrl] placeholderImage:[UIImage imageNamed:kPlaceHolderImage]];
//}

@end
