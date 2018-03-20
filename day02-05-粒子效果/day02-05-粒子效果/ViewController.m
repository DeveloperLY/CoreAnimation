//
//  ViewController.m
//  day02-05-粒子效果
//
//  Created by LY on 15/11/16.
//  Copyright © 2015年 DeveloperLY. All rights reserved.
//

#import "ViewController.h"
#import "LYVCView.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet LYVCView *vcView;

@end

@implementation ViewController
// 开始
- (IBAction)start {
    [self.vcView start];
}

// 重绘
- (IBAction)redraw {
    [self.vcView redraw];
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
