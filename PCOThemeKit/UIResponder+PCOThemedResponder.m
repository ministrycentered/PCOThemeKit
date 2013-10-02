//
//  UIResponder+PCOThemedResponder.m
//  PCOThemeKit
//
//  Created by Skylar Schipper on 10/1/13.
//  Copyright (c) 2013 Ministry Centered Technology. All rights reserved.
//

#import "UIResponder+PCOThemedResponder.h"
#import "PCOThemeManager.h"

@implementation UIResponder (PCOThemedResponder)

- (void)themeDidChange:(NSNotification *)notification {
    [self updateThemes];
}
- (NSDictionary *)themeColorBindings {
    return @{
             @"backgroundColor": @"backgroundColor"
             };
}

- (void)updateThemes {
    PCOTheme *theme = [[PCOThemeManager defaultThemeManager] currentTheme];
    NSDictionary *bindings = [self themeColorBindings];
    for (NSString *key in [bindings allKeys]) {
        [self setValue:[theme colorForKey:key] forKeyPath:bindings[key]];
    }
}

- (void)startListeningForThemeChanges {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(themeDidChange:)
                                                 name:PCOThemeDidChangeNotification
                                               object:nil];
    [self updateThemes];
}
- (void)stopListeningForThemeChanges {
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:PCOThemeDidChangeNotification
                                                  object:nil];
}

@end
