//
//  PCOThemeWindow.m
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

#import "PCOThemeWindow.h"
#import "PCOThemeManager.h"
#import "_PCOThemeKitPrivate.h"

@interface PCOThemeWindow ()

@property (nonatomic, weak) UIView *themeWindowSnapshotView;

@end

@implementation PCOThemeWindow

- (void)_setupThemeWindow {
    _shouldAnimateThemeChange = YES;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeWillChangeNotification:) name:PCOThemeWillChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeDidChangeNotification:) name:_PCOThemeDidProcessChangesNotification object:nil];
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:PCOThemeWillChangeNotification];
    [[NSNotificationCenter defaultCenter] removeObserver:_PCOThemeDidProcessChangesNotification];
}

#pragma mark -
#pragma mark - Theme Change Notifications
- (void)themeWillChangeNotification:(NSNotification *)notif {
    if (!self.shouldAnimateThemeChange) return;
    
    UIView *snapshot = [self snapshotViewAfterScreenUpdates:NO];
    [self addSubview:snapshot];
    _themeWindowSnapshotView = snapshot;
}
- (void)themeDidChangeNotification:(NSNotification *)notif {
    if (_themeWindowSnapshotView) {
        [UIView animateWithDuration:[self themeChangeFadeDuration] animations:^{
            _themeWindowSnapshotView.alpha = 0.0;
        } completion:^(BOOL finished) {
            [_themeWindowSnapshotView removeFromSuperview];
            _themeWindowSnapshotView = nil;
        }];
    }
}

- (NSTimeInterval)themeChangeFadeDuration {
    return 0.2;
}

#pragma mark -
#pragma mark - Initialize
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self _setupThemeWindow];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self _setupThemeWindow];
    }
    return self;
}
- (instancetype)init {
    self = [super init];
    if (self) {
        [self _setupThemeWindow];
    }
    return self;
}

@end
