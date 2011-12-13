//
//  SecondViewController.m
//  GearInch
//
//  Created by Erik Hope on 12/1/11.
//  Copyright (c) 2011 Erik Hope. All rights reserved.
//

#import "RatioToGearsViewController.h"
#import "GearInchSettingsViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation RatioToGearsViewController
@synthesize gearInchSelector, ratioList, downArrow, settingsViewController, wheelSizeButton,
pickerBackground;

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
    if (!settingsViewController){
        settingsViewController = [[GearInchSettingsViewController alloc] 
                                  initWithNibName:@"GearInchSettingsViewController" 
                                  bundle:nil];
    }

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
    if (!data){
        data = [NSMutableArray array];
        lastSelectedRatio = 40;
        ratioList.layer.borderWidth = 1.0;
    }
    //self.gearInchSelector.frame = CGRectMake(f.origin.x, f.origin.y, f.size.width, 162);
    NSUserDefaults *preferences = [NSUserDefaults standardUserDefaults];
    wheelSizeButton.title = [preferences objectForKey:tireSizeTextKey];
    diameter = [preferences floatForKey:wheelDiameterKey];
    pickerBackground.clipsToBounds = YES;
    pickerBackground.layer.cornerRadius = 10.0;
    pickerBackground.layer.shadowRadius = 2.0;
    pickerBackground.layer.shadowOffset = CGSizeMake(1.0, 1.0);
    pickerBackground.layer.shadowOpacity = 0.5;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.gearInchSelector selectRow:lastSelectedRatio inComponent:0 animated:NO];
    [self calculateSizesForRatio:71];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark UIPickerViewDelegate
-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 40.0f;
}

-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return pickerView.frame.size.width-20;
}

-(NSString*)pickerView:(UIPickerView *)pickerView 
           titleForRow:(NSInteger)row 
          forComponent:(NSInteger)component
{
    return [NSString stringWithFormat:@"%i Gear Inches", row+31];
}

-(void)calculateSizesForRatio:(int)ratio
{
    [data removeAllObjects];

    for (CGFloat cog = 11; cog <= 26; cog++){
        CGFloat chainwheel = round((cog*ratio)/diameter);
        if (chainwheel < 62){
            [data addObject:[NSString stringWithFormat:@"%i x %i", (int)chainwheel, (int)cog]];
        }
    }
    [ratioList reloadData];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    lastSelectedRatio = row;
    int ratio = row+31;
    [self calculateSizesForRatio:ratio];

    [ratioList scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] 
                     atScrollPosition:UITableViewScrollPositionNone animated:YES];
}

#pragma mark UIPickerViewDataSource

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 107;
}


#pragma mark UITableViewDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30;
}

#pragma mark UITableViewDataSource

-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return data.count;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.textLabel.text = [data objectAtIndex:indexPath.row];
    cell.textLabel.textAlignment = UITextAlignmentCenter;
    cell.backgroundColor = [UIColor clearColor];
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.ratioList dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) 
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];

    }
    
	return cell;
}

-(void)infoButtonClicked:(UIButton *)infoButton
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"GearInch"
                                                    message:@"hi" delegate:nil cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}


@end
