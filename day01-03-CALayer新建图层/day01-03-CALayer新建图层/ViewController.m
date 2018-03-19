//
//  ViewController.m
//  day01-03-CALayer新建图层
//
//  Created by LY on 15/11/14.
//  Copyright © 2015年 DeveloperLY. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(50, 50, 100, 100);
    layer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:layer];
    
    layer.contents = (id)[UIImage imageNamed:@"阿狸头像"].CGImage;
    
}

@end
