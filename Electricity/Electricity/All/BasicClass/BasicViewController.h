//
//  BasicViewController.h
//  Electricity
//
//  Created by lgl on 2017/6/13.
//  Copyright © 2017年 lgl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BasicViewController : UIViewController

@property (nonatomic,strong) UILabel *topbarLb;
@property (nonatomic,copy) NSString *navTitle;
@property (nonatomic,assign) BOOL isHideLeftPop;

- (void)leftBtnPop;
//- (void)createHUD:(NSString*)textStr __attribute__((objc_requires_super));
- (void)login __attribute__((objc_requires_super));

@end
