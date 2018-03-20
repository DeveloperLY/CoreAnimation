//
//  ViewController.m
//  day02-04-倒影
//
//  Created by LY on 15/11/16.
//  Copyright © 2015年 DeveloperLY. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CAReplicatorLayer *replicator = (CAReplicatorLayer *) self.view.layer;
    replicator.instanceCount = 2;
    
    // 让复制出来的子层绕着X轴旋转180度
    replicator.instanceTransform = CATransform3DMakeRotation(M_PI, 1, 0, 0);
    
    //设置倒影
    replicator.instanceRedOffset -= 0.1;
    replicator.instanceGreenOffset -= 0.1;
    replicator.instanceBlueOffset -= 0.1;
    replicator.instanceAlphaOffset -= 0.1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
