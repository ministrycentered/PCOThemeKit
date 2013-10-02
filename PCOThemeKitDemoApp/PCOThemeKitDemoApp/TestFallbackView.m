//
//  TestFallbackView.m
//  PCOThemeKitDemoApp
//
//  Created by Skylar Schipper on 10/2/13.
//  Copyright (c) 2013 Ministy Centered Technology. All rights reserved.
//

#import "TestFallbackView.h"

@implementation TestFallbackView

- (NSDictionary *)themeColorBindings {
    return @{
             @"testFallback": @"backgroundColor"
             };
}

@end
