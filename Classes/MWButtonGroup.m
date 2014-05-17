//
//  MWButtonGroup.m
//  MWButtonGroup-Example
//
//  Created by martin on 17/05/14.
//  Copyright (c) 2014 Martin Wilz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MWButtonGroup.h"

@interface MWButtonGroup()

// views used for separator lines, these are all one pixel wide
@property (strong, nonatomic) NSArray *lineViews;

@end

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

    self.clipsToBounds = YES;

    self.layer.cornerRadius = 8;
    self.layer.borderColor = [UIColor whiteColor].CGColor;
    self.layer.borderWidth = 1;

    self.textColor = [UIColor whiteColor];
}


- (void)addButtonsForTitles:(NSArray *)titles
{
    NSMutableArray *buttons = [NSMutableArray new];
    NSMutableArray *lineViews = [NSMutableArray new];

    for (NSString *title in titles) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:self.textColor forState:UIControlStateNormal];
        [buttons addObject:button];
        [self addSubview:button];

        UIView *lineView = [UIView new];
        lineView.backgroundColor = [UIColor whiteColor];
        [lineViews addObject:lineView];
        [self addSubview:lineView];
    }

    _lineViews = [NSArray arrayWithArray:lineViews];
    _buttons = [NSArray arrayWithArray:buttons];
}


- (void)layoutSubviews
{
    [super layoutSubviews];

    CGRect buttonFrame = self.bounds;
    buttonFrame.size.width = ((self.frame.size.width - 1) / self.buttons.count) - self.buttons.count;

    CGRect lineFrame = self.bounds;
    lineFrame.size.width = 1;

    CGFloat x = 1;

    for (NSUInteger i = 0; i < _buttons.count; i++) {
        UIButton *button = _buttons[i];
        buttonFrame.origin.x = x;
        button.frame = buttonFrame;

        if (i < _buttons.count) {
            UIView *lineView = _lineViews[i];
            lineFrame.origin.x = x - 1;
            lineView.frame = lineFrame;
        }

        x += buttonFrame.size.width + 1;
    }
}

@end
