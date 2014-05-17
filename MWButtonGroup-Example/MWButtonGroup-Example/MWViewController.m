//
//  MWViewController.m
//  MWButtonGroup-Example
//
//  Created by martin on 17/05/14.
//  Copyright (c) 2014 Martin Wilz. All rights reserved.
//

#import "MWViewController.h"

@interface MWViewController ()

@property (weak, nonatomic) IBOutlet MWButtonGroup *buttonGroup;

@end

@implementation MWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.buttonGroup addButtonsForTitles:@[@"Yes", @"No", @"Maybe"]];
    [self.buttonGroup selectButtonAtIndex:0];

    //self.buttonGroup.multiSelectAllowed = YES;

    self.buttonGroup.delegate = self;
}

- (void)buttonGroup:(MWButtonGroup *)buttonGroup didSelectButtonAtIndex:(NSUInteger)index
{
    NSLog(@"selected button at index %d", index);
}

- (void)buttonGroup:(MWButtonGroup *)buttonGroup didDeselectButtonAtIndex:(NSUInteger)index
{
    NSLog(@"deselected button at index %d", index);

}

- (void)buttonGroup:(MWButtonGroup *)buttonGroup didSelectButton:(UIButton *)button
{
    NSLog(@"selected button with title '%@'", button.titleLabel.text);

}

- (void)buttonGroup:(MWButtonGroup *)buttonGroup didDeselectButton:(UIButton *)button
{
    NSLog(@"deselected button with title '%@'", button.titleLabel.text);
}


@end
