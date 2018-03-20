//
//  LYVCView.m
//  day02-04-倒影
//
//  Created by LY on 15/11/16.
//  Copyright © 2015年 DeveloperLY. All rights reserved.
//

#import "LYVCView.h"

@implementation LYVCView

// 设置返回的层就是复制层
+ (Class)layerClass {
    return [CAReplicatorLayer class];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
