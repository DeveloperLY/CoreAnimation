//
//  ViewController.m
//  day01-07-心跳效果
//
//  Created by LY on 15/11/15.
//  Copyright © 2015年 DeveloperLY. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 创建一个动画对象
    CABasicAnimation *anim = [CABasicAnimation animation];
    anim.keyPath = @"transform.scale";
    anim.toValue = @0;
    // 让动画重复执行
    anim.repeatCount = MAXFLOAT;
    
    // 设置动画执行一次的时间
    anim.duration = 0.6;
    
    // 自动反转 (怎么开始的怎么回来)
    anim.autoreverses = YES;
    
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
