//
//  MasterViewController.m
//  UILabel
//
//  Created by Christian Schnorr on 6/17/15.
//  Copyright (c) 2015 Christian Schnorr. All rights reserved.
//

#import "RootViewController.h"
#import "AppleLabel.h"


@interface RootViewController ()

@property (nonatomic, strong) UILabel *label1;
@property (nonatomic, strong) UILabel *label2;
@property (nonatomic, strong) UISlider *slider;
@end


@implementation RootViewController

- (instancetype)init
{
    return [super initWithNibName:nil bundle:nil];
}

- (void)loadView
{
    [super loadView];

    self.label1 = [[UILabel alloc] initWithFrame:CGRectNull];
    self.label1.text = @"Lorem";
    self.label1.textAlignment = NSTextAlignmentRight;

    self.label2 = [[AppleLabel alloc] initWithFrame:CGRectNull];
    self.label2.text = self.label1.text;
    self.label2.textAlignment = NSTextAlignmentLeft;

    self.slider = [[UISlider alloc] initWithFrame:CGRectNull];
    self.slider.minimumValue = 12.0;
    self.slider.maximumValue = 36.0;
    self.slider.value = 24.0;

    [self.view addSubview:self.label1];
    [self.view addSubview:self.label2];
    [self.view addSubview:self.slider];
}

- (void)viewDidLoad
{
    self.view.backgroundColor = UIColor.whiteColor;
    self.label1.backgroundColor = UIColor.greenColor;
    self.label2.backgroundColor = UIColor.orangeColor;

    [self.slider addTarget:self action:@selector(sliderDidChange:) forControlEvents:UIControlEventValueChanged];
    [self.slider sendActionsForControlEvents:UIControlEventEditingChanged];
}

- (void)viewWillLayoutSubviews
{
    CGRect const label1Frame = {
        .origin.x = CGRectGetMinX(self.view.bounds),
        .origin.y = CGRectGetMinY(self.view.bounds),
        .size.width = CGRectGetWidth(self.view.bounds) / 2.0,
        .size.height = CGRectGetHeight(self.view.bounds) / 2.0,
    };

    CGRect const label2Frame = {
        .origin.x = CGRectGetMinX(self.view.bounds) + CGRectGetWidth(self.view.bounds) / 2.0,
        .origin.y = CGRectGetMinY(self.view.bounds),
        .size.width = CGRectGetWidth(self.view.bounds) / 2.0,
        .size.height = CGRectGetHeight(self.view.bounds) / 2.0,
    };

    CGRect const sliderFrame = {
        .origin.x = CGRectGetMinX(self.view.bounds),
        .origin.y = CGRectGetMaxY(label1Frame),
        .size = [self.slider sizeThatFits:self.view.bounds.size],
    };

    self.label1.frame = label1Frame;
    self.label2.frame = label2Frame;
    self.slider.frame = sliderFrame;
}

- (void)sliderDidChange:(UISlider *)slider
{
    self.label1.font = [UIFont systemFontOfSize:slider.value];
    self.label2.font = [UIFont systemFontOfSize:slider.value];
}

@end
