//
//  MWButtonGroup.m
//  MWButtonGroup-Example
//
//  Created by martin on 17/05/14.
//  Copyright (c) 2014 Martin Wilz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MWButtonGroup.h"

@implementation MWButtonGroup

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    if (self) {
        [self _setupDefaults];
    }

    return self;
}


- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];

    if (self) {
        [self _setupDefaults];
    }

    return self;
}


- (void)_setupDefaults
{
    _buttons = @[];

    self.layer.cornerRadius = 8;
    self.layer.borderColor = [UIColor whiteColor].CGColor;
    self.layer.borderWidth = 1;

    self.textColor = [UIColor whiteColor];
}


- (void)addButtonsForTitles:(NSArray *)titles
{
    NSMutableArray *buttons = [NSMutableArray new];

    for (NSString *title in titles) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:self.textColor forState:UIControlStateNormal];
        [buttons addObject:button];
        [self addSubview:button];
    }

    _buttons = [NSArray arrayWithArray:buttons];
}


- (void)layoutSubviews
{
    [super layoutSubviews];

    CGRect buttonFrame = self.bounds;

    buttonFrame.size.width = ((self.frame.size.width - 1) / self.buttons.count) - self.buttons.count;

    CGFloat x = 1;

    for (UIButton *button in self.buttons) {
        buttonFrame.origin.x = x;
        button.frame = buttonFrame;
        x += buttonFrame.size.width + 1;
    }
}

@end
