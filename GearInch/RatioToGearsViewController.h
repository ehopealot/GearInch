//
//  SecondViewController.h
//  GearInch
//
//  Created by Erik Hope on 12/1/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GearInchSettingsViewController;

@interface RatioToGearsViewController : UIViewController 
<UIPickerViewDataSource, UIPickerViewDelegate, 
UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *data;
    GearInchSettingsViewController *settingsViewController;
    int lastSelectedRatio;
}

-(void)calculateSizesForRatio:(int)ratio;

@property (strong, nonatomic) IBOutlet UIViewController *settingsViewController;
@property (nonatomic, strong) IBOutlet UIPickerView *gearInchSelector;
@property (nonatomic, strong) IBOutlet UITableView *ratioList;
@property (nonatomic, strong) IBOutlet UIImageView *downArrow;

@end
