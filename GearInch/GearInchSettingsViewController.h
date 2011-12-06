//
//  GearInchSettingsViewController.h
//  GearInch
//
//  Created by Erik Hope on 12/5/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GearInchSettingsViewController : UIViewController
{
    CGFloat wheelDiameters[5];
}



-(CGFloat)wheelDiameter;


-(IBAction) dismissSettings:(UIButton*)sender;
-(IBAction) wheelDiameterSelected:(UISegmentedControl*)wheelDiameterControl;

@property (strong, nonatomic) IBOutlet UISegmentedControl *wheelDiameterChooser;

@end
