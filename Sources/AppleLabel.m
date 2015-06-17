//
//  AppleLabel.m
//  UILabel
//
//  Created by Christian Schnorr on 6/17/15.
//  Copyright (c) 2015 Christian Schnorr. All rights reserved.
//

#import "AppleLabel.h"


@implementation AppleLabel

- (void)drawTextInRect:(CGRect)rect
{
    // TODO: implement
    [self thisDoesntQuiteGiveYouTheBountyYet:rect];
}

- (void)thisDoesntQuiteGiveYouTheBountyYet:(CGRect)rect
{
    // NOTE: as you can see even in with the base font UILabel positions the text a pixel further up
    CGFloat const scale = UIScreen.mainScreen.scale;
    CGFloat const offset = round((CGRectGetHeight(rect) - [self sizeThatFits:CGSizeZero].height) / 2.0 * scale) / scale;

    [self.attributedText drawInRect:CGRectOffset(rect, 0.0, offset)];
}

@end
