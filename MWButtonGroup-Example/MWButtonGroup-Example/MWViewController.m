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
@property (weak, nonatomic) IBOutlet MWButtonGroup *coloredButtonGroup;
@property (weak, nonatomic) IBOutlet MWButtonGroup *fontButtonGroup;

@end

@implementation MWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.buttonGroup createButtonsForTitles:@[@"Yes", @"No", @"Maybe"]];
    [self.buttonGroup selectButtonAtIndex:0];
    self.buttonGroup.delegate = self;

    [self.coloredButtonGroup createButtonsForTitles:@[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9"]];
    self.coloredButtonGroup.multiSelectAllowed = YES;
    [self.coloredButtonGroup selectButtonAtIndex:1];
    [self.coloredButtonGroup selectButtonAtIndex:3];
    [self.coloredButtonGroup selectButtonAtIndex:5];
    [self.coloredButtonGroup selectButtonAtIndex:7];
    self.coloredButtonGroup.textColor = [UIColor yellowColor];
    self.coloredButtonGroup.buttonBackgroundColor = [UIColor colorWithRed:0 green:0.25 blue:0 alpha:1];

    self.fontButtonGroup.font = [UIFont fontWithName:@"FontAwesome" size:32];
    [self.fontButtonGroup createButtonsForTitles:@[@"\uf1b9", @"\uf072", @"\uf015"]];
    [self.fontButtonGroup selectButtonAtIndex:0];
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
