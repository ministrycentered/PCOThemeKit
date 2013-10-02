//
//  UIResponder+PCOThemedResponder.h
//  PCOThemeKit
//
//  Created by Skylar Schipper on 10/1/13.
//  Copyright (c) 2013 Ministry Centered Technology. All rights reserved.
//

@import UIKit;

@interface UIResponder (PCOThemedResponder)

- (void)startListeningForThemeChanges;
- (void)stopListeningForThemeChanges;

- (NSDictionary *)themeColorBindings;

- (void)updateThemes;

@end
