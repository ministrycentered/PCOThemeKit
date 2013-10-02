//
//  PCOTheme.m
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
        if (colorString.length == 0) {
            return nil;
        }
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
