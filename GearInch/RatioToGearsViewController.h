//
//  SecondViewController.h
//  GearInch
//
//  Created by Erik Hope on 12/1/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RatioToGearsViewController : UIViewController 
<UIPickerViewDataSource, UIPickerViewDelegate, 
UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UIPickerView *gearInchSelector;
@property (nonatomic, strong) IBOutlet UITableView *ratioList;

@end
