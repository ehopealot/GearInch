//
//  FirstViewController.h
//  GearInch
//
//  Created by Erik Hope on 12/1/11.
//  Copyright (c) 2011 Erik Hope. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GearInchSettingsViewController;

@interface GearsToRatioViewController : UIViewController
{
    int lastSelectedCogIndex;
    int lastSelectedChainwheelIndex;
    CGFloat diameter;
}


@property (strong, nonatomic) IBOutlet UIViewController *settingsViewController;
@property (strong, nonatomic) IBOutlet UIPickerView *sizePicker;
@property (strong, nonatomic) IBOutlet UILabel *ratioLabel;
@property (strong, nonatomic) IBOutlet UILabel *contextLabel;
@property (nonatomic, strong) IBOutlet UIBarButtonItem *wheelSizeButton;


@end
