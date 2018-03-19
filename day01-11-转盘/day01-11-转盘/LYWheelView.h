//
//  LYWheelView.h
//  day01-11-转盘
//
//  Created by LY on 15/11/15.
//  Copyright © 2015年 DeveloperLY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYWheelView : UIView

+ (instancetype)wheelView;

// 开始转动
- (void)startRotate;

// 停止转动
- (void)pauseRotate;

@end
