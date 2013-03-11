//
//  UserMainViewController.m
//  Lottery
//
//  Created by lynn  lynn on 13-3-10.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "UserMainViewController.h"
#import "BuyLotteryViewController.h"
#import "LotteryRoomViewController.h"
#import "ExpectForecastViewController.h"
#import "PersonalCenterViewController.h"

@interface UserMainViewController ()

@end

@implementation UserMainViewController

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
    
    BuyLotteryViewController *buyLotteryViewCtr   = [[[BuyLotteryViewController alloc]init]autorelease];
    LotteryRoomViewController *lotteryRoomViewCtr = [[[LotteryRoomViewController alloc]init]autorelease];
    PersonalCenterViewController *personalCenterViewCtr = [[[PersonalCenterViewController alloc]init]autorelease];
    ExpectForecastViewController *expectViewCtr = [[[ExpectForecastViewController alloc]init]autorelease];
    NSArray *viewList = [NSArray arrayWithObjects:buyLotteryViewCtr,
                                                  lotteryRoomViewCtr,
                                                  personalCenterViewCtr,
                                                  expectViewCtr, nil];
    actionTabBarCtr = [[UITabBarController alloc]init];
    actionTabBarCtr.delegate            = self;
    actionTabBarCtr.viewControllers     = viewList;
    actionTabBarCtr.selectedIndex       = 0;
    actionTabBarCtr.view.frame = CGRectMake(0,
                                            0, 
                                            self.view.frame.size.width, 
                                            self.view.frame.size.height);
    [self.view addSubview:actionTabBarCtr.view];
    
    self.title = @"购买彩票";
}

- (void)viewDidUnload
{
    actionTabBarCtr = nil;
    actionTabBarCtr.delegate = nil;
    [super viewDidUnload];
}

- (void) dealloc
{
    [actionTabBarCtr release];
    [super dealloc];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark UITabBarControllerDelegate
- (void) tabBarController:(UITabBarController *)tabBarController
  didSelectViewController:(UIViewController *)viewController
{
    tabBarController.selectedViewController = viewController;
    switch (viewController.tabBarItem.tag)
    {
        case 0:         //购买彩票
        {
            self.title = @"购买彩票";
            break;
        }
        case 1:         //彩票大厅
        {
            self.title = @"彩票大厅";
            break;
        }
        case 2:         //用户中心
        {
            self.title = @"用户中心";
            break;
        }
        case 3:
        {
            self.title = @"专家预测";
            break;
        }
        default:
            break;
    }
    
}

@end
