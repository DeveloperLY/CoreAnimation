//
//  ViewController.m
//  day01-02-CATransform3D
//
//  Created by LY on 15/11/14.
//  Copyright © 2015年 CoderYLiu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [UIView animateWithDuration:0.5 animations:^{
//        self.imageView.layer.transform = CATransform3DMakeRotation(M_PI, 0, 0, 1);
        
//        self.imageView.layer.transform = CATransform3DMakeScale(0.5, 0.5, 1);
        
//        self.imageView.layer.transform = CATransform3DTranslate( self.imageView.layer.transform, 20, 0, 10);
        
//        self.imageView.layer.transform = CATransform3DMakeTranslation(100, 0, 100);
        
        // 用KVC可以做一些快速的平移,缩放
        
        [self.imageView.layer setValue:[NSValue valueWithCATransform3D:CATransform3DMakeTranslation(100, 0, 100)] forKeyPath:@"transform"];
        
        [self.imageView.layer setValue:@(M_PI) forKeyPath:@"transform.rotation.z"];
        
    }];
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
