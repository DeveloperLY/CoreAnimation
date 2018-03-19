//
//  ViewController.m
//  day01-01-CALayer基本使用
//
//  Created by LY on 15/11/14.
//  Copyright © 2015年 DeveloperLY. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *redView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 设置边框(边框的宽度是往里走得)
    self.imageView.layer.borderColor = [UIColor blueColor].CGColor;
    self.imageView.layer.borderWidth = 3;
    
    // UIView本身自带阴影效果,不过默认是透明的
    // 设置阴影不透明度
    self.imageView.layer.shadowOpacity = 1;
    // 设置阴影的偏移量
    self.imageView.layer.shadowOffset = CGSizeMake(10, 10);
    // 设置阴影的颜色
    self.imageView.layer.shadowColor = [UIColor orangeColor].CGColor;
    
    // 设置阴影的模糊程度
    self.imageView.layer.shadowRadius = 3;
    
    // 设置圆角半径
    self.imageView.layer.cornerRadius = 50;
    // 超过根层以外的东西都给裁剪掉
    self.imageView.layer.masksToBounds = YES;
}


- (void)testUIViewCALayer {
    // 设置边框(边框的宽度是往里走得)
    self.redView.layer.borderColor = [UIColor blueColor].CGColor;
    self.redView.layer.borderWidth = 3;
    
    // UIView本身自带阴影效果,不过默认是透明的
    // 设置阴影不透明度
    self.redView.layer.shadowOpacity = 1;
    // 设置阴影的偏移量
    self.redView.layer.shadowOffset = CGSizeMake(10, 10);
    // 设置阴影的颜色
    self.redView.layer.shadowColor = [UIColor orangeColor].CGColor;
    
    // 设置阴影的模糊程度
    self.redView.layer.shadowRadius = 3;
    
    // 设置圆角半径
    self.redView.layer.cornerRadius = 30;
    // 超过根层以外的东西都给裁剪掉
    //self.redView.layer.masksToBounds = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self testUIViewCALayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
