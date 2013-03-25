//
//  PersonalCenterViewController.m
//  Lottery
//
//  Created by lynn  lynn on 13-3-10.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//
#import "AppDelegate.h"
#import "MyLotteryViewController.h"
#import "BookBalanceViewController.h"
#import "PersonalCenterViewController.h"
#import "MyselfInfomationViewController.h"

@interface PersonalCenterViewController ()

@end

@implementation PersonalCenterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"用户中心" 
                                                       image:[UIImage imageNamed:@"light"]
                                                         tag:2];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /**
     * 初始化UI
     **/
    personInfoLab = [[UITableView alloc]init];
    personInfoLab.delegate   = self;
    personInfoLab.dataSource = self;
    personInfoLab.frame      = CGRectMake(0, 0, 320, 416);
    [self.view addSubview:personInfoLab];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    personInfoLab = nil;
    personInfoLab.delegate   = nil;
    personInfoLab.dataSource = nil;
}

- (void) dealloc
{
    [super dealloc];
    [personInfoLab release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark UITableViewDelegate and UITableViewDatasource
- (int) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:         //账户资金
        {
            return 2;
            break;
        }
        case 1:         //投注管理
        {
            return 1;
            break;
        }
        case 2:         //账号管理
        {
            return 1;
            break;
        }
        case 3:         //个人资料
        {
            return 1;
            break;
        }
        default:
            break;
    }
    
    return 1;
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
        {
            return @"账户资金";
            break;
        }
        case 1:
        {
            return @"投注管理";
            break;
        }
        case 2:
        {
            return @"账号管理";
            break;
        }
        case 3:
        {
            return @"个人资料";
            break;
        }
        default:
            break;
    }
    
    return nil;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *idString = @"idString";
    switch (indexPath.section)
    {
        case 0:         //账户资金
        {
            switch (indexPath.row)
            {
                case 0:         //账户号
                {
                    UITableViewCell *cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idString]autorelease];
                    cell.selectionStyle   = UITableViewCellSelectionStyleNone;
                    
                    UILabel *contentLab   = [[UILabel alloc]init];
                    contentLab.text       = @"当前账户:562342957";
                    contentLab.frame      = CGRectMake(0, 0, 320, 40);
                    [cell addSubview:contentLab];
                    [contentLab release];
                    return cell;
                    break;
                }
                case 1:         //可用余额
                {
                    UITableViewCell *cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idString]autorelease];
                    cell.selectionStyle   = UITableViewCellSelectionStyleNone;
                    
                    UILabel *contentLab = [[UILabel alloc]init];
                    contentLab.text     = @"可用余额:100元";
                    contentLab.frame    = CGRectMake(0, 0, 320, 40);
                    [cell addSubview:contentLab];
                    [contentLab release];
                    return cell;
                    break;
                }
                default:
                    break;
            }
            break;
        }
        case 1:         //投注管理
        {
            UITableViewCell *cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idString]autorelease];
            cell.accessoryType    = UITableViewCellAccessoryDisclosureIndicator;
            
            UILabel *contentLab = [[UILabel alloc]init];
            contentLab.text     = @"我的彩票";
            contentLab.frame    = CGRectMake(0, 0, 320, 40);
            [cell addSubview:contentLab];
            [contentLab release];
            return cell;

            break;
        }
        case 2:         //账号管理
        {
            UITableViewCell *cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idString]autorelease];
            cell.accessoryType    = UITableViewCellAccessoryDisclosureIndicator;
        
            UILabel *contentLab = [[UILabel alloc]init];
            contentLab.text     = @"现金流水账";
            contentLab.frame    = CGRectMake(0, 0, 320, 40);
            [cell addSubview:contentLab];
            [contentLab release];
            return cell;

            break;
        }
        case 3:         //个人资料
        {
            UITableViewCell *cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idString]autorelease];
            cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
            
            UILabel *contentLab = [[UILabel alloc]init];
            contentLab.text     = @"个人信息";
            contentLab.frame    = CGRectMake(0, 0, 320, 40);
            [cell addSubview:contentLab];
            [contentLab release];
            return cell;

            break;
        }
        default:
            break;
    }
    
    return nil;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UINavigationController *navCtr = [AppDelegate getNavViewController];
    switch (indexPath.section)
    {
        case 0:         //账户资金
        {
            break;
        }
        case 1:         //投注管理
        {
            if (indexPath.row == 0)  //我的彩票
            {
                MyLotteryViewController *myLotteryViewCtr = [[MyLotteryViewController alloc]init];
                myLotteryViewCtr.title = @"我的彩票";
                [navCtr pushViewController:myLotteryViewCtr
                                  animated:YES];
                [myLotteryViewCtr release];
            }
            break;
        }
        case 2:         //账号管理
        {
            if (indexPath.row == 0) //现金流水账
            {
                BookBalanceViewController *bookBalanceViewCtr = [[BookBalanceViewController alloc]init];
                [navCtr pushViewController:bookBalanceViewCtr
                                  animated:YES];
                [bookBalanceViewCtr release];
            }
            break;
        }
        case 3:         //个人资料
        {
            if (indexPath.row == 0) //个人信息
            {
                MyselfInfomationViewController *myselfInfoViewCtr = [[MyselfInfomationViewController alloc]init];
                [navCtr pushViewController:myselfInfoViewCtr animated:YES];
                [myselfInfoViewCtr release];
            }
            break;
        }
        default:
            break;
    }
}

@end
