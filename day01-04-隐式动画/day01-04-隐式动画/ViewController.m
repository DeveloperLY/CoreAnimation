//
//  ViewController.m
//  day01-04-隐式动画
//
//  Created by LY on 15/11/14.
//  Copyright © 2015年 DeveloperLY. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *blueView;

@property (nonatomic, weak) CALayer *layer;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 非Root Layer的部分属性进行修改时，默认会自动产生一些动画效果 (隐式动画)
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(50, 50, 100, 100);
    layer.backgroundColor = [UIColor yellowColor].CGColor;
    self.layer = layer;
    [self.view.layer addSublayer:layer];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
//    self.layer.bounds = CGRectMake(0, 0, 50, 100);
    // 隐藏隐式动画
    // 将多个操作绑定在一起,当这些操作执行完之后,才能取执行其它事情
    [CATransaction begin];
    // 设置隐式动画的执行时长
    [CATransaction setAnimationDuration:2.0];
    // 设置是否有隐式动画
    [CATransaction setDisableActions:NO];
    self.layer.backgroundColor = [UIColor orangeColor].CGColor;
    self.layer.position = CGPointMake(arc4random_uniform(300), arc4random_uniform(400));
    self.layer.cornerRadius = arc4random_uniform(50);
    [CATransaction commit];
    
    // 根层是没有隐式动画的
//    self.blueView.layer.bounds = CGRectMake(0, 0, 50, 100);
}

@end
