//
//  PCOThemeManager.m
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

#import "PCOThemeManager.h"
#import "_PCOThemeKitPrivate.h"

@interface PCOThemeManager ()

@property (nonatomic, strong) NSMutableDictionary *themes;

@end

@implementation PCOThemeManager

#pragma mark -
#pragma mark - Singleton

+ (PCOThemeManager *)defaultThemeManager {
    static PCOThemeManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[PCOThemeManager alloc] init];
    });
    return manager;
}

#pragma mark -
#pragma mark - Theme management
- (void)registerThemeWithName:(NSString *)themeName {
    PCOTheme *theme = [[PCOTheme alloc] initWithFileName:themeName];
    if (self.themes.count == 0) {
        self.currentTheme = theme;
        _fallbackTheme = theme;
    }
    self.themes[theme.name] = theme;
}
- (NSArray *)registeredThemes {
    return [self.themes allValues];
}
- (PCOTheme *)themeWithName:(NSString *)themeName {
    return self.themes[themeName];
}
- (void)setCurrentTheme:(PCOTheme *)currentTheme {
    [[NSNotificationCenter defaultCenter] postNotificationName:PCOThemeWillChangeNotification object:self];
    [self willChangeValueForKey:@"currentTheme"];
    _currentTheme = currentTheme;
    [self didChangeValueForKey:@"currentTheme"];
    [[NSNotificationCenter defaultCenter] postNotificationName:PCOThemeDidChangeNotification object:self];
    [[NSNotificationCenter defaultCenter] postNotificationName:_PCOThemeDidProcessChangesNotification object:self];
}
- (void)setCurrentThemeWithName:(NSString *)themeName {
    PCOTheme *theme = [self themeWithName:themeName];
    self.currentTheme = theme;
}

#pragma mark -
#pragma mark - Lazy loaders
- (NSMutableDictionary *)themes {
    if (!_themes) {
        _themes = [NSMutableDictionary dictionary];
    }
    return _themes;
}


#pragma mark -
#pragma mark - Settings
- (UIColor *)colorForKey:(NSString *)key {
    UIColor *c = [self.currentTheme colorForKey:key];
    if (!c) {
        c = [self.fallbackTheme colorForKey:key];
    }
    return c;
}
- (UIImage *)imageForKey:(NSString *)key {
    UIImage *i = [self.currentTheme imageForKey:key];
    if (!i) {
        i = [self.fallbackTheme imageForKey:key];
    }
    return i;
}
- (NSString *)settingForKey:(NSString *)key {
    NSString *s = [self.currentTheme settingForKey:key];
    if (!s) {
        s = [self.fallbackTheme settingForKey:key];
    }
    return s;
}

@end

NSString * const PCOThemeDidChangeNotification = @"PCOThemeDidChangeNotification";
NSString * const PCOThemeWillChangeNotification = @"PCOThemeWillChangeNotification";
