//
//  MWButtonGroup_ExampleTests.m
//  MWButtonGroup-ExampleTests
//
//  Created by martin on 17/05/14.
//  Copyright (c) 2014 Martin Wilz. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "MWButtonGroup.h"

@interface MWButtonGroupTests : XCTestCase

@end

@implementation MWButtonGroupTests

- (void)testButtonCreation
{
    MWButtonGroup *group = [MWButtonGroup new];
    [group createButtonsForTitles:@[@"1", @"2", @"3"]];
    XCTAssertTrue(group.buttons.count == 3, @"number of buttons created is correct");
}

- (void)testSingleSelect
{
    MWButtonGroup *group = [MWButtonGroup new];
    [group createButtonsForTitles:@[@"1", @"2", @"3"]];

    [group selectButtonAtIndex:0];

    XCTAssertTrue(group.selectedIndexSet.count == 1, @"index count is correct");
    XCTAssertTrue([group.selectedIndexSet containsIndex:0], @"selected index is correct");

    [group selectButtonAtIndex:1];

    XCTAssertTrue(group.selectedIndexSet.count == 1, @"index count is correct");
    XCTAssertTrue([group.selectedIndexSet containsIndex:1], @"selected index is correct");
}

- (void)testMultiSelect
{
    MWButtonGroup *group = [MWButtonGroup new];
    [group createButtonsForTitles:@[@"1", @"2", @"3"]];
    group.multiSelectAllowed = YES;

    [group selectButtonAtIndex:1];

    XCTAssertTrue(group.selectedIndexSet.count == 1, @"index count is correct");
    XCTAssertTrue([group.selectedIndexSet containsIndex:1], @"selected index is correct");

    [group selectButtonAtIndex:2];

    XCTAssertTrue(group.selectedIndexSet.count == 2, @"two elements are selected");
    XCTAssertTrue([group.selectedIndexSet containsIndex:1], @"index 1 is in set");
    XCTAssertTrue([group.selectedIndexSet containsIndex:2], @"index 2 is in set");
}


@end
