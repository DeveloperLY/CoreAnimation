//
//  ViewController.m
//  day01-08-图标抖动(帧动画)
//
//  Created by LY on 15/11/15.
//  Copyright © 2015年 DeveloperLY. All rights reserved.
//

#import "ViewController.h"

//把角度转成弧度
#define angle2Radio(angle) ((angle) / 180.0 * M_PI)

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 创建帧动画
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    anim.keyPath = @"position";
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:self.imageView.center];
    [path addLineToPoint:CGPointMake(200, 500)];
    
//    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 100, 100, 100)];
    anim.path = path.CGPath;
    
    // 动画结束后不要删除动画
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    
    [self.imageView.layer addAnimation:anim forKey:nil];
}

- (void)iconAnim {
    // 创建一个帧动画对象
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    anim.keyPath = @"transform.rotation";
    anim.values = @[@(angle2Radio(-5)), @(angle2Radio(5)), @(angle2Radio(-5))];
    anim.duration = 0.15;
    anim.repeatCount = MAXFLOAT;
    //anim.autoreverses = YES;
    
    [self.imageView.layer addAnimation:anim forKey:nil];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
