/*
 * WMGaugeViewStyle.h
 *
 * Copyright (C) 2015 William Markezana <william.markezana@me.com>
 *
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/* Degrees to radians conversion macro */
#define DEGREES_TO_RADIANS(degrees) (degrees) / 180.0 * M_PI

/* Colors creation macros */
#define WMRGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define WMRGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a/255.0]
#define WMCGRGB(r,g,b) WMRGB(r,g,b).CGColor
#define WMiCGRGB(r,g,b) (id)WMCGRGB(r,g,b)
#define WMCGRGBA(r,g,b,a) WMRGBA(r,g,b,a).CGColor
#define WMiCGRGBA(r,g,b,a) (id)WMCGRGBA(r,g,b,a)

/* Position macros */
#define kCenterX            0.5
#define kCenterY            0.5
#define kCenterPoint        CGPointMake(kCenterX, kCenterY)

/* Scale conversion macro from [0-1] range to view  real size range */
#define WMFULLSCALE(x,y)    (x)*rect.size.width, (y)*rect.size.height

/**
 * WMGaugeView style protocol
 */
@protocol WMGaugeViewStyle <NSObject>
@required
- (void)drawNeedleOnLayer:(CALayer*)layer inRect:(CGRect)rect;
- (void)drawFaceWithContext:(CGContextRef)context inRect:(CGRect)rect;
- (BOOL)needleLayer:(CALayer*)layer willMoveAnimated:(BOOL)animated duration:(NSTimeInterval)duration animation:(CAKeyframeAnimation*)animation;

@end
