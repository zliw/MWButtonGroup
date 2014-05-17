//
//  MWViewController.m
//  MWButtonGroup-Example
//
//  Created by martin on 17/05/14.
//  Copyright (c) 2014 Martin Wilz. All rights reserved.
//

#import "MWViewController.h"
#import "MWButtonGroup.h"

@interface MWViewController ()

@property (weak, nonatomic) IBOutlet MWButtonGroup *buttonGroup;

@end

@implementation MWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.buttonGroup addButtonsForTitles:@[@"Yes", @"No", @"Maybe"]];
    [self.buttonGroup selectButtonAtIndex:0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
