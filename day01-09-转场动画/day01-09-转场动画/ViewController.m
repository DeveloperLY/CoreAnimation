//
//  ViewController.m
//  day01-09-转场动画
//
//  Created by LY on 15/11/15.
//  Copyright © 2015年 DeveloperLY. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

static NSInteger i = 0;
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (4 == ++i) {
        i = 1;
    }
    self.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld", i]];
    // 创建一个转场动画(转场动画必须得要跟转场代码在同一个方法当中)
    CATransition *anim = [CATransition animation];
    
    anim.duration = 1;
    
    // 设置转场类型
    anim.type = @"reveal";
    
//    // 设置动画的起始位置
//    anim.startProgress = 0.5;
//    // 设置动画的结束位置
//    anim.endProgress = 1.0;
    
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
