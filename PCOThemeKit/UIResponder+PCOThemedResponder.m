//
//  UIResponder+PCOThemedResponder.m
//  PCOThemeKit
//
//  Author: Skylar Schipper <skylar@ministrycentered.com>
//
// Copyright (c) 2013 Ministry Centered Technology
//
//
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

#import "UIResponder+PCOThemedResponder.h"
#import "PCOThemeManager.h"

@implementation UIResponder (PCOThemedResponder)

- (void)themeDidChange:(NSNotification *)notification {
    [self _internalUpdateTheme];
}
- (NSDictionary *)themeColorBindings {
    return @{};
}
- (NSDictionary *)themeImageBindings {
    return @{};
}

- (void)_internalUpdateTheme {
    [self pco_updateThemeColors];
    [self pco_updateThemeImages];
    [self updateTheme];
}
- (void)updateTheme {}
- (void)pco_updateThemeColors {
    NSDictionary *bindings = [self themeColorBindings];
    for (NSString *key in [bindings allKeys]) {
        UIColor *color = [[PCOThemeManager defaultThemeManager] colorForKey:key];
        id value = bindings[key];
        if ([value isKindOfClass:[NSArray class]]) {
            for (NSString *keyPath in value) {
                [self setValue:color forKeyPath:keyPath];
            }
        } else {
            [self setValue:color forKeyPath:value];
        }
    }
}
- (void)pco_updateThemeImages {
    NSDictionary *bindings = [self themeImageBindings];
    for (NSString *key in [bindings allKeys]) {
        UIImage *image = [[PCOThemeManager defaultThemeManager] imageForKey:key];
        id value = bindings[key];
        if ([value isKindOfClass:[NSArray class]]) {
            for (NSString *keyPath in value) {
                [self setValue:image forKeyPath:keyPath];
            }
        } else {
            [self setValue:image forKeyPath:value];
        }
    }
}

- (void)startListeningForThemeChanges {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(themeDidChange:)
                                                 name:PCOThemeDidChangeNotification
                                               object:nil];
    [self _internalUpdateTheme];
}
- (void)stopListeningForThemeChanges {
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:PCOThemeDidChangeNotification
                                                  object:nil];
}

@end
