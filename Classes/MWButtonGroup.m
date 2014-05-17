//
//  MWButtonGroup.m
//  MWButtonGroup-Example
//
//  Created by martin on 17/05/14.
//  Copyright (c) 2014 Martin Wilz. All rights reserved.
//

#import "MWButtonGroup.h"

@implementation MWButtonGroup

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _setup];
    }
    return self;
}


- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];

    if (self) {
        [self _setup];
    }
    return self;
}

- (void)_setup
{
    _buttons = @[];

    self.layer.cornerRadius = 8;
    self.layer.borderColor = [UIColor whiteColor].CGColor;
    self.layer.borderWidth = 1;
}

- (void)addButtonsForTitles:(NSArray *)titles
{
    NSMutableArray *buttons = [NSMutableArray new];

    for (NSString *title in titles) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button setTitle:title forState:UIControlStateNormal];
        [buttons addObject:button];
        [self addSubview:button];
    }

    _buttons = [NSArray arrayWithArray:buttons];
}

@end
