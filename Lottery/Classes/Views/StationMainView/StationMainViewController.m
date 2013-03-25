//
//  StationMainViewController.m
//  Lottery
//
//  Created by lynn  lynn on 13-3-10.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//
#import "AddNewsViewController.h"
#import "NewsWallViewController.h"
#import "NewLotteryViewController.h"
#import "HistoryBetViewController.h"
#import "RealTimeBetViewController.h"
#import "StationMainViewController.h"
#import "PlayerCenterViewController.h"
#import "CreateAcountViewController.h"
#import "LotterySettingViewController.h"
#import "StationManagerViewController.h"
@interface StationMainViewController ()

@end

@implementation StationMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /**
     * 默认选择历史投注
     **/
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]
                                 initWithTitle:@"历史投注"
                                 style:UIBarButtonItemStyleBordered
                                 target:self
                                 action:@selector(doHistoryBtn:)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    [rightBtn release];

    
    LotterySettingViewController *lsViewCtr = [[[LotterySettingViewController alloc]init]autorelease];
    PlayerCenterViewController   *pcViewCtr = [[[PlayerCenterViewController alloc]init]autorelease];
    RealTimeBetViewController    *rtViewCtr = [[[RealTimeBetViewController alloc]init]autorelease];
    StationManagerViewController *smViewCtr = [[[StationManagerViewController alloc]init]autorelease];
    NewsWallViewController       *nwViewCtr = [[[NewsWallViewController alloc]init]autorelease];
    
    NSArray *viewList = [NSArray arrayWithObjects:rtViewCtr,
                                                  lsViewCtr,
                                                  pcViewCtr,
                                                  smViewCtr,
                                                  nwViewCtr, nil];
    
    actionTabBarCtr = [[UITabBarController alloc]init];
    actionTabBarCtr.delegate            = self;
    actionTabBarCtr.viewControllers     = viewList;
    actionTabBarCtr.selectedIndex       = 0;
    actionTabBarCtr.view.frame = CGRectMake(0,
                                            0,
                                            self.view.frame.size.width,
                                            self.view.frame.size.height);
    [self.view addSubview:actionTabBarCtr.view];
    
    self.title = @"实时投注";
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    actionTabBarCtr.delegate = nil;
    actionTabBarCtr = nil;
}

- (void) dealloc
{
    [super dealloc];
    [actionTabBarCtr release];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark UIButton Clicked Action
- (void) doHistoryBtn:(id)sender
{
    HistoryBetViewController *hbViewCtr = [[HistoryBetViewController alloc]init];
    [self.navigationController pushViewController:hbViewCtr animated:YES];
    [hbViewCtr release];
}

- (void) doAddBtn:(id)sender
{
    AddNewsViewController *nwViewCtr = [[AddNewsViewController alloc]init];
    nwViewCtr.viewType = kAddView;
    [self.navigationController pushViewController:nwViewCtr animated:YES];
    [nwViewCtr release];
}

- (void) doCreateAcount:(id)sender
{
    CreateAcountViewController *caVc = [[CreateAcountViewController alloc]init];
    [self.navigationController pushViewController:caVc animated:YES];
    [caVc release];
}

- (void) doSellClicked:(id)sender
{
    NewLotteryViewController *nlVc = [[NewLotteryViewController alloc]init];
    [self.navigationController pushViewController:nlVc animated:YES];
    [nlVc release];
}

#pragma mark -
#pragma mark UITabBarControllerDelegate
- (void) tabBarController:(UITabBarController *)tabBarController
  didSelectViewController:(UIViewController *)viewController
{
    tabBarController.selectedViewController = viewController;
    switch (viewController.tabBarItem.tag)
    {
        case 0:         //实时投注
        {
            self.title = @"实时投注";
            UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]
                                         initWithTitle:@"历史投注"
                                         style:UIBarButtonItemStyleBordered
                                         target:self
                                         action:@selector(doHistoryBtn:)];
            self.navigationItem.rightBarButtonItem = rightBtn;
            [rightBtn release];
            
            break;
        }
        case 1:         //彩票设定
        {
            self.title = @"彩票设定";
            UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]initWithTitle:@"开售"
                                                                        style:UIBarButtonItemStyleBordered
                                                                       target:self
                                                                       action:@selector(doSellClicked:)];
            self.navigationItem.rightBarButtonItem = rightBtn;
            break;
        }
        case 2:         //彩民中心
        {
            self.title = @"彩民中心";
            UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]initWithTitle:@"开户"
                                                                        style:UIBarButtonItemStyleBordered
                                                                       target:self
                                                                       action:@selector(doCreateAcount:)];
            self.navigationItem.rightBarButtonItem = rightBtn;
            [rightBtn release];
            break;
        }
        case 3:         //本站管理
        {
            self.title = @"本站管理";
            self.navigationItem.rightBarButtonItem = nil;
            break;
        }
        case 4:         //新闻公告
        {
            self.title = @"新闻公告";
            UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]
                                         initWithTitle:@"添加"
                                         style:UIBarButtonItemStyleBordered
                                         target:self
                                         action:@selector(doAddBtn:)];
            self.navigationItem.rightBarButtonItem = rightBtn;
            [rightBtn release];
            break;
        }
        default:
            break;
    }
}
@end
