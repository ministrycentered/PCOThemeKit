//
//  PCOTheme.m
//  PCOThemeKit
//
//  Created by Skylar Schipper on 10/1/13.
//  Copyright (c) 2013 Ministry Centered Technology. All rights reserved.
//

#import "PCOTheme.h"
#import "PCOThemeHelpers.h"

@interface PCOTheme ()

@property (nonatomic, strong) NSDictionary *loadedData;
@property (nonatomic, strong) NSMutableDictionary *colors;
@property (nonatomic, strong) NSMutableDictionary *images;

@end

@implementation PCOTheme
@synthesize name = _name;
@synthesize displayName = _displayName;

- (instancetype)initWithFilePath:(NSString *)filePath {
    self = [super init];
    if (self) {
        _filePath = filePath;
    }
    return self;
}
- (instancetype)initWithFileName:(NSString *)fileName {
    NSBundle *mainBundle = [NSBundle mainBundle];
    return [self initWithFilePath:[mainBundle pathForResource:fileName ofType:@"plist"]];
}

- (void)load {
    NSAssert(_filePath, @"No filePath set");
    _loadedData = [NSDictionary dictionaryWithContentsOfFile:_filePath];
}


- (UIColor *)colorForKey:(NSString *)key {
    UIColor *color = self.colors[key];
    if (!color) {
        NSString *colorString = self.loadedData[kPCOThemeColorsKey][key];
        color = pco_colorFromString(colorString);
        self.colors[key] = color;
    }
    return color;
}
- (UIImage *)imageForKey:(NSString *)key {
    return nil;
}

#pragma mark -
#pragma mark - Lazy Loaders
- (NSDictionary *)loadedData {
    if (!_loadedData) {
        [self load];
    }
    return _loadedData;
}
- (NSString *)name {
    if (!_name) {
        _name = self.loadedData[kPCOThemeNameKey];
    }
    return _name;
}
- (NSString *)displayName {
    if (!_displayName) {
        _displayName = self.loadedData[kPCOThemeDisplayNameKey];
    }
    return _displayName;
}
- (NSMutableDictionary *)colors {
    if (_colors) {
        _colors = [NSMutableDictionary dictionary];
    }
    return _colors;
}
- (NSMutableDictionary *)images {
    if (!_images) {
        _images = [NSMutableDictionary dictionary];
    }
    return _images;
}

@end


NSString * const kPCOThemeNameKey = @"name";
NSString * const kPCOThemeDisplayNameKey = @"displayName";
NSString * const kPCOThemeColorsKey = @"colors";
NSString * const kPCOThemeImagesKey = @"images";
