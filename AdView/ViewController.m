//
//  ViewController.m
//  AdView
//
//  Created by Randall Brown on 11/15/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "RBAdView.h"
#import <iAd/iAd.h>

@implementation ViewController

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
   RBAdView *rbBanner = [[RBAdView alloc] initWithFrame:CGRectMake(0, 100, 320, 50)];
   [rbBanner setBackgroundImage:[UIImage imageNamed:@"RBAd0"] forState:UIControlStateNormal];

   rbBanner.actionBlock = ^(ADBannerView* banner, BOOL willLeaveApp){
      NSLog(@"Banner will open %@",banner);
      return YES; 
   };
   
   rbBanner.finishedBlock = ^(ADBannerView* banner){
      NSLog(@"Banner finished %@",banner);
   };
   
   [self.view addSubview:rbBanner];
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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
   return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)Launch:(id)sender 
{
   [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://descrumbled.com"]];
}
@end
