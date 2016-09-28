//
//  ViewController.m
//  WMGaugeView
//
//  Created by William Markezana on 28/01/14.
//  Copyright (c) 2014 Will™. All rights reserved.
//

#import "ViewController.h"
#import "WMGaugeView.h"

#define RGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]

@interface ViewController ()

@property (strong, nonatomic) IBOutlet WMGaugeView *gaugeView;
@property (strong, nonatomic) IBOutlet WMGaugeView *gaugeView2;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self prepareFirstGaugeView:_gaugeView];
    [self prepareSecondGaugeView:_gaugeView2];
    
    [NSTimer scheduledTimerWithTimeInterval:2.0
                                     target:self
                                   selector:@selector(gaugeUpdateTimer:)
                                   userInfo:nil
                                    repeats:YES];
}

- (void)prepareFirstGaugeView:(WMGaugeView *)gaugeView {
    gaugeView.style = [WMGaugeViewStyle3D new];
    gaugeView.maxValue = 240.0;
    gaugeView.showRangeLabels = YES;
    gaugeView.rangeValues = @[ @50,                  @90,                @130,               @240.0              ];
    gaugeView.rangeColors = @[ RGB(232, 111, 33),    RGB(232, 231, 33),  RGB(27, 202, 33),   RGB(231, 32, 43)    ];
    gaugeView.rangeLabels = @[ @"VERY LOW",          @"LOW",             @"OK",              @"OVER FILL"        ];
    gaugeView.unitOfMeasurement = @"psi";
    gaugeView.showUnitOfMeasurement = YES;
    gaugeView.scaleDivisionsWidth = 0.008;
    gaugeView.scaleSubdivisionsWidth = 0.006;
    gaugeView.rangeLabelsFontColor = [UIColor blackColor];
    gaugeView.rangeLabelsWidth = 0.04;
    gaugeView.rangeLabelsFont = [UIFont fontWithName:@"Helvetica" size:0.04];
}

- (void)prepareSecondGaugeView:(WMGaugeView *)gaugeView {
    
    gaugeView.style = [WMGaugeViewStyleFlatThin new];
    
    gaugeView.minValue = 0;
    gaugeView.maxValue = 10;
    
    gaugeView.rangeValues = @[
                               @(3),
                               @(7),
                               @(10),
                               ];
    
    gaugeView.rangeColors = @[
                               RGB(232, 231, 33),
                               RGB(27, 202, 33),
                               RGB(231, 32, 43)
                               ];
    
    gaugeView.showRangeLabels = YES;
    gaugeView.rangeLabels = @[ @"", @"", @"", ];
    
    gaugeView.showScale = NO;
    gaugeView.scaleDivisions = 1;
    gaugeView.scaleSubdivisions = 1;
    gaugeView.scaleStartAngle = 90;
    gaugeView.scaleEndAngle = 270;
    gaugeView.showScaleShadow = NO;
    gaugeView.showInnerBackground = NO;
    gaugeView.scaleFont = [UIFont systemFontOfSize:0.06 weight:UIFontWeightUltraLight];
    gaugeView.scalesubdivisionsAligment = WMGaugeViewSubdivisionsAlignmentCenter;
    gaugeView.backgroundColor = UIColor.whiteColor;
    gaugeView.showRangeDivisions = YES;
    gaugeView.scaleDivisionColor = UIColor.lightGrayColor;
    gaugeView.scaleDivisionsWidth = 0.003;
    gaugeView.scaleDivisionsLength = 0.04;
    gaugeView.scaleSubdivisionsWidth = 0.004;
    gaugeView.scaleSubdivisionsLength = 0.0;
    gaugeView.unitOfMeasurementColor = UIColor.darkGrayColor;
    
    gaugeView.unitOfMeasurement = @"psi";
    gaugeView.showUnitOfMeasurement = YES;
    
    gaugeView.value = 6;
}

-(void)gaugeUpdateTimer:(NSTimer *)timer
{
    _gaugeView.value = rand()%(int)_gaugeView.maxValue;
    [_gaugeView2 setValue:rand()%(int)_gaugeView2.maxValue animated:YES duration:1.6 completion:^(BOOL finished) {
        NSLog(@"gaugeView2 animation complete");
    }];
}

@end
