//
//  PCOThemeKit.h
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

#ifndef _pco_theme_kit_
#define _pco_theme_kit_

#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
#error PCOThemeKit relies heavily on iOS 7 and makes assumptions that the iOS 7 SDK is available
#endif

@import Foundation;
@import UIKit;


#import "PCOThemeHelpers.h"
#import "PCOTheme.h"
#import "PCOThemeManager.h"
#import "UIResponder+PCOThemedResponder.h"
#import "PCOThemeWindow.h"


#endif
