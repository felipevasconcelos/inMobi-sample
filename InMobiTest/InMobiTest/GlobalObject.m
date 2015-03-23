//
//  GlobalObject.m
//  InMobiTest
//
//  Created by bcfg on 3/20/15.
//  Copyright (c) 2015 bcfg. All rights reserved.
//

#import "GlobalObject.h"

@implementation GlobalObject

@synthesize isShowingRevMobBanner;
@synthesize inMobiInterstitialIsReady;
@synthesize inMobiInterstitial;

+ (GlobalObject *) sharedGlobalObject{
    
    static GlobalObject *sharedInstance = nil;
    static dispatch_once_t onceToken = 0;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

@end
