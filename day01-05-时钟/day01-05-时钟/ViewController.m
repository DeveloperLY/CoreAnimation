//
//  ViewController.m
//  day01-05-时钟
//
//  Created by LY on 15/11/14.
//  Copyright © 2015年 DeveloperLY. All rights reserved.
//

#import "ViewController.h"

//秒针每一秒旋转多少度.
#define perSecA 6

//每一分分针旋转多少度
#define perMinA 6

//每一小时, 时针旋转多少度
#define perHourA 30

//每一分,时针旋转多少度.
#define perMinHourA 0.5

//把角度转成弧度
#define angle2Radio(angle) ((angle) / 180.0 * M_PI)

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *colockView;

/** 秒针 */
@property (nonatomic, weak) CALayer *secLayer;

/** 分针 */
@property (nonatomic, weak) CALayer *minLayer;

/** 时针 */
@property (nonatomic, weak) CALayer *hourLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加秒针
    [self setUpSec];
    // 添加分针
    [self setUpMin];
    // 添加时针
    [self setUpHour];

    
    // 添加定时器
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];
    
    [self timeChange];
}

- (void)timeChange {
    NSCalendar *cal = [NSCalendar currentCalendar];
     NSDateComponents *cmp = [cal components:NSCalendarUnitSecond | NSCalendarUnitMinute | NSCalendarUnitHour fromDate:[NSDate date]];
    //获取当前是多少秒
    NSInteger curSec = cmp.second;
    
    //获取当前是多少分
    NSInteger curMin = cmp.minute;
    
    //获取当前是多少小时
    NSInteger curHour = cmp.hour;
    
    //计算当前秒针旋转的角度
    CGFloat secAngle =  curSec * perSecA;
    self.secLayer.transform = CATransform3DMakeRotation(angle2Radio(secAngle), 0, 0, 1);
    
    //计算当前分针旋转的角度
    CGFloat minAngle =  curMin * perMinA;
    self.minLayer.transform = CATransform3DMakeRotation(angle2Radio(minAngle), 0, 0, 1);
    
    //计算当前时针旋转的角度
    CGFloat hourAngle =  curHour * perHourA + curMin * perMinHourA;
    self.hourLayer.transform = CATransform3DMakeRotation(angle2Radio(hourAngle), 0, 0, 1);
}

// 添加秒针
- (void)setUpSec {
    CALayer *secLayer = [CALayer layer];
    secLayer.frame = CGRectMake(0, 0, 2, 90);
    secLayer.backgroundColor = [UIColor redColor].CGColor;
    secLayer.position = CGPointMake(self.colockView.bounds.size.width * 0.5, self.colockView.bounds.size.height * 0.5);
    secLayer.anchorPoint = CGPointMake(0.5, 0.9);
    self.secLayer = secLayer;
    [self.colockView.layer addSublayer:secLayer];
}

// 添加分针
- (void)setUpMin {
    CALayer *minLayer = [CALayer layer];
    minLayer.frame = CGRectMake(0, 0, 5, 75);
    minLayer.backgroundColor = [UIColor blackColor].CGColor;
    minLayer.position = CGPointMake(self.colockView.bounds.size.width * 0.5, self.colockView.bounds.size.height * 0.5);
    minLayer.anchorPoint = CGPointMake(0.5, 0.9);
    self.minLayer = minLayer;
    [self.colockView.layer addSublayer:minLayer];
}

// 添加时针
- (void)setUpHour {
    CALayer *hourLayer = [CALayer layer];
    hourLayer.frame = CGRectMake(0, 0, 5, 60);
    hourLayer.backgroundColor = [UIColor blackColor].CGColor;
    hourLayer.position = CGPointMake(self.colockView.bounds.size.width * 0.5, self.colockView.bounds.size.height * 0.5);
    hourLayer.anchorPoint = CGPointMake(0.5, 0.9);
    self.hourLayer = hourLayer;
    [self.colockView.layer addSublayer:hourLayer];
}

@end
