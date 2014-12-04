//
//  AppDelegate.h
//  KSBluetooth_iPhone
//
//  Created by tts on 14-11-4.
//  Copyright (c) 2014年 tts. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "MMDrawerController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (retain, nonatomic) MMDrawerController * mmDrawerController;
@property (retain, nonatomic) UINavigationController * rootNav;
@end
