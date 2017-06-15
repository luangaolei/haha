//
//  BasicTableView.h
//  Electricity
//
//  Created by lgl on 2017/6/14.
//  Copyright © 2017年 lgl. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BasicTableViewDelegate <NSObject>

- (void)downLoadWithType:(NSString*)type andPageNum:(int)pageNum;

@end

@interface BasicTableView : UITableView

@property (weak, nonatomic) id<BasicTableViewDelegate> delegateT;
@property (assign, nonatomic) BOOL isRefreshHeader;
@property (assign, nonatomic) BOOL isRefreshFooter;

@end
