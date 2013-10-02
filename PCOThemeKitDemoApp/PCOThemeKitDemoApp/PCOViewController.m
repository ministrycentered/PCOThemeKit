//
//  PCOViewController.m
//  PCOThemeKitDemoApp
//
//  Created by Skylar Schipper on 10/1/13.
//  Copyright (c) 2013 Ministry Centered Technology. All rights reserved.
//

#import "PCOViewController.h"
#import "UIResponder+PCOThemedResponder.h"
#import "TestFallbackView.h"

@interface PCOViewController ()

@end

@implementation PCOViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.testView startListeningForThemeChanges];
    
    [self startListeningForThemeChanges];
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [self stopListeningForThemeChanges];
    [self.testView stopListeningForThemeChanges];
}

- (void)changeThemeAction:(id)sender {
    if ([[[[PCOThemeManager defaultThemeManager] currentTheme] name] isEqualToString:@"LightTheme"]) {
        [[PCOThemeManager defaultThemeManager] setCurrentThemeWithName:@"DefaultTheme"];
    } else {
        [[PCOThemeManager defaultThemeManager] setCurrentThemeWithName:@"LightTheme"];
    }
}

- (void)updateTheme {
    self.themeNameLabel.text = [[[PCOThemeManager defaultThemeManager] currentTheme] displayName];
}

- (NSDictionary *)themeColorBindings {
    return @{
             @"backgroundColor": @[
                     @"view.backgroundColor",
                     @"themeNameLabel.backgroundColor"
                     ],
             @"backgroundTextColor": @"themeNameLabel.textColor"
             };
}
- (NSDictionary *)themeImageBindings {
    return @{
             @"test": @"imageView.image"
             };
}

@end
