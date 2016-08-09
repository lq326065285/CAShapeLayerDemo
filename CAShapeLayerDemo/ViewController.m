//
//  ViewController.m
//  CAShapeLayerDemo
//
//  Created by ~~浅笑 on 16/8/8.
//  Copyright © 2016年 广东康爱多连锁药店有限公司. All rights reserved.
//

#import "ViewController.h"

#import "CAShapeLayer+ViewMask.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(10, 60, 120, 200)];
    view.backgroundColor = [UIColor grayColor];
    [self.view addSubview:view];
    
    CAShapeLayer * layer = [CAShapeLayer createMaskLayerWithView:view];
    view.layer.mask = layer;
    
    
    UIView * view2 = [[UIView alloc] initWithFrame:CGRectMake(230, 60, 100, 100)];
    [self.view addSubview:view2];
    [self createBowWithView:view strokeEnd:.7 strokeStart:.1];
    
    
    UIView * faceView = [[UIView alloc] initWithFrame:CGRectMake(5, 270, 340, 350)];
    [self.view addSubview:faceView];
    [self circleAnimationWithView:faceView];
    
    
    UIView * leftEye = [self createEyeWithFrame:CGRectMake(20, 350, 150, 100)];
    [self.view addSubview:leftEye];
    
    UIView * rightEye = [self createEyeWithFrame:CGRectMake(180, 350, 150, 100)];
    [self.view addSubview:rightEye];
    
    //嘴巴
    UIView * mouseView = [[UIView alloc] initWithFrame:CGRectMake(70, 160, 200, 150)];
    [self createBowWithView:mouseView strokeEnd:.5 strokeStart:.0];
    [faceView addSubview:mouseView];
}


//创建眼镜
-(UIView *)createEyeWithFrame:(CGRect)frame{
    UIView * view3 = [[UIView alloc] initWithFrame:frame];
    [self.view addSubview:view3];
    [self circleAnimationWithView:view3];
    
    UIView * view4 = [[UIView alloc]initWithFrame:CGRectMake(30, 5, 90, 90)];
    [view3 addSubview:view4];
    [self circleAnimationWithView:view4];
    
    UIView * view5 = [[UIView alloc] initWithFrame:CGRectMake(40, 25, 40, 40)];
    view5.backgroundColor = [UIColor colorWithRed:.1 green:.1 blue:.1 alpha:.7];
    view5.layer.cornerRadius = 20;
    view5.layer.masksToBounds = YES;
    [view4 addSubview:view5];
    
    UIView * view6 = [[UIView alloc] initWithFrame:CGRectMake(15, 10, 6, 6)];
    view6.backgroundColor = [UIColor whiteColor];
    view6.layer.cornerRadius = 3;
    view6.layer.masksToBounds = YES;
    [view5 addSubview:view6];
    return view3;
}


-(void)createBowWithView:(UIView *)view strokeEnd:(CGFloat)strokeEnd strokeStart:(CGFloat)strokeStart{
    CAShapeLayer * layer = [CAShapeLayer layer];
    layer.frame = view.bounds;
    layer.strokeEnd = strokeEnd;
    layer.strokeStart = strokeStart;
    UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:view.bounds];
    layer.path = path.CGPath;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.lineWidth = 2.0;
    layer.strokeColor = [UIColor grayColor].CGColor;
    [view.layer addSublayer:layer];
}

-(void)circleAnimationWithView:(UIView *)view{
    CAShapeLayer * shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = view.bounds;
    //输一个矩形的切椭圆
    UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:view.bounds];
    
    //画一个带有圆角的矩形
//    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:view.bounds cornerRadius:view.frame.size.height / 2.0];
    shapeLayer.path = path.CGPath;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 2.0;
    shapeLayer.strokeColor = [UIColor grayColor].CGColor;
    [view.layer addSublayer:shapeLayer];
    
    //strokeStart --> 一个圆顺时针消失.     strokeEnd --> 逆时针画一个圆
    CABasicAnimation * pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 3.0f;
    pathAnimation.repeatCount = 1;
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pathAnimation.fromValue = [NSNumber numberWithInt:0.0];
    pathAnimation.toValue = [NSNumber numberWithInt:1.0];
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.removedOnCompletion = NO;
    [shapeLayer addAnimation:pathAnimation forKey:@"strokeEndAnimation"];
}



@end
