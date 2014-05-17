//
//  MWButtonGroup.h
//  MWButtonGroup-Example
//
//  Created by martin on 17/05/14.
//  Copyright (c) 2014 Martin Wilz. All rights reserved.
//

#import <UIKit/UIKit.h>
/** a UIView subclass containing an array of buttons
 */
@interface MWButtonGroup : UIView

/** readonly property for accessing the array of buttons */
@property (strong, nonatomic,readonly)  NSArray *buttons;

/** textColor of the button labels. TODO: custom setter to update buttons already created*/
@property (strong, nonatomic)           UIColor *textColor;

/** property for determining the selection pattern */
@property (assign)                      BOOL    multiSelectAllowed;

/** method for replacing the current buttons by giving a list of titles. buttons are text only in this case
 @param titles  an NSArray of strings
 */
- (void)addButtonsForTitles:(NSArray *)titles;

@end
