//
//  GearInchSettingsViewController.m
//  GearInch
//
//  Created by Erik Hope on 12/5/11.
//  Copyright (c) 2011 Erik Hope. All rights reserved.
//

#import "GearInchSettingsViewController.h"

NSString *rimDiameterKey = @"rimDiameter";
NSString *roadTireWidthKey = @"roadTireWidth";
NSString *mtbTireWidthKey = @"mtbTireWidth";
NSString *wheelDiameterKey = @"wheelDiameterKey";
NSString *tireSizeTextKey = @"tireSizeText";
CGFloat mmToInchMultiplier = 0.0393700787;


@implementation GearInchSettingsViewController
@synthesize wheelDiameterChooser, tireWidthLabel, tireWidthStepper;


static int rimDiameterIndex = 1;
static BOOL roadTireSelected = YES;
static CGFloat mtbTireWidth = 2.0; 
static CGFloat roadTireWidth = 0.0;
static CGFloat rimDiameters[] = {571.0, 622.0, 406.0, 507.0, 599.0, 622.0}; //650c, 700c, 20", 24", 26", 29"
static NSArray *rimDiameterTexts = nil;


-(void)dismissSettings:(UIButton *)sender
{
    [self dismissModalViewControllerAnimated:YES];
}


- (void)setTireWidthLabel
{
    NSString *tireWidthText;
    if (roadTireSelected){
        tireWidthText = [NSString stringWithFormat:@"%2.0fmm", roadTireWidth];
        tireWidthStepper.minimumValue = 18;
        tireWidthStepper.maximumValue = 60;
        tireWidthStepper.value = roadTireWidth;
    } else {
        tireWidthText = [NSString stringWithFormat:@"%1.1f\"", mtbTireWidth];
        tireWidthStepper.minimumValue = 1;
        tireWidthStepper.maximumValue = 4;
        tireWidthStepper.stepValue = 0.1;
        tireWidthStepper.value = mtbTireWidth;
    }
    tireWidthLabel.text = tireWidthText;

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
    if (!rimDiameterTexts){
        rimDiameterTexts = [NSArray arrayWithObjects:@"650c",@"700c",@"20\"",@"24\"",@"26\"",@"29\"", nil];
    }

    NSUserDefaults *preferences = [NSUserDefaults standardUserDefaults];
    
    rimDiameterIndex = [preferences integerForKey:rimDiameterKey];
    roadTireSelected = rimDiameterIndex <= 1;
    roadTireWidth = [preferences floatForKey:roadTireWidthKey];
    mtbTireWidth = [preferences floatForKey:mtbTireWidthKey];
    wheelDiameterChooser.selectedSegmentIndex = rimDiameterIndex;
    [self setTireWidthLabel];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    // Save the preferences
    NSUserDefaults *preferences = [NSUserDefaults standardUserDefaults];
    [preferences setInteger:rimDiameterIndex forKey:rimDiameterKey];
    [preferences setFloat:roadTireWidth forKey:roadTireWidthKey];
    [preferences setFloat:mtbTireWidth forKey:mtbTireWidthKey];
    NSString *width;
    CGFloat widthValue;
    if (roadTireSelected){
        width = [NSString stringWithFormat:@"%2.0fmm", roadTireWidth];
        widthValue = rimDiameters[rimDiameterIndex] * mmToInchMultiplier + 2*roadTireWidth * mmToInchMultiplier;
    } else {
        width = [NSString stringWithFormat:@"%1.1f\"", mtbTireWidth];
        widthValue = rimDiameters[rimDiameterIndex] * mmToInchMultiplier + 2* mtbTireWidth;
    }
    [preferences setObject:[NSString stringWithFormat:@"%@x%@", [rimDiameterTexts objectAtIndex:rimDiameterIndex], width] forKey:@"tireSizeText"];
    [preferences setFloat:widthValue forKey:wheelDiameterKey];

}

#pragma mark UISegmentedControl

-(void)rimDiameterSelected:(UISegmentedControl *)wheelDiameterControl
{
    NSLog(@"rimDiameterselected");
    rimDiameterIndex = wheelDiameterControl.selectedSegmentIndex;
    roadTireSelected = (rimDiameterIndex <= 1);
    [self setTireWidthLabel];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark UIStepper

-(void)tireWidthChanged:(UIStepper *)stepper
{
    if (roadTireSelected){
        roadTireWidth = stepper.value;
    } else {
        mtbTireWidth = stepper.value;
    }
    [self setTireWidthLabel];
}

@end
