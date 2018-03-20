//
//  ViewController.m
//  day02-03-音量震动条
//
//  Created by LY on 15/11/16.
//  Copyright © 2015年 DeveloperLY. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UIView *contentView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建复制层
    CAReplicatorLayer *replicator = [CAReplicatorLayer layer];
    replicator.frame = self.contentView.bounds;
    // 复制多少份(包含自己)
    replicator.instanceCount = 6;
    // 每一份相对于上一份的平移
    replicator.instanceTransform = CATransform3DMakeTranslation(45, 0, 0);
    // 下一个动画相对于上一个的动画延迟
    replicator.instanceDelay = 0.5;
    [self.contentView.layer addSublayer:replicator];
    
    // 添加音量震动条
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(0, 0, 30, 150);
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.anchorPoint = CGPointMake(0, 1);
    layer.position = CGPointMake(0, self.contentView.bounds.size.height);
    [replicator addSublayer:layer];
    
    // 创建动画
    CABasicAnimation *anim = [CABasicAnimation animation];
    anim.keyPath = @"transform.scale.y";
    anim.toValue = @0;
    anim.repeatCount = MAXFLOAT;
    anim.duration = 0.5;
    anim.autoreverses = YES;
    [layer addAnimation:anim forKey:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
