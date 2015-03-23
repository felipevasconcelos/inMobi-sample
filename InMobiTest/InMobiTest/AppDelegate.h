//
//  AppDelegate.h
//  InMobiTest
//
//  Created by bcfg on 3/23/15.
//  Copyright (c) 2015 bcfg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "InMobi.h"
#import "IMConstants.h"
#import "IMInterstitial.h"
#import "IMInterstitialDelegate.h"
#import "IMError.h"
#import <RevMobAds/RevMobAds.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, RevMobAdsDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic) RevMobBanner *ban;


@end
