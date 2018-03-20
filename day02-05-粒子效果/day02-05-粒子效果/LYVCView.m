//
//  LYVCView.m
//  day02-05-粒子效果
//
//  Created by LY on 15/11/16.
//  Copyright © 2015年 DeveloperLY. All rights reserved.
//

#import "LYVCView.h"

@interface LYVCView ()

/**路径*/
@property (nonatomic, strong) UIBezierPath *path;

/**粒子*/
@property (nonatomic, weak) CALayer *dotLayer;

@end

@implementation LYVCView

+ (Class)layerClass {
    return [CAReplicatorLayer class];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    CAReplicatorLayer *replicator = (CAReplicatorLayer *)self.layer;
    replicator.instanceCount = 30;
    replicator.instanceDelay = 0.25;
    
    // 创建手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self addGestureRecognizer:pan];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    self.path = path;
    
    // 创建一个粒子
    CALayer *dotLayer = [CALayer layer];
    dotLayer.frame = CGRectMake(-10, 0, 10, 10);
    dotLayer.backgroundColor = [UIColor greenColor].CGColor;
    dotLayer.cornerRadius = 5;
    self.dotLayer = dotLayer;
    [self.layer addSublayer:dotLayer];
}

- (void)drawRect:(CGRect)rect {
    self.path.lineWidth = 5;
    [self.path stroke];
}

- (void)pan:(UIPanGestureRecognizer *)pan {
    // 获取当前手指所在的点
    CGPoint curPoint = [pan locationInView:self];
    
    if (pan.state == UIGestureRecognizerStateBegan) {
        [self.path moveToPoint:curPoint];
    }else if (pan.state == UIGestureRecognizerStateChanged){
        [self.path addLineToPoint:curPoint];
        [self setNeedsDisplay];
    }
}

// 开始动画
- (void)start {
    // 创建一个帧动画
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    anim.keyPath = @"position";
    anim.path = self.path.CGPath;
    anim.repeatCount = MAXFLOAT;
    anim.duration = 3;
    [self.dotLayer addAnimation:anim forKey:nil];
}

// 重绘
- (void)redraw {
    // 移除动画
    [self.dotLayer removeAllAnimations];
    // 清空路径
    [self.path removeAllPoints];
    // 重绘
    [self setNeedsDisplay];
}

@end
