//
//  ViewController.m
//  InMobiTest
//
//  Created by bcfg on 3/20/15.
//  Copyright (c) 2015 bcfg. All rights reserved.
//

#import "ViewController.h"
#import "GlobalObject.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"viewDidLoad");
    
    [GlobalObject sharedGlobalObject].inMobiInterstitial = [[IMInterstitial alloc] initWithAppId:@"2b0d3e2633c74b97beaaac524d957047"];
    [GlobalObject sharedGlobalObject].inMobiInterstitial.delegate = self;
    [[GlobalObject sharedGlobalObject].inMobiInterstitial loadInterstitial];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)interstitialDidReceiveAd:(IMInterstitial *)ad {
    NSLog(@"INMOBI Loaded interstitial ad");
    if ([GlobalObject sharedGlobalObject].isShowingRevMobBanner){
        NSLog(@"presenting InMobi Interstitial Animated");
        [[GlobalObject sharedGlobalObject].inMobiInterstitial presentInterstitialAnimated:YES];
    }
}

- (void)interstitialDidDismissScreen:(IMInterstitial *)ad {
    NSLog(@"Interstitial ad dismissed screen");
    [GlobalObject sharedGlobalObject].inMobiInterstitial = [[IMInterstitial alloc] initWithAppId:@"2b0d3e2633c74b97beaaac524d957047"];
    [GlobalObject sharedGlobalObject].inMobiInterstitial.delegate = self;
    [[GlobalObject sharedGlobalObject].inMobiInterstitial loadInterstitial];
}

@end
