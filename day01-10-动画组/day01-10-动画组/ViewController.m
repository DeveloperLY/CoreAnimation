//
//  ViewController.m
//  day01-10-动画组
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
    // 创建动画组
    CAAnimationGroup *group = [CAAnimationGroup animation];
    //平移动画
    CABasicAnimation *anim = [CABasicAnimation animation];
    anim.keyPath = @"position.y";
    anim.toValue = @(400);
    
    
    //缩放动画
    CABasicAnimation *anim2 = [CABasicAnimation animation];
    anim2.keyPath = @"transform.scale";
    anim2.toValue = @(0.5);
    
    group.animations = @[anim, anim2];
    group.removedOnCompletion = NO;
    group.fillMode = kCAFillModeForwards;
    // 会自动执行animations数组当中的所有动画对象
    [self.redView.layer addAnimation:group forKey:nil];
    
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
