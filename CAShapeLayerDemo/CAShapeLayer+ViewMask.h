//
//  CAShapeLayer+ViewMask.h
//  CAShapeLayerDemo
//
//  Created by ~~浅笑 on 16/8/8.
//  Copyright © 2016年 广东康爱多连锁药店有限公司. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import <UIKit/UIKit.h>

@interface CAShapeLayer (ViewMask)

+(instancetype)createMaskLayerWithView:(UIView *)view;

@end
