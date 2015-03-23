//
//  GlobalObject.h
//  InMobiTest
//
//  Created by bcfg on 3/20/15.
//  Copyright (c) 2015 bcfg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InMobi.h"
#import "IMInterstitial.h"

@interface GlobalObject : NSObject

@property (nonatomic) BOOL isShowingRevMobBanner;
@property (nonatomic) BOOL inMobiInterstitialIsReady;
@property (nonatomic, strong) IMInterstitial *inMobiInterstitial;

+ (GlobalObject *) sharedGlobalObject;

@end
