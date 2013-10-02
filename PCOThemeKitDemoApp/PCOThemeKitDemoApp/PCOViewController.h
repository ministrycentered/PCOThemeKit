//
//  PCOViewController.h
//  PCOThemeKitDemoApp
//
//  Created by Skylar Schipper on 10/1/13.
//  Copyright (c) 2013 Ministry Centered Technology. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PCOViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIView *testView;
@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *themeNameLabel;

- (IBAction)changeThemeAction:(id)sender;

@end
