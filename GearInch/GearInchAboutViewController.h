//
//  GearInchAboutViewController.h
//  GearInch
//
//  Created by Erik Hope on 12/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GearInchAboutViewController : UIViewController

-(IBAction)dismissAbout:(UIButton*)button;

@property (strong, nonatomic) IBOutlet UITextView *textBox;

@end
