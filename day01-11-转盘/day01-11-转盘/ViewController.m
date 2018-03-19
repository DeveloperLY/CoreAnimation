//
//  ViewController.m
//  day01-11-转盘
//
//  Created by LY on 15/11/15.
//  Copyright © 2015年 DeveloperLY. All rights reserved.
//

#import "ViewController.h"
#import "LYWheelView.h"

@interface ViewController ()

/**转盘*/
@property (nonatomic, weak) LYWheelView *wheelView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LYWheelView *wheelView = [LYWheelView wheelView];
    wheelView.center = self.view.center;
    self.wheelView = wheelView;
    [self.view addSubview:wheelView];
}

- (IBAction)start:(id)sender {
    [self.wheelView startRotate];
}


- (IBAction)stop:(id)sender {
    [self.wheelView pauseRotate];
}

@end
