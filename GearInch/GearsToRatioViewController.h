//
//  FirstViewController.h
//  GearInch
//
//  Created by Erik Hope on 12/1/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GearInchSettingsViewController;

@interface GearsToRatioViewController : UIViewController
{
    GearInchSettingsViewController *settingsViewController;
    int lastSelectedCogIndex;
    int lastSelectedChainwheelIndex;
}


@property (strong, nonatomic) IBOutlet UIViewController *settingsViewController;
@property (strong, nonatomic) IBOutlet UIPickerView *sizePicker;
@property (strong, nonatomic) IBOutlet UILabel *ratioLabel;
@property (strong, nonatomic) IBOutlet UILabel *contextLabel;


@end
