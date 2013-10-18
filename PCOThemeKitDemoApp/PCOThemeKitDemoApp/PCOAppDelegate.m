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
    
    self.window = [[PCOThemeWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateInitialViewController];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
