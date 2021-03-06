//
//  DSAppDelegate.h
//  XBRL
//
//  Created by David Kay on 1/19/12.
//  Copyright (c) 2012 Gargoyle Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DSViewController;

@interface DSAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) DSViewController *viewController;
@property (strong, nonatomic) UINavigationController *navController;

@end
