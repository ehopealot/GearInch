//
//  GearInchSettingsViewController.m
//  GearInch
//
//  Created by Erik Hope on 12/5/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "GearInchSettingsViewController.h"

@implementation GearInchSettingsViewController
@synthesize wheelDiameterChooser;


int wheelDiameterIndex = 3;


-(CGFloat)wheelDiameter
{
    NSLog(@"%f", wheelDiameters[wheelDiameterIndex]);
    return wheelDiameters[wheelDiameterIndex];
}

-(void)dismissSettings:(UIButton *)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        wheelDiameters[0] = 20.0f;
        wheelDiameters[1] = 24.0f;
        wheelDiameters[2] = 26.0f;
        wheelDiameters[3] = 27.0f;
        wheelDiameters[4] = 29.0f;
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    wheelDiameterChooser.selectedSegmentIndex = wheelDiameterIndex;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

#pragma mark UISegmentedControl

-(void)wheelDiameterSelected:(UISegmentedControl *)wheelDiameterControl
{
    NSLog(@"wheelDiameterSelected");
    wheelDiameterIndex = wheelDiameterControl.selectedSegmentIndex;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
