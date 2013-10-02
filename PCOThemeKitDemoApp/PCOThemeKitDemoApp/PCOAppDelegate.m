//
//  PCOAppDelegate.m
//  PCOThemeKitDemoApp
//
//  Created by Skylar Schipper on 10/1/13.
//  Copyright (c) 2013 Ministry Centered Technology. All rights reserved.
//

#import "PCOAppDelegate.h"

@implementation PCOAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [[PCOThemeManager defaultThemeManager] registerThemeWithName:@"DefaultTheme"];
    [[PCOThemeManager defaultThemeManager] registerThemeWithName:@"LightTheme"];
    
    double delayInSeconds = 5.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [[PCOThemeManager defaultThemeManager] setCurrentThemeWithName:@"LightTheme"];
    });
    
    
    return YES;
}

@end
