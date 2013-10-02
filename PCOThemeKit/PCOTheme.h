//
//  PCOTheme.h
//  PCOThemeKit
//
//  Created by Skylar Schipper on 10/1/13.
//  Copyright (c) 2013 Ministry Centered Technology. All rights reserved.
//

#ifndef _pco_theme_h_
#define _pco_theme_h_

@import Foundation;
@import UIKit;

/*!
 *  A theme object
 */
@interface PCOTheme : NSObject

/*!
 *  Returns a UIColor object for the passed key
 *
 *  Colors are lazy loaded from the plist file.
 *
 *  \param key The key for the plist object.
 *
 *  \return A UIColor or nil if the key does not exist in the theme
 */
- (UIColor *)colorForKey:(NSString *)key;

/*!
 *  Returns the UIImage for the key
 *
 *  \param key The key for the plist object
 *
 *  \return A UIImage or nil if the key does not exist in the theme
 */
- (UIImage *)imageForKey:(NSString *)key;

#pragma mark -
#pragma mark - Setup

/*!
 *  The file path of the theme plist
 */
@property (nonatomic, strong, readonly) NSString *filePath;

/*!
 *  The name of the theme.  This is used in the keys for the theme manager
 */
@property (nonatomic, strong, readonly) NSString *name;

/*!
 *  The name of the theme that can be displayed to the user.
 */
@property (nonatomic, strong, readonly) NSString *displayName;

/*!
 *  Initialize a theme with a file path
 *
 *  \param filePath The file path to the theme plist
 *
 *  \return An initialized PCOThemeObject
 */
- (instancetype)initWithFilePath:(NSString *)filePath;

/*!
 *  Initialize a theme with a file name.
 *
 *  \param fileName The name of the theme plist in the main bundle
 *
 *  \return An initialized PCOThemeObject
 *
 *  \warning File name should not include the .plist extention
 */
- (instancetype)initWithFileName:(NSString *)fileName;

/*!
 *  Called automatically when the data needs to be loaded
 *
 *  \warning Must call super in subclasses
 */
- (void)load;

@end

#endif

UIKIT_EXTERN NSString * const kPCOThemeNameKey;
UIKIT_EXTERN NSString * const kPCOThemeDisplayNameKey;
UIKIT_EXTERN NSString * const kPCOThemeColorsKey;
UIKIT_EXTERN NSString * const kPCOThemeImagesKey;
