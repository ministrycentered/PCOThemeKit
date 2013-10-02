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
    
    TestFallbackView *view = [[TestFallbackView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    view.backgroundColor = [UIColor orangeColor];
    [view startListeningForThemeChanges];
    [self.view addSubview:view];
    
    [self startListeningForThemeChanges];
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [self stopListeningForThemeChanges];
}

- (NSDictionary *)themeColorBindings {
    return @{
             @"backgroundColor": @"view.backgroundColor"
             };
}

@end
