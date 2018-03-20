//
//  ViewController.m
//  day02-01-图片折叠
//
//  Created by LY on 15/11/16.
//  Copyright © 2015年 DeveloperLY. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *topImageView;
@property (weak, nonatomic) IBOutlet UIImageView *bottomImageView;

@property (weak, nonatomic) IBOutlet UIView *dragView;

/** 渐变层 */
@property (nonatomic, weak) CAGradientLayer *gradient;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.topImageView.layer.contentsRect = CGRectMake(0, 0, 1.0, 0.5);
    self.topImageView.layer.anchorPoint = CGPointMake(0.5, 1.0);
    
    self.bottomImageView.layer.contentsRect = CGRectMake(0, 0.5, 1.0, 0.5);
    self.bottomImageView.layer.anchorPoint = CGPointMake(0.5, 0);
    
    // 添加拖拽手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.dragView addGestureRecognizer:pan];
    
    // 渐变层
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.bottomImageView.bounds;
    // 设置渐变颜色
    gradient.colors = @[(id) [UIColor clearColor].CGColor, (id) [UIColor blackColor].CGColor];
    // 设置图层的不透明度
    gradient.opacity = 0;
    self.gradient = gradient;
    [self.bottomImageView.layer addSublayer:gradient];
    
}

- (void)pan:(UIPanGestureRecognizer *) pan
{
    CGPoint trantP = [pan translationInView:pan.view];
    
    CATransform3D transform = CATransform3DIdentity;
    
    transform.m34 = -1 / 300.0;
    
    CGFloat angle = trantP.y * M_PI / 200.0;
    
    // 修改图层的不透明度
    if (trantP.y < 200) {
        self.gradient.opacity = trantP.y / 200.0;
        self.topImageView.layer.transform = CATransform3DRotate(transform, - angle, 1, 0, 0);
    }
    // 手指放开
    if (pan.state == UIGestureRecognizerStateEnded) {
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.25 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
            self.gradient.opacity = 0;
            self.topImageView.layer.transform = CATransform3DIdentity;
        } completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
