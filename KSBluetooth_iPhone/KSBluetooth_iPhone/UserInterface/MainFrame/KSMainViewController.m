//
//  KSMainViewController.m
//  KSBluetooth_iPhone
//
//  Created by tts on 14-11-4.
//  Copyright (c) 2014年 tts. All rights reserved.
//

#import "KSMainViewController.h"
#import "AppDelegate.h"
#import "KSLeftViewController.h"
#import "KSConnectViewController.h"
@interface KSMainViewController ()

@end

@implementation KSMainViewController

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
    
    KSConnectViewController * connectVC = [[KSConnectViewController alloc]init];
    UINavigationController *  nav = [[UINavigationController alloc]initWithRootViewController:connectVC];
    [connectVC release];
    
    [self presentViewController:nav animated:NO completion:^{
        
    }];
    [nav release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadView
{
    [super loadView];
    [self layoutViews];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark - methodes

- (void)layoutViews
{

    self.view.backgroundColor = [UIColor whiteColor];
    if (iOS7) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    UIButton * leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 44)];
    [leftBtn setImage:[UIImage imageNamed:@"public_main_right.png"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(clickLeftBtn:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    [leftBtn release];
    
    self.navigationItem.leftBarButtonItem = leftItem;
    [leftItem release];
    
    UILabel * titleView  = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,200, 44)];
    titleView.backgroundColor = [UIColor clearColor];
    titleView.textAlignment = NSTextAlignmentCenter;
    titleView.font = [UIFont boldSystemFontOfSize:18.0];
    titleView.textColor = [UIColor whiteColor];
    titleView.text = @"Ease you life";
    self.navigationItem.titleView  = titleView;
    [titleView release];
    
    UIButton * rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 44)];
    
    [rightBtn setImage:[UIImage imageNamed:@"main_search.png"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(clickSearch:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * rigthItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    [rightBtn release];
    
    self.navigationItem.rightBarButtonItem = rigthItem;
    [rigthItem release];
    
    UIButton * powerBtn = [self createButtonWithFrame:CGRectMake(10, 20, 50, 50) imageName:@"main_power_off.png" selectImageName:nil title:nil tag:100 color:nil];
    [self.view addSubview:powerBtn];
    powerBtn.showsTouchWhenHighlighted = NO;

    
    UILabel * title1 = [self createLabelWithFrame:CGRectMake(Screen_Width * 0.7, 25, 40, 20) title:@"温度："];
    [self.view addSubview:title1];
    
    _temperatureLabel = [self createLabelWithFrame:CGRectMake(Screen_Width * 0.7 + 40 , 25, 50, 20)  title:@"25 ℃"];
    [self.view addSubview:_temperatureLabel];
    
    UILabel * title2 = [self createLabelWithFrame:CGRectMake(Screen_Width * 0.7, 45, 40, 20) title:@"湿度："];
    [self.view addSubview:title2];
    
    _moistureLabel = [self createLabelWithFrame:CGRectMake(Screen_Width * 0.7 + 40 , 45, 50, 20)  title:@"45%"];
    [self.view addSubview:_moistureLabel];
    
    
    UIImageView * dashboardBg = [[UIImageView alloc]initWithFrame:CGRectMake(Screen_Width * 0.1, 70, Screen_Width * 0.8, Screen_Width * 0.8)];
    dashboardBg.image = [UIImage imageNamed:@"main_dashboard_bg.png"];
    [self.view addSubview:dashboardBg];
    [dashboardBg release];
    
    UIImageView * pointerView = [[UIImageView alloc]initWithFrame:dashboardBg.bounds];
    pointerView.backgroundColor = [UIColor clearColor];
    pointerView.image = [UIImage imageNamed:@"main_pointer.png"];
    [dashboardBg addSubview:pointerView];
    [pointerView release];

    
    UIView * btnBgView;
    if (Screen_Height > 480) {
        
        btnBgView = [[UIView alloc]initWithFrame:CGRectMake(0, (Screen_Height - 64) * 0.7,Screen_Width, 200)];
    }else{
       
       btnBgView = [[UIView alloc]initWithFrame:CGRectMake(0, (Screen_Height - 64) * 0.8,Screen_Width, 200)];
    }

    btnBgView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:btnBgView];
    [btnBgView release];
    
    float btnWidthScale = 0.3;
    float btnHeight = 30;
    
    
    CGRect frame = CGRectMake(Screen_Width * 0.15, 0, Screen_Width * btnWidthScale, btnHeight);
    UIButton * btn1 = [self createButtonWithFrame:frame imageName:@"main_btn_s.png" selectImageName:@"main_btn_n.png" title:@"PM2.5 检查" tag:200 color:[UIColor whiteColor]];
    [btnBgView addSubview: btn1];
    
     frame = CGRectMake(Screen_Width * 0.55, 0, Screen_Width * btnWidthScale, btnHeight);
     UIButton * btn2 = [self createButtonWithFrame:frame imageName:@"main_btn_n.png" selectImageName:@"main_btn_n.png" title:@"净化" tag:300 color:[UIColor blackColor]];
    [btnBgView addSubview: btn2];
    
    frame = CGRectMake(Screen_Width * 0.15, CGRectGetMaxY(btn2.frame) + 10, Screen_Width * btnWidthScale, btnHeight);

    UIButton * btn3 = [self createButtonWithFrame:frame imageName:@"main_btn_n.png" selectImageName:@"main_btn_n.png" title:@"PM2.5 净化" tag:400 color:[UIColor blackColor]];
    [btnBgView addSubview: btn3];
    
    frame = CGRectMake(Screen_Width * 0.55, CGRectGetMaxY(btn2.frame) + 10, Screen_Width * btnWidthScale, btnHeight);
    UIButton * btn4 = [self createButtonWithFrame:frame imageName:@"main_btn_n.png" selectImageName:@"main_btn_n.png" title:@"甲醛" tag:500 color:[UIColor blackColor]];
    [btnBgView addSubview: btn4];


    
}

- (UIButton *)createButtonWithFrame:(CGRect)frame imageName:(NSString *)imageName selectImageName:(NSString *)selectImageName title:(NSString *)title tag:(NSInteger)btnTag color:(UIColor *)color
{
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    [btn setBackgroundImage:[[UIImage imageNamed:imageName] stretchableImageWithLeftCapWidth:20 topCapHeight:20] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14.0];
    [btn setTitleColor:color forState:UIControlStateNormal];
//    [btn setImage:[UIImage imageNamed:selectImageName] forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.tag = btnTag;
    btn.showsTouchWhenHighlighted = YES;
    return btn;
}

- (UILabel *)createLabelWithFrame:(CGRect)frame title:(NSString *)title
{
    UILabel * label = [[[UILabel alloc]init]autorelease];
    label.frame = frame;
    label.backgroundColor = [UIColor clearColor];
    label.text = title;
    label.font = [UIFont systemFontOfSize:13.0];
    return label;
}

#pragma mark - Action Methodes

- (void)clickBtn:(UIButton *)btn
{
    switch (btn.tag) {
        case 100:
        {
            if (_isPowerOn) {
                
                [btn setBackgroundImage:[UIImage imageNamed:@"main_power_off.png"] forState:UIControlStateNormal];
            }else{
                [btn setBackgroundImage:[UIImage imageNamed:@"main_power_on.png"] forState:UIControlStateNormal];
            }
            _isPowerOn = !_isPowerOn;
        }
            break;
        case 200:
        {
            
        }
            break;
        case 300:
        {
            
        }
            break;
        case 400:
        {
            
        }
            break;
        case 500:
        {
            
        }
            break;
        default:
            break;
    }
    
}

- (void)clickLeftBtn:(UIButton *)btn
{
    AppDelegate * app = (AppDelegate *)[[UIApplication sharedApplication]delegate];

    [app.mmDrawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:^(BOOL finished) {
        
    }];
    
}

- (void)clickSearch:(UIButton *)btn
{
    
}
@end
