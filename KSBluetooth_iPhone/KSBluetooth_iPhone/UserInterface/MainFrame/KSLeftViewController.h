//
//  KSLeftViewController.h
//  KSBluetooth_iPhone
//
//  Created by tts on 14-11-4.
//  Copyright (c) 2014年 tts. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KSLeftViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(retain,nonatomic)UITableView * menuView;
@property(retain,nonatomic)NSArray * titles;
@property(retain,nonatomic)NSArray * iconsNormal;
@property(retain,nonatomic)NSArray * iconsSelected;
@property(retain,nonatomic)NSIndexPath * lastSelectIndex;
@end
