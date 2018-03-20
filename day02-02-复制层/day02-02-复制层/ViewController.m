//
//  ViewController.m
//  day02-02-复制层
//
//  Created by LY on 15/11/16.
//  Copyright © 2015年 DeveloperLY. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 复制层
    CAReplicatorLayer *replicator = [CAReplicatorLayer layer];
    replicator.frame = self.contentView.bounds;
    // 要复制的份数.(包括它自己.)
    replicator.instanceCount = 4;
    
    // 是相对于复制出来的上一个子层来的.
    replicator.instanceTransform = CATransform3DMakeTranslation(55, 0, 0);
    
    [self.contentView.layer addSublayer:replicator];
    
    CALayer *layer1 = [CALayer layer];
    layer1.frame = CGRectMake(20, 50, 50, 50);
    layer1.backgroundColor = [UIColor redColor].CGColor;
    [replicator addSublayer:layer1];
    
    CALayer *layer2 = [CALayer layer];
    layer2.frame = CGRectMake(20, 150, 50, 50);
    layer2.backgroundColor = [UIColor blueColor].CGColor;
    [replicator addSublayer:layer2];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
