//
//  ViewController.m
//  day01-06-CABaseAnimation
//
//  Created by LY on 15/11/15.
//  Copyright © 2015年 DeveloperLY. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *redView;

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 创建一个基础动画对象
    CABasicAnimation *anim = [CABasicAnimation animation];
    // 动画的属性值
    anim.keyPath = @"transform.scale";
    anim.toValue = @1.5;
    // 在动画完成时,删除动画
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    
    // 添加动画
    [self.redView.layer addAnimation:anim forKey:nil];
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
