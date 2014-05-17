//
//  MWButtonGroup.m
//  MWButtonGroup-Example
//
//  Created by martin on 17/05/14.
//  Copyright (c) 2014 Martin Wilz. All rights reserved.
//

#import "MWButtonGroup.h"

@interface MWButtonGroup()

// views used for separator lines, these are all one pixel wide
@property (strong, nonatomic) NSArray *lineViews;

// set of indexes for the selected buttons. for internal use only
@property (strong, nonatomic) NSMutableIndexSet *selectedIndexSet;


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
    _selectedIndexSet = [NSMutableIndexSet new];
}


- (void)addButtonsForTitles:(NSArray *)titles
{
    NSMutableArray *buttons = [NSMutableArray new];
    NSMutableArray *lineViews = [NSMutableArray new];

    for (NSString *title in titles) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:self.textColor forState:UIControlStateNormal];
        [button addTarget:self
                   action:@selector(buttonPressed:)
         forControlEvents:UIControlEventTouchUpInside];
        [buttons addObject:button];
        [self addSubview:button];

        UIView *lineView = [UIView new];
        lineView.backgroundColor = [UIColor whiteColor];
        [lineViews addObject:lineView];
        [self addSubview:lineView];
    }

    _selectedIndexSet = [NSMutableIndexSet new];
    _lineViews = [NSArray arrayWithArray:lineViews];
    _buttons = [NSArray arrayWithArray:buttons];
}


// internal method used, when deselection occurs triggered by user interaction
- (void)_notifyDeselection:(NSIndexSet *)indexSet
{
    if (self.delegate) {

        [indexSet enumerateIndexesUsingBlock:^(NSUInteger index, BOOL *stop) {

            if ([self.delegate respondsToSelector:@selector(buttonGroup:didDeselectButtonAtIndex:)]) {
                [self.delegate buttonGroup:self didDeselectButtonAtIndex:index];
            }
            if ([self.delegate respondsToSelector:@selector(buttonGroup:didDeselectButton:)]) {
                [self.delegate buttonGroup:self didDeselectButton:_buttons[index]];
            }
        }];
    }
}


// internal method used, when selection occurs triggered by user interaction
- (void)_notifySelection:(NSUInteger)index
{
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(buttonGroup:didSelectButtonAtIndex:)]) {
            [self.delegate buttonGroup:self didSelectButtonAtIndex:index];
        }
        if ([self.delegate respondsToSelector:@selector(buttonGroup:didSelectButton:)]) {
            [self.delegate buttonGroup:self didSelectButton:_buttons[index]];
        }
    }
}


- (IBAction)buttonPressed:(id)sender
{
    NSInteger index = [_buttons indexOfObject:sender];

    if (index != NSNotFound) {
        if (self.multiSelectAllowed) {

            if (![_selectedIndexSet containsIndex:index]) {
                [self selectButtonAtIndex:index];
                [self _notifySelection:index];
            }
            else {
                [self deselectButtonAtIndex:index];
                [self _notifyDeselection:[NSIndexSet indexSetWithIndex:index]];
            }

            return;
        }

        if (![_selectedIndexSet containsIndex:index]) {
            NSMutableIndexSet *copy =  [self.selectedIndexSet mutableCopy];
            [copy removeIndex:index];

            [self selectButtonAtIndex:index];
            [self _notifyDeselection:copy];
            [self _notifySelection:index];
        }
    }
}


- (void)layoutSubviews
{
    [super layoutSubviews];

    CGRect buttonFrame = self.bounds;
    buttonFrame.size.width = ((self.frame.size.width - 1) / self.buttons.count) - 1;

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


- (void)selectButtonAtIndex:(NSUInteger)index
{
    if (index > _buttons.count) return;

    if (!self.multiSelectAllowed) {
        [_selectedIndexSet removeAllIndexes];

        for (UIButton *button in _buttons) {
            button.backgroundColor = [UIColor blackColor];
            [button setTitleColor:self.textColor forState:UIControlStateNormal];
        }
    }

    [_selectedIndexSet addIndex:index];

    UIButton *button = _buttons[index];
    button.backgroundColor = [UIColor whiteColor];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}


- (void)deselectButtonAtIndex:(NSUInteger)index
{
    if (index > self.buttons.count) return;

    [_selectedIndexSet removeIndex:index];
    [self setNeedsLayout];

    UIButton *button = _buttons[index];
    button.backgroundColor = [UIColor blackColor];
    [button setTitleColor:self.textColor forState:UIControlStateNormal];
}

@end
