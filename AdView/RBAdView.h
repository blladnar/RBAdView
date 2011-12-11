//
//  RBAdView.h
//  AdView
//
//  Created by Randall Brown on 11/15/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <iAd/iAd.h>

typedef BOOL (^RBActionBlock)(ADBannerView* banner, BOOL willLeave);
typedef void (^RBFinishedBlock)(ADBannerView* banner);
@interface RBAdView : UIButton<ADBannerViewDelegate>

@property (copy) RBActionBlock actionBlock;
@property (copy) RBFinishedBlock finishedBlock;

@end
