//
//  CAShapeLayer+ViewMask.m
//  CAShapeLayerDemo
//
//  Created by ~~浅笑 on 16/8/8.
//  Copyright © 2016年 广东康爱多连锁药店有限公司. All rights reserved.
//

#import "CAShapeLayer+ViewMask.h"

@implementation CAShapeLayer (ViewMask)

+(instancetype)createMaskLayerWithView:(UIView *)view{
    CGFloat viewWidth = CGRectGetWidth(view.frame);
    CGFloat viewHeight = CGRectGetHeight(view.frame);
    CGFloat rightSpace = 20;
    CGFloat topSpace = 15;
    CGPoint point1 = CGPointMake(0, 0);
    CGPoint point2 = CGPointMake(viewWidth - rightSpace, 0);
    CGPoint point3 = CGPointMake(viewWidth - rightSpace, topSpace);
    CGPoint point4 = CGPointMake(viewWidth, topSpace + 8);
    CGPoint point5 = CGPointMake(viewWidth - rightSpace, topSpace + 16);
    CGPoint point6 = CGPointMake(viewWidth - rightSpace, viewHeight);
    CGPoint point7 = CGPointMake(0, viewHeight);
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path moveToPoint:point1];
    [path addLineToPoint:point2];
    [path addLineToPoint:point3];
    [path addLineToPoint:point4];
    [path addLineToPoint:point5];
    [path addLineToPoint:point6];
    [path addLineToPoint:point7];
    [path closePath];
    CAShapeLayer * layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    return layer;
}

@end
