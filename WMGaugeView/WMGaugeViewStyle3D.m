//
//  WMGaugeViewStyleFlat3D.m
//  WMGaugeView
//
//  Created by Markezana, William on 25/10/15.
//  Copyright © 2015 Will™. All rights reserved.
//

#import "WMGaugeViewStyle3D.h"

#define kNeedleWidth        0.035
#define kNeedleHeight       0.34
#define kNeedleScrewRadius  0.04

@implementation WMGaugeViewStyle3D

- (void)drawNeedleOnLayer:(CALayer*)layer inRect:(CGRect)rect
{
    // Left Needle
    CAShapeLayer *leftNeedleLayer = [CAShapeLayer layer];
    UIBezierPath *leftNeedlePath = [UIBezierPath bezierPath];
    [leftNeedlePath moveToPoint:CGPointMake(WMFULLSCALE(kCenterX, kCenterY))];
    [leftNeedlePath addLineToPoint:CGPointMake(WMFULLSCALE(kCenterX - kNeedleWidth, kCenterY))];
    [leftNeedlePath addLineToPoint:CGPointMake(WMFULLSCALE(kCenterX, kCenterY - kNeedleHeight))];
    [leftNeedlePath closePath];
    
    leftNeedleLayer.path = leftNeedlePath.CGPath;
    leftNeedleLayer.backgroundColor = [[UIColor clearColor] CGColor];
    leftNeedleLayer.fillColor = WMCGRGB(176, 10, 19);
    
    [layer addSublayer:leftNeedleLayer];
    
    // Right Needle
    CAShapeLayer *rightNeedleLayer = [CAShapeLayer layer];
    UIBezierPath *rightNeedlePath = [UIBezierPath bezierPath];
    [rightNeedlePath moveToPoint:CGPointMake(WMFULLSCALE(kCenterX, kCenterY))];
    [rightNeedlePath addLineToPoint:CGPointMake(WMFULLSCALE(kCenterX + kNeedleWidth, kCenterY))];
    [rightNeedlePath addLineToPoint:CGPointMake(WMFULLSCALE(kCenterX, kCenterY - kNeedleHeight))];
    [rightNeedlePath closePath];
    
    rightNeedleLayer.path = rightNeedlePath.CGPath;
    rightNeedleLayer.backgroundColor = [[UIColor clearColor] CGColor];
    rightNeedleLayer.fillColor = WMCGRGB(252, 18, 30);
    
    [layer addSublayer:rightNeedleLayer];
    
    // Needle shadow
    [layer setShadowColor:[[UIColor blackColor] CGColor]];
    [layer setShadowOffset:CGSizeMake(0, 0)];
    [layer setShadowOpacity:0.5];
    [layer setShadowRadius:2.0];
    
    // Screw drawing
    CAShapeLayer *screwLayer = [CAShapeLayer layer];
    screwLayer.bounds = CGRectMake(WMFULLSCALE(kCenterX - kNeedleScrewRadius, kCenterY - kNeedleScrewRadius), WMFULLSCALE(kNeedleScrewRadius * 2.0, kNeedleScrewRadius * 2.0));
    screwLayer.position = CGPointMake(WMFULLSCALE(kCenterX, kCenterY));
    screwLayer.path = [UIBezierPath bezierPathWithOvalInRect:screwLayer.bounds].CGPath;
    screwLayer.fillColor = WMCGRGB(171, 171, 171);
    screwLayer.strokeColor = WMCGRGBA(81, 84, 89, 100);
    screwLayer.lineWidth = 1.5;
    
    // Screw shadow
    screwLayer.shadowColor = [[UIColor blackColor] CGColor];
    screwLayer.shadowOffset = CGSizeMake(0.0, 0.0);
    screwLayer.shadowOpacity = 0.1;
    screwLayer.shadowRadius = 2.0;
    
    [layer addSublayer:screwLayer];
}

- (void)drawFaceWithContext:(CGContextRef)context inRect:(CGRect)rect
{
    // Default Face
    CGColorSpaceRef baseSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColors(baseSpace, (CFArrayRef)@[WMiCGRGB(96, 96, 96), WMiCGRGB(68, 68, 68), WMiCGRGB(32, 32, 32)], (const CGFloat[]){0.35, 0.96, 0.99});
    CGColorSpaceRelease(baseSpace), baseSpace = NULL;
    CGContextAddEllipseInRect(context, rect);
    CGContextClip(context);
    CGContextDrawRadialGradient(context, gradient, kCenterPoint, 0, kCenterPoint, rect.size.width / 2.0, kCGGradientDrawsAfterEndLocation);
    CGGradientRelease(gradient), gradient = NULL;
    
    // Shadow
    baseSpace = CGColorSpaceCreateDeviceRGB();
    gradient = CGGradientCreateWithColors(baseSpace, (CFArrayRef)@[WMiCGRGBA(40, 96, 170, 60), WMiCGRGBA(15, 34, 98, 80), WMiCGRGBA(0, 0, 0, 120), WMiCGRGBA(0, 0, 0, 140)], (const CGFloat[]){0.60, 0.85, 0.96, 0.99});
    CGColorSpaceRelease(baseSpace), baseSpace = NULL;
    CGContextAddEllipseInRect(context, rect);
    CGContextClip(context);
    CGContextDrawRadialGradient(context, gradient, kCenterPoint, 0, kCenterPoint, rect.size.width / 2.0, kCGGradientDrawsAfterEndLocation);
    CGGradientRelease(gradient), gradient = NULL;
    
    // Border
    CGContextSetLineWidth(context, 0.005);
    CGContextSetStrokeColorWithColor(context, WMCGRGBA(81, 84, 89, 160));
    CGContextAddEllipseInRect(context, rect);
    CGContextStrokePath(context);
}

- (BOOL)needleLayer:(CALayer*)layer willMoveAnimated:(BOOL)animated duration:(NSTimeInterval)duration animation:(CAKeyframeAnimation*)animation
{
    return NO;
}

@end
