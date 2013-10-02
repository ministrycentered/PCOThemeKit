//
//  PCOThemeManager.h
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

@import Foundation;
@import UIKit;

#import "PCOTheme.h"

UIKIT_EXTERN NSString * const PCOThemeDidChangeNotification;

/*!
 *  <#Description#>
 */
@interface PCOThemeManager : NSObject

- (NSArray *)registeredThemes;

/*!
 *  Register a theme with the manager.  Loads the theme from the main bundle.
 *
 *  \param themeName The file name for the theme.
 */
- (void)registerThemeWithName:(NSString *)themeName;

- (PCOTheme *)themeWithName:(NSString *)themeName;

- (void)setCurrentThemeWithName:(NSString *)themeName;
@property (nonatomic, strong) PCOTheme *currentTheme;

/*!
 *  This theme is used when a theme doesn't implement a key for a color or image.
 *
 *  Set from the first theme registered with the theme manager
 */
@property (nonatomic, strong, readonly) PCOTheme *fallbackTheme;

/*!
 *  Shared instance class method for accessing the shared instance of PCOThemeManager
 *
 *  \return Returns the shared instance of PCOThemeManager
 */
+ (instancetype)defaultThemeManager;

#pragma mark -
#pragma mark - Settings
- (UIColor *)colorForKey:(NSString *)key;
- (UIImage *)imageForKey:(NSString *)key;

@end
