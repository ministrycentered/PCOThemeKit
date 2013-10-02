/*!
 *  PCOThemeManager.m
 *
 * Copyright (c) 2013 Ministry Centered Technology
 *
 * Created by Skylar Schipper on 10/1/13
 */


#import "PCOThemeManager.h"

id static _sharedPCOThemeManager = nil;

@interface PCOThemeManager ()

@property (nonatomic, strong) NSMutableDictionary *themes;

@end

@implementation PCOThemeManager


#pragma mark -
#pragma mark - Initialization
- (id)init {
	self = [super init];
	if (self) {
		
	}
	return self;
}

#pragma mark -
#pragma mark - Singleton

+ (instancetype)defaultThemeManager {
	@synchronized (self) {
        if (!_sharedPCOThemeManager) {
            _sharedPCOThemeManager = [[[self class] alloc] init];
        }
        return _sharedPCOThemeManager;
    }
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
    [self willChangeValueForKey:@"currentTheme"];
    _currentTheme = currentTheme;
    [self didChangeValueForKey:@"currentTheme"];
    [[NSNotificationCenter defaultCenter] postNotificationName:PCOThemeDidChangeNotification object:self];
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

@end

NSString * const PCOThemeDidChangeNotification = @"PCOThemeDidChangeNotification";
