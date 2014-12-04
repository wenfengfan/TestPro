//
//  KSConnectViewController.m
//  KSBluetooth_iPhone
//
//  Created by wenfengfan on 14-11-5.
//  Copyright (c) 2014年 tts. All rights reserved.
//

#import "KSConnectViewController.h"

@interface KSConnectViewController ()

@end

@implementation KSConnectViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadView
{
    [super loadView];
    [self  layoutViews];
}


- (void)layoutViews
{
    self.view.backgroundColor = [UIColor whiteColor];

    if (iOS7) {
        
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
       
    UILabel * titleView  = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,200, 44)];
    titleView.backgroundColor = [UIColor clearColor];
    titleView.textAlignment = NSTextAlignmentCenter;
    titleView.font = [UIFont boldSystemFontOfSize:18.0];
    titleView.textColor = [UIColor whiteColor];
    titleView.text = @"Ease you life";
    self.navigationItem.titleView  = titleView;
    [titleView release];
    
    UIImageView * phoneImageView = [[UIImageView alloc]initWithFrame:CGRectMake(Screen_Width * 0.3, 15, Screen_Width * 0.4, Screen_Width *  0.4)];
    phoneImageView.image = [UIImage imageNamed:@"mobile_phone_client_icon.png"];
    [self.view addSubview:phoneImageView];
    [phoneImageView release];
    
    
    float widthScale = 0.05;
    float offsetScaleY = 0.01;
    float offsetY = 0.027;
    
    if (Screen_Height > 480) {
        
        offsetScaleY = 0.04;
        offsetY = 0.05;
    }
    
    for (int i = 0; i< 5; i ++) {
        
        CGRect frame = CGRectMake((1.0 - widthScale)/2.0 * Screen_Width,CGRectGetMaxY(phoneImageView.frame) + Screen_Height * offsetScaleY ,  widthScale * Screen_Width, widthScale * Screen_Width);
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:frame];
        imageView.image =[UIImage imageNamed:@"pairing_01_n.png"];
        [self.view addSubview:imageView];
        [imageView release];
        widthScale += 0.01;
        offsetScaleY += offsetY;
        
    }
    
    
    UIImageView * KSImageView = [[UIImageView alloc]initWithFrame:CGRectMake(Screen_Width * 0.35,Screen_Height - 64 - 80 - 15 -Screen_Width * 0.3, Screen_Width * 0.3, Screen_Width * 0.3)];
    KSImageView.image = [UIImage imageNamed:@"connect_device.png"];
    [self.view addSubview:KSImageView];
    [KSImageView release];

    UIImageView * buttomImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, Screen_Height - 80 - 64 , Screen_Width, 80)];
    buttomImageView.userInteractionEnabled = YES;
    buttomImageView.image = [UIImage imageNamed:@"pairing_bottom_bg.png"];
    [self.view addSubview:buttomImageView];
    [buttomImageView release];
    
    UIButton * connectBtn = [[UIButton alloc]initWithFrame:CGRectMake(Screen_Width * 0.1 , 20, Screen_Width* 0.38, 40)];
    [connectBtn addTarget:self action:@selector(connectDevice:) forControlEvents:UIControlEventTouchUpInside];
    [connectBtn setTitle:@"重新连接" forState:UIControlStateNormal];
    [connectBtn setBackgroundImage:[UIImage imageNamed:@"btn_pairing_normal.png"] forState:UIControlStateNormal];
    connectBtn.showsTouchWhenHighlighted = YES;
    [buttomImageView addSubview:connectBtn];
    [connectBtn release];
    
    UIButton * settingBtn = [[UIButton alloc]initWithFrame:CGRectMake(Screen_Width * 0.54, 20, Screen_Width * 0.38 , 40)];
    [settingBtn setTitle:@"设置蓝牙" forState:UIControlStateNormal];
    [settingBtn addTarget:self action:@selector(setDevice:) forControlEvents:UIControlEventTouchUpInside];
    [settingBtn setBackgroundImage:[UIImage imageNamed:@"btn_pairing_normal.png"] forState:UIControlStateNormal];
    settingBtn.showsTouchWhenHighlighted = YES;
    [buttomImageView addSubview:settingBtn];
    [settingBtn release];
}

- (void)connectDevice:(UIButton *)btn
{
    [[NSNotificationCenter defaultCenter]postNotificationName:Note_Dismiss_ConnectView object:nil];
}

- (void)setDevice:(UIButton *)btn
{
    [[NSNotificationCenter defaultCenter]postNotificationName:Note_Dismiss_ConnectView object:nil];

}
@end
