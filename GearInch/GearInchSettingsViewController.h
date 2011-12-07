//
//  GearInchSettingsViewController.h
//  GearInch
//
//  Created by Erik Hope on 12/5/11.
//  Copyright (c) 2011 Erik Hope. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GearInchSettingsViewController : UIViewController
{
}



-(CGFloat) wheelDiameter;
-(NSString *) wheelSettingsText;


-(IBAction) dismissSettings:(UIButton*)sender;
-(IBAction) rimDiameterSelected:(UISegmentedControl*)wheelDiameterControl;
-(IBAction) tireWidthChanged:(UIStepper*)stepper;

-(void) setTireWidthLabel;

@property (strong, nonatomic) IBOutlet UISegmentedControl *wheelDiameterChooser;
@property (strong, nonatomic) IBOutlet UILabel *tireWidthLabel;
@property (strong, nonatomic) IBOutlet UIStepper *tireWidthStepper;

@end
