//
//  KSLeftViewController.m
//  KSBluetooth_iPhone
//
//  Created by tts on 14-11-4.
//  Copyright (c) 2014年 tts. All rights reserved.
//

#import "KSLeftViewController.h"
#import "KSConnectViewController.h"
#import "AppDelegate.h"
#import "KSMainViewController.h"
#import "KSAboutController.h"

@interface KSLeftViewController ()

@end

@implementation KSLeftViewController

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
    _titles = [[NSArray alloc]initWithObjects:@"建议反馈",@"版本检查",@"关于我们",@"滤网更新", nil];
    _iconsNormal = [[NSArray alloc]initWithObjects:@"more_icon_feedback.png",@"more_icon_upgrade.png",@"more_icon_about.png",@"more_icon_replace.png", nil];
    _iconsSelected = [[NSArray alloc]initWithObjects:@"more_icon_feedback_s.png",@"more_icon_upgrade_s.png",@"more_icon_about_s.png",@"more_icon_replace_s.png", nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(dismissConnectView:) name:Note_Dismiss_ConnectView object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(dismissAboutView:) name: Note_Dismiss_AbountView object:nil];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (void)loadView
{
    [super loadView];
    [self layoutViews];
}

#pragma mark - methodes

- (void)layoutViews
{
    self.view.backgroundColor = [UIColor redColor];
    
    
    _menuView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Screen_Width *0.8,Screen_Height )];
    _menuView.delegate = self;
    _menuView.dataSource = self;
    _menuView.contentInset = UIEdgeInsetsMake(60, 0, 0, 0);
    _menuView.separatorColor = [UIColor grayColor];
    _menuView.backgroundColor = [UIColor colorWithRed:0x1A/255.0 green:0x1A/255.0 blue:0x1A/255.0 alpha:1.0];
    [self.view addSubview:_menuView];
    [_menuView release];
    
    [self setExtraCellLineHidden:_menuView];
    
    UIImageView * logoImageView = [[UIImageView alloc]initWithFrame:CGRectMake((Screen_Width * 0.8 - 190)/2.0, Screen_Height - 220, 190, 115)];
    logoImageView.image = [UIImage imageNamed:@"main_left_bottom_icon.png"];
    [_menuView addSubview:logoImageView];
    [logoImageView release];
}


- (void)setExtraCellLineHidden: (UITableView *)tableView

{
    UIView *view =[ [UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
    [view release];
}

#pragma mark -  Notifaction Methodes

- (void)dismissConnectView:(NSNotification *)note
{
    
    [self dismissViewControllerAnimated:YES completion: nil];
}

- (void)dismissAboutView:(NSNotification *)note
{
    
    [self dismissViewControllerAnimated:YES completion: nil];

}

#pragma mark - UITableViewDelegate methodes 

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifer = @"cellIdentifer";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    if (cell == nil) {
        
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer]autorelease];
        cell.backgroundColor = [UIColor colorWithRed:0x1A/255.0 green:0x1A/255.0 blue:0x1A/255.0 alpha:1.0];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        UIImageView * cellSelectedBg = [[UIImageView alloc]initWithFrame:cell.bounds];
        cellSelectedBg.image = [[UIImage imageNamed:@"list_item_sel.png"] stretchableImageWithLeftCapWidth:20 topCapHeight:20];
        [cell setSelectedBackgroundView:cellSelectedBg];
        [cellSelectedBg release];
        
        cell.separatorInset = UIEdgeInsetsZero;

    }
    
    NSString * title = [_titles objectAtIndex:indexPath.row];
    cell.textLabel.text = title;
    cell.imageView.image = [UIImage imageNamed:[_iconsNormal objectAtIndex:indexPath.row]];
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_titles count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 45;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:[_iconsSelected objectAtIndex:indexPath.row]];
    
    if (!_lastSelectIndex) {
        
        self.lastSelectIndex = indexPath;
        
    }else{
        
        UITableViewCell * cell = [tableView cellForRowAtIndexPath:_lastSelectIndex];
        cell.imageView.image = [UIImage imageNamed:[_iconsNormal objectAtIndex:_lastSelectIndex.row]];
        self.lastSelectIndex = indexPath;
    }

    switch (indexPath.row) {
        case 0:
        {
            AppDelegate * app = (AppDelegate *)[[UIApplication sharedApplication]delegate];
            KSMainViewController * mainVC = [[KSMainViewController alloc]init];
            UINavigationController * rootNav = [[UINavigationController alloc]initWithRootViewController:mainVC];
            [mainVC release];
            
            [app.mmDrawerController setCenterViewController:rootNav withCloseAnimation:YES completion:nil];
            [rootNav release];

        }
            break;
        case 1:
        case 3:
        {
            KSConnectViewController * connectVC = [[KSConnectViewController alloc]init];
            UINavigationController *  nav = [[UINavigationController alloc]initWithRootViewController:connectVC];
            [connectVC release];
            
            [self presentViewController:nav animated:YES completion:^{
                
            }];
            [nav release];

        }
            break;
        case 2:
        {
            
            KSAboutController  * aboutVC = [[KSAboutController alloc]init];
            UINavigationController * aboutNav = [[UINavigationController alloc]initWithRootViewController:aboutVC];
            [self presentViewController:aboutNav animated:YES completion:nil];
            [aboutNav release];
            
        }
            break;
        default:
            break;
    }
}

#pragma mark -

- (void)dealloc
{
    [_lastSelectIndex release];
    [_iconsSelected release];
    [_iconsNormal release];
    [_titles release];
    [super dealloc];
}

@end
