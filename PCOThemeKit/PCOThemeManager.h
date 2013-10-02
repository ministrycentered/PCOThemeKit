/*!
 *  PCOThemeManager.h
 *
 * Copyright (c) 2013 Ministry Centered Technology
 *
 * Created by Skylar Schipper on 10/1/13
 */

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
