//
//  RBAdView.m
//  AdView
//
//  Created by Randall Brown on 11/15/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "RBAdView.h"

#import <iAd/iAd.h>

@implementation RBAdView

@synthesize actionBlock;
@synthesize finishedBlock;

-(void)commonInit
{
   ADBannerView *ad = [[[ADBannerView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)] autorelease];
   ad.delegate = self;
   ad.hidden = YES;
   [self addSubview:ad];
}

-(id)initWithFrame:(CGRect)frame
{
   self = [super initWithFrame:frame];
   if( self )
   {
      [self commonInit];
   }
   return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
   self = [super initWithCoder:aDecoder];
   if( self )
   {
      [self commonInit];
   }
   return self;
}

-(void)dealloc
{
   self.finishedBlock = nil;
   self.actionBlock = nil;
}

-(void)bannerViewDidLoadAd:(ADBannerView *)banner
{
   banner.hidden = NO;
}

-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
   banner.hidden = YES;
}

-(void)bannerViewActionDidFinish:(ADBannerView *)banner
{
   if( self.finishedBlock )
   {
      finishedBlock(banner);
   }
}

-(BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave
{
   if( self.actionBlock )
   {
      return actionBlock(banner, willLeave);
   }
   
   return YES;
}


@end
