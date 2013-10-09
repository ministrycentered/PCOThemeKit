//
//  PCOThemeHelpers.h
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

#ifndef PCOThemeKit_PCOThemeHelpers_h
#define PCOThemeKit_PCOThemeHelpers_h

@import Foundation;
@import UIKit;

static NSString * const kPCOThemeManagerErrorDomain = @"com.ministrycentered.thememanager";

static inline BOOL pco_parseThemeColorRGBString(NSString *colorString, CGFloat *red, CGFloat *green, CGFloat *blue, CGFloat *alpha, NSError **error) {
    colorString = [colorString stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSArray *values = [colorString componentsSeparatedByString:@","];
    
    if ([values count] < 3) {
        if ([values count] == 1) {
            *red = [[values firstObject] floatValue];
            *green = [[values firstObject] floatValue];
            *blue = [[values firstObject] floatValue];
            *alpha = 1.0;
            
            return YES;
        }
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
