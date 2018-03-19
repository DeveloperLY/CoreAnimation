//
//  LYWheelButton.m
//  day01-11-转盘
//
//  Created by LY on 15/11/15.
//  Copyright © 2015年 DeveloperLY. All rights reserved.
//

#import "LYWheelButton.h"

@implementation LYWheelButton

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    //固定图片的大小
    CGFloat imgW = 40;
    CGFloat imgH = 48;
    CGFloat imgX = ( contentRect.size.width - imgW) * 0.5;
    return CGRectMake(imgX, 20, imgW, imgH);
}

- (void)setHighlighted:(BOOL)highlighted {
    
}

@end
