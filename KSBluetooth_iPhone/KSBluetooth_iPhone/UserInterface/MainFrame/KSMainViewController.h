//
//  KSMainViewController.h
//  KSBluetooth_iPhone
//
//  Created by tts on 14-11-4.
//  Copyright (c) 2014年 tts. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KSMainViewController : UIViewController

@property(retain,nonatomic)UILabel * temperatureLabel;
@property(retain,nonatomic)UILabel * moistureLabel;
@property(assign,nonatomic)BOOL isPowerOn;
@end
