//
//  FirstViewController.m
//  GearInch
//
//  Created by Erik Hope on 12/1/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "GearsToRatioViewController.h"

@implementation GearsToRatioViewController
@synthesize sizePicker, ratioLabel;

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
    [super viewWillAppear:animated];
    [self.sizePicker selectRow:6 inComponent:kCogComponent animated:NO];
    [self.sizePicker selectRow:15 inComponent:kChainWheelComponent animated:NO];
    CGFloat cog = 17;
    CGFloat chainWheel = 46;
    CGFloat ratio = (chainWheel/cog)*27.0f;
    ratioLabel.text = [NSString stringWithFormat:@"%3.2f", ratio];

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
    return (pickerView.frame.size.width-40)/2;
}

-(NSString*)pickerView:(UIPickerView *)pickerView 
           titleForRow:(NSInteger)row 
          forComponent:(NSInteger)component
{
    if (component == kChainWheelComponent){
        return [NSString stringWithFormat:@"%i", row+31];
    } else {
        return [NSString stringWithFormat:@"%i", row+11];
    }
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    CGFloat cog = [self.sizePicker selectedRowInComponent:kCogComponent] + 11;
    CGFloat chainWheel = [self.sizePicker selectedRowInComponent:kChainWheelComponent] + 31;
    CGFloat ratio = (chainWheel/cog)*27.0f;
    ratioLabel.text = [NSString stringWithFormat:@"%3.2f", ratio];
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
    return NO;
}

@end
