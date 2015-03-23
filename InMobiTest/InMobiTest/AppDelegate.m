//
//  AppDelegate.m
//  InMobiTest
//
//  Created by bcfg on 3/20/15.
//  Copyright (c) 2015 bcfg. All rights reserved.
//

#import "AppDelegate.h"
#import <RevMobAds/RevMobAds.h>
#import "ViewController.h"
#import "GlobalObject.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

@synthesize ban;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    [RevMobAds startSessionWithAppID:@"4f341a449cefc50003001817"
                  withSuccessHandler:^{
                      
                      NSLog(@"revmob session started");
                      
                      self.ban = [[RevMobAds session] banner];
                      [self.ban loadWithSuccessHandler:^(RevMobBanner *banner) {
                          [self.ban showAd];
                      } andLoadFailHandler:^(RevMobBanner *banner, NSError *erro) {
                          
                      } onClickHandler:^(RevMobBanner *banner) {
                          
                      }];
                      self.ban.delegate = self;
                      
                      
                  } andFailHandler:^(NSError *error) {
                      
                      NSLog(@"revmob session didn't started");
                      
                  }];
    
    [InMobi initialize:@"2b0d3e2633c74b97beaaac524d957047"];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)revmobAdDidFailWithError:(NSError *)error {
    NSLog(@"Ad failed with error: %@", error);
}

- (void)revmobAdDidReceive {
    NSLog(@"Ad loaded successfullly");
}

- (void)revmobAdDisplayed {
    
    NSLog(@"Ad displayed");
    
    [GlobalObject sharedGlobalObject].isShowingRevMobBanner = YES;
    if ([GlobalObject sharedGlobalObject].inMobiInterstitial.state == kIMInterstitialStateReady){
        NSLog(@"presenting InMobi Interstitial Animated");
        [[GlobalObject sharedGlobalObject].inMobiInterstitial presentInterstitialAnimated:YES];
    }
}

- (void)revmobUserClickedInTheAd {
    NSLog(@"User clicked in the ad");
}

- (void)revmobUserClosedTheAd {
    NSLog(@"User closed the ad");
}

@end
