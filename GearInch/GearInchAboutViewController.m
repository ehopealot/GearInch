//
//  GearInchAboutViewController.m
//  GearInch
//
//  Created by Erik Hope on 12/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "GearInchAboutViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation GearInchAboutViewController
@synthesize textBox;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


-(void)dismissAbout:(UIButton *)button
{
    [self dismissModalViewControllerAnimated:YES];
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    textBox.layer.cornerRadius = 10;
    textBox.alpha = 0.9;
    textBox.layer.borderWidth = 1.0;
    textBox.layer.shadowOffset = CGSizeMake(20.0, 20.0);
    textBox.layer.shadowOpacity = 1;
    textBox.layer.shadowRadius = 10;
    textBox.layer.shadowColor = [UIColor blackColor].CGColor;
    textBox.text = @"GearInch (c) 2011 Erik Hope \n\nWhat is a gear inch ratio? \n\nThe gear inch ratio of a bicycle is a measure of how low or high a gear is. The higher the ratio, the higher the gear, and the farther your bike travels with each rotation of the pedals. Use GearInch to determine which cog and chainwheel sizes you need to achieve your desired ratio, or to calculate what the ratio of a given cog and chainwheel is.";


}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
