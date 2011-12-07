//
//  GearInchSettingsViewController.m
//  GearInch
//
//  Created by Erik Hope on 12/5/11.
//  Copyright (c) 2011 Erik Hope. All rights reserved.
//

#import "GearInchSettingsViewController.h"

@implementation GearInchSettingsViewController
@synthesize wheelDiameterChooser, tireWidthLabel, tireWidthStepper;


static int rimDiameterIndex = 1;
static CGFloat mmToInchMultiplier = 0.0393700787;
static BOOL roadTireSelected = YES;
static int roadTireWidthIndex = 1;
static CGFloat mtbTireWidth = 2.0; 
static CGFloat rimDiameters[] = {571.0, 622.0, 406.0, 507.0, 599.0, 622.0}; //650c, 700c, 20", 24", 26", 29"
static CGFloat roadTireWidths[] = {20.0, 23.0, 25.0, 28.0, 32.0, 35.0, 38.0, 40.0};
static NSArray *rimDiameterTexts = nil;

-(CGFloat)wheelDiameter
{
    NSLog(@"wheel diameter %f", rimDiameters[rimDiameterIndex]);
    if (roadTireSelected){
        return (rimDiameters[rimDiameterIndex] + (CGFloat) 2 * roadTireWidths[roadTireWidthIndex]) * mmToInchMultiplier;
    } else {
        return rimDiameters[rimDiameterIndex] * mmToInchMultiplier + (CGFloat) 2 * mtbTireWidth;
    }
}

-(NSString *)wheelSettingsText
{
    if (!rimDiameterTexts){
        rimDiameterTexts = [NSArray arrayWithObjects:@"650c",@"700c",@"20\"",@"24\"",@"26\"",@"29\"", nil];
    }
    NSString *width;
    if (roadTireSelected){
        width = [NSString stringWithFormat:@"%2.0fmm", roadTireWidths[roadTireWidthIndex]];
    } else {
        width = [NSString stringWithFormat:@"%1.1f\"", mtbTireWidth];
    }
    return [NSString stringWithFormat:@"%@x%@", [rimDiameterTexts objectAtIndex:rimDiameterIndex], width];
}

-(void)dismissSettings:(UIButton *)sender
{
    [self dismissModalViewControllerAnimated:YES];
}


- (void)setTireWidthLabel
{
    NSString *tireWidthText;
    if (roadTireSelected){
        tireWidthText = [NSString stringWithFormat:@"%2.0fmm", roadTireWidths[roadTireWidthIndex]];
        tireWidthStepper.minimumValue = 0;
        tireWidthStepper.maximumValue = 7;
        tireWidthStepper.value = roadTireWidthIndex;
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

    wheelDiameterChooser.selectedSegmentIndex = rimDiameterIndex;
    [self setTireWidthLabel];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
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
        roadTireWidthIndex = stepper.value;
    } else {
        mtbTireWidth = stepper.value;
    }
    [self setTireWidthLabel];
}

@end
