//
//  KSAboutController.m
//  KSBluetooth_iPhone
//
//  Created by tts on 14-11-5.
//  Copyright (c) 2014年 tts. All rights reserved.
//

#import "KSAboutController.h"

@interface KSAboutController ()

@end

@implementation KSAboutController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
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
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark -  methodes

- (void)layoutViews
{
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton * backBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 30)];
    backBtn.backgroundColor = [UIColor clearColor];
    [backBtn setImageEdgeInsets:UIEdgeInsetsMake(0, -20, 0, 0)];
    [backBtn setImage:[UIImage imageNamed:@"public_backBtn_Bg.png"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(clickHide:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * leftItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
    [backBtn release];
    
    self.navigationItem.leftBarButtonItem = leftItem;
    [leftItem release];
    
    
    UILabel * titleView  = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,200, 44)];
    titleView.backgroundColor = [UIColor clearColor];
    titleView.textAlignment = NSTextAlignmentCenter;
    titleView.font = [UIFont boldSystemFontOfSize:18.0];
    titleView.textColor = [UIColor whiteColor];
    titleView.text = @"关于我们";
    self.navigationItem.titleView  = titleView;
    [titleView release];
    
    
    UIButton * rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 30)];

    [rightBtn setImage:[UIImage imageNamed:@"About_edit.png"] forState:UIControlStateNormal];
    [rightBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, -10)];
    [rightBtn addTarget:self action:@selector(clickEdit:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * rigthItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    [rightBtn release];
    
    self.navigationItem.rightBarButtonItem = rigthItem;
    [rigthItem release];
    
    UIImageView * imagView = [[UIImageView alloc]initWithFrame:CGRectMake((Screen_Width - 170)/2.0, Screen_Height * 0.3, 170, 125)];
    imagView.image = [UIImage imageNamed:@"About_logo.png"];
    [self.view addSubview:imagView];
    [imagView release];
    
}

- (void)clickHide:(UIButton *)btn
{
    
    [[NSNotificationCenter defaultCenter]postNotificationName:Note_Dismiss_AbountView object:nil];
}

- (void)clickEdit:(UIButton *)btn
{
    
}

@end
