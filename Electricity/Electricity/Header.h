//
//  Header.h
//  BeautyC
//
//  Created by xuqidong on 15/7/23.
//  Copyright (c) 2015年 xuqidong. All rights reserved.
//

#ifndef BeautyC_Header_h
#define BeautyC_Header_h


#endif

#ifdef DEBUG

#else
#define GLTLog(...)
#endif

//背景颜色
#define BACKGROUND_COLOR [[UIColor alloc]initWithRed:245/255.0 green:250/255.0 blue:250/255.0 alpha:1]
//线颜色
#define LINE_BACKGROUND_COLOR [[UIColor alloc]initWithRed:210/255.0 green:220/255.0 blue:230/255.0 alpha:1]
#define HUDSECOND 15 //hud 网络请求时超时时间
//颜色和透明度设置
#define RGBA(r,g,b,a) [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:a]
//default
#define DEFAULTS [NSUserDefaults standardUserDefaults]

//环信appkey
#define HuanXinAppkey @"fitpass#fitpasscoach"
//CGRectMake简写
#define CCR(__A__,__B__,__C__,__D__) CGRectMake(__A__, __B__, __C__, __D__)
//int类型转换为NSString
#define StringOfInt(value)  [NSString stringWithFormat:@"%d", value]
//int类型转换为NSString
#define StringOfinteger(value)  [NSString stringWithFormat:@"%ld", (long)value]
//HUD错误提示
#define HUD_STATUS_ERROR  @"亲，网路开了个小差，请重试！"
//改变UItableview选中状态颜色
#define SELECTED_TABLE_COLOR [[UIColor alloc]initWithRed:230/255.0 green:235/255.0 blue:240/255.0 alpha:1]


