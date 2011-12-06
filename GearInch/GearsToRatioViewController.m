//
//  FirstViewController.m
//  GearInch
//
//  Created by Erik Hope on 12/1/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "GearsToRatioViewController.h"
#import "GearInchSettingsViewController.h"

@implementation GearsToRatioViewController
@synthesize sizePicker, ratioLabel, settingsViewController, contextLabel;

const int kChainWheelComponent = 0;
const int kCogComponent = 1;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (!settingsViewController){
        settingsViewController = [[GearInchSettingsViewController alloc] 
                                  initWithNibName:@"GearInchSettingsViewController" 
                                  bundle:nil];
    }
    NSLog(@"viewDidLoad");
    lastSelectedCogIndex = 6;
    lastSelectedChainwheelIndex = 15;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"viewWillAppear");
    [super viewWillAppear:animated];
    [self.sizePicker selectRow:lastSelectedCogIndex 
                   inComponent:kCogComponent animated:NO];
    [self.sizePicker selectRow:lastSelectedChainwheelIndex
                   inComponent:kChainWheelComponent animated:NO];
    CGFloat cog = lastSelectedCogIndex + 11;
    CGFloat chainWheel = lastSelectedChainwheelIndex + 31;
    CGFloat diameter = [settingsViewController wheelDiameter];
    CGFloat ratio = (chainWheel/cog)*diameter;
    ratioLabel.text = [NSString stringWithFormat:@"%3.0f", ratio];
    contextLabel.text = [NSString stringWithFormat:@"The Gear-Inch Ratio for %2.0fx%2.0f is:", chainWheel, cog];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}


#pragma mark UIPickerViewDelegate
-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 40.0f;
}

-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return (pickerView.frame.size.width-20)/2;
}

-(NSString*)pickerView:(UIPickerView *)pickerView 
           titleForRow:(NSInteger)row 
          forComponent:(NSInteger)component
{
    if (component == kChainWheelComponent){
        return [NSString stringWithFormat:@"%i-tooth", row+31];
    } else {
        return [NSString stringWithFormat:@"%i-tooth", row+11];
    }
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    lastSelectedCogIndex = [self.sizePicker selectedRowInComponent:kCogComponent];
    lastSelectedChainwheelIndex = [self.sizePicker selectedRowInComponent:kChainWheelComponent];
    CGFloat cog = lastSelectedCogIndex + 11;
    CGFloat chainWheel = lastSelectedChainwheelIndex + 31;
    CGFloat diameter = [settingsViewController wheelDiameter];
    CGFloat ratio = (chainWheel/cog)*diameter;
    contextLabel.text = [NSString stringWithFormat:@"The Gear-Inch Ratio for %2.0fx%2.0f is:", chainWheel, cog];
    ratioLabel.text = [NSString stringWithFormat:@"%3.0f", ratio];
}

#pragma mark UIPickerViewDataSource



-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
    if (component == kCogComponent){
        return 16;
    } else {
        return 31;
    }

}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
