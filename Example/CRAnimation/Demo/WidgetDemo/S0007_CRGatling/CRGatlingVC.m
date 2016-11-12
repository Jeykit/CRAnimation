//
//  CRGatlingVC.m
//  CRAnimation
//
//  Created by I_MT on 2016/11/8.
//  Copyright © 2016年 BearRan. All rights reserved.
//

#import "CRGatlingVC.h"
#import "CRGatling.h"

@interface CRGatlingVC ()
{
    CRGatling   *_progressView;
    UISlider    *_slider;
}

@end


@implementation CRGatlingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
    [self addTopBar];
}

- (void)createUI
{
    _progressView = [[CRGatling alloc] initWithFrame:CGRectMake(5, 50, 355, 75)];
    [self.view addSubview:_progressView];
    
    _slider = [[UISlider alloc] initWithFrame:CGRectMake(0, 0, WIDTH * 0.8, 30)];
    _slider.continuous = NO;
    [_slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_slider];
    [_slider BearSetRelativeLayoutWithDirection:kDIR_DOWN destinationView:_progressView parentRelation:NO distance:100 center:YES];
}

- (void)sliderValueChanged:(UISlider *)slider
{
    NSLog(@"slider:%f", slider.value);
    [_progressView setProgress:slider.value];
}

@end