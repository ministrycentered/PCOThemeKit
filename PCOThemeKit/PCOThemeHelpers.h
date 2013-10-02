//
//  PCOThemeHelpers.h
//  PCOThemeKit
//
//  Created by Skylar Schipper on 10/1/13.
//  Copyright (c) 2013 Ministry Centered Technology. All rights reserved.
//

#ifndef PCOThemeKit_PCOThemeHelpers_h
#define PCOThemeKit_PCOThemeHelpers_h

@import Foundation;
@import UIKit;

static NSString * const kPCOThemeManagerErrorDomain = @"com.ministrycentered.thememanager";

static inline BOOL pco_parseThemeColorRGBString(NSString *colorString, CGFloat *red, CGFloat *green, CGFloat *blue, CGFloat *alpha, NSError **error) {
    colorString = [colorString stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSArray *values = [colorString componentsSeparatedByString:@","];
    
    if ([values count] < 3) {
        if (error != NULL) {
            *error = [NSError errorWithDomain:kPCOThemeManagerErrorDomain code:1 userInfo:@{}];
        }
        return NO;
    }
    
    *red = [values[0] floatValue];
    *green = [values[1] floatValue];
    *blue = [values[2] floatValue];
    if (alpha != NULL) {
        if ([values count] > 3) {
            *alpha = [values[3] floatValue];
        } else {
            *alpha = 1.0;
        }
    }
    
    if (error != NULL) error = nil;
    
    return YES;
}
static inline UIColor *pco_colorFromRGBA(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha) {
    return [[UIColor alloc] initWithRed:(red / 255.0) green:(green / 255.0) blue:(blue / 255.0) alpha:alpha];
}
static inline UIColor *pco_colorFromString(NSString *colorString) {
    CGFloat r,g,b,a;
    NSError *error = nil;
    if (!pco_parseThemeColorRGBString(colorString, &r, &g, &b, &a, &error)) {
        NSLog(@"Color parse error: %@",error);
        return nil;
    }
    return pco_colorFromRGBA(r,g,b,a);
}

#endif
