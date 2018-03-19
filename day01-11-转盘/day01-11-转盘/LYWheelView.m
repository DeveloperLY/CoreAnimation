//
//  LYWheelView.m
//  day01-11-转盘
//
//  Created by LY on 15/11/15.
//  Copyright © 2015年 DeveloperLY. All rights reserved.
//

#import "LYWheelView.h"
#import "LYWheelButton.h"

@interface LYWheelView () <CAAnimationDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *wheelView;

// 选中的按钮
@property(nonatomic,strong)UIButton *selectedBtn;

//定时器
@property(nonatomic,strong)CADisplayLink *link;

@end

@implementation LYWheelView

- (CADisplayLink *)link {
    if (!_link) {
        CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(rotate)];
        [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
        _link = link;
    }
    return _link;
}

+ (instancetype)wheelView {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self = [[self class] wheelView];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    NSInteger btnCount = 12;
    
    // 计算每个按钮旋转的角度
    CGFloat angle = M_PI / 6;

    // 加载默认状态的按钮图片
    UIImage *normalImg = [UIImage imageNamed:@"LuckyAstrology"];
    // 加载选中状态的按钮图片
    UIImage *selImg = [UIImage imageNamed:@"LuckyAstrologyPressed"];
    // 计算张图片的宽高
    CGFloat scale = [UIScreen mainScreen].scale;
    CGFloat imgW = normalImg.size.width / btnCount * scale;
    CGFloat imgH = normalImg.size.height * scale;
    
    for (NSInteger i = 0; i < btnCount; i++) {
        // 创建按钮
        LYWheelButton *btn = [LYWheelButton buttonWithType:UIButtonTypeCustom];
        // 设置按钮的大小
        btn.bounds = CGRectMake(0, 0, 68, 143);
        
        // 设置背景颜色
//        btn.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255) / 255.0 green:arc4random_uniform(255) / 255.0 blue:arc4random_uniform(255) / 255.0 alpha:1.0];
        
        // 设置按钮的锚点
        btn.layer.anchorPoint = CGPointMake(0.5, 1);
        
        btn.center = self.center;
        
        btn.transform = CGAffineTransformMakeRotation(angle * i);
        
        // 裁剪大图
        CGRect imgRect = CGRectMake(imgW * i , 0, imgW, imgH);
        CGImageRef normalImgRef = CGImageCreateWithImageInRect(normalImg.CGImage, imgRect);
        
        // 设置默认状态下的按钮图片
        [btn setImage:[UIImage imageWithCGImage:normalImgRef] forState:UIControlStateNormal];
        
        // 设置选中状态下的按钮图片
        CGImageRef selImgRef = CGImageCreateWithImageInRect(selImg.CGImage, imgRect);
        [btn setImage:[UIImage imageWithCGImage:selImgRef] forState:UIControlStateSelected];
        
        // 设置选中的背景图片
        [btn setBackgroundImage:[UIImage imageNamed:@"LuckyRototeSelected"] forState:UIControlStateSelected];
        
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        
        if (0 == i) {
            [self btnClick:btn];
        }
        
        [self.wheelView addSubview:btn];
        
    }
}

- (void)btnClick:(UIButton *)btn {
    // 去除之前选错的
    self.selectedBtn.selected = NO;
    
    btn.selected = YES;
    
    self.selectedBtn = btn;
}

- (IBAction)centerBtnClick:(id)sender {
    // 去除之前的自动旋转
    [self pauseRotate];
    
    // 快速旋转其他按钮不能点
    CABasicAnimation *anim = [CABasicAnimation animation];
    anim.keyPath = @"transform.rotation";
    anim.toValue = @(M_PI * 4);
    anim.duration = 1;
    // 设置代理
    anim.delegate = self;
    
    [self.wheelView.layer addAnimation:anim forKey:nil];
}

// 核心动画代理方法
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    CGFloat angle = atan2(self.selectedBtn.transform.b, self.selectedBtn.transform.a);
    
    self.wheelView.transform = CGAffineTransformMakeRotation(-angle);
    // 核心动画结束后, 2秒后自动旋转
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self startRotate];
    });
}

// 开始旋转
- (void)startRotate {
    // 创建动画 核心动画是假象,不能跟用户交互所以这里不能使用
//    CABasicAnimation *anim = [CABasicAnimation animation];
//    anim.keyPath = @"transform.rotation";
//    anim.toValue = @(M_PI * 2);
//    anim.repeatCount = 2;
//    anim.duration = 2.0;
//    [self.wheelView.layer addAnimation:anim forKey:nil];
    
    // 如果当前有定时器,就不再添加
    self.link.paused = NO;
    
    // 开始一个定时器
    
}

- (void)rotate {
    self.wheelView.transform = CGAffineTransformRotate(self.wheelView.transform, M_PI / 300.0);
}

// 停止转动
- (void)pauseRotate {
    self.link.paused = YES;
}

@end
