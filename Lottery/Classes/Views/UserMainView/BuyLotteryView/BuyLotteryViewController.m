//
//  BuyLotteryViewController.m
//  Lottery
//
//  Created by lynn  lynn on 13-3-10.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//
#import "AppDelegate.h"
#import "LetteryTableViewCell.h"
#import "BuyLotteryViewController.h"
#import "LetteryDetailViewController.h"

#define LOTTERY_TABLE_HEIGHT        285

@interface BuyLotteryViewController ()

@end

@implementation BuyLotteryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem = [[[UITabBarItem alloc]initWithTitle:@"购买彩票"
                                                       image:[UIImage imageNamed:@"light"]
                                                         tag:0]autorelease];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //初始化UI
    UILabel *newsLab = [[UILabel alloc]init];
    newsLab.text     = @"滚动新闻";
    newsLab.frame    = CGRectMake(0, 0, 100, 20);
    [self.view addSubview:newsLab];
    [newsLab release];
    
    UIButton *sportBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [sportBtn setTitle:@"体彩" 
              forState:UIControlStateNormal];
    [sportBtn addTarget:self 
                 action:@selector(doSportBtnClicked:)
       forControlEvents:UIControlEventTouchUpInside];
    [sportBtn setFrame:CGRectMake(60, 40, 80, 30)];
    [self.view addSubview:sportBtn];
    
    UIButton *welfareBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [welfareBtn setTitle:@"福彩" 
                forState:UIControlStateNormal];
    [welfareBtn addTarget:self
                   action:@selector(doWelfareBtnClicked:) 
         forControlEvents:UIControlEventTouchUpInside];
    [welfareBtn setFrame:CGRectMake(180, 40, 80, 30)];
    [self.view addSubview:welfareBtn];
    
    /**
     * 初始化彩票列表
     **/
    isSport      = YES;
    
    lotteryArray = [[NSMutableArray alloc]initWithObjects:@"大乐透",@"7位数",@"11选5", nil];
    lotteryTab   = [[UITableView alloc]init];
    lotteryTab.delegate   = self;
    lotteryTab.dataSource = self;
    lotteryTab.frame      = CGRectMake(0, 80, 320, LOTTERY_TABLE_HEIGHT);
    lotteryTab.scrollEnabled = NO;
    [self.view addSubview:lotteryTab];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [lotteryArray removeAllObjects];
    [lotteryArray release];
    
    lotteryTab = nil;
    lotteryTab.delegate   = nil;
    lotteryTab.dataSource = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark UITableViewDelegate and UITableViewDatasource
- (int) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return lotteryArray.count;
}

- (float) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return LOTTERY_TABLE_HEIGHT/3;
}

- (UITableViewCell *) tableView:(UITableView *)tableView
          cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *idString = @"idString";
    LetteryTableViewCell *cell = [[[LetteryTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                                             reuseIdentifier:idString]autorelease];
    cell.nameLab.text = [lotteryArray objectAtIndex:indexPath.row];
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UINavigationController *navCtr = [UserMainViewController getNavViewController];
    if (isSport)
    {
        switch (indexPath.row)
        {
            case 0:         //大乐透
            {   
                LetteryDetailViewController *ldViewCtr = [[LetteryDetailViewController alloc]init];
                [navCtr pushViewController:ldViewCtr 
                                  animated:YES];
                [ldViewCtr release];
                break;
            }
            case 1:         //7位数
            {
                break;
            }
            case 2:         //11选5
            {
                break;
            }
            default:
                break;
        }
    }
    else 
    {
        switch (indexPath.row)
        {
            case 0:        //双色球
            {
                break;
            }
            case 1:        //七彩乐
            {
                break;
            }
            case 2:        //快3
            {
                break;
            }
            default:
                break;
        }
    }
}

#pragma mark -
#pragma mark Button Clicked Action
- (void) doSportBtnClicked:(id)sender
{
    isSport = YES;
    
    [lotteryArray removeAllObjects];
    [lotteryArray addObject:@"大乐透"];
    [lotteryArray addObject:@"7位数"];
    [lotteryArray addObject:@"11选5"];
    [lotteryTab reloadData];
}

- (void) doWelfareBtnClicked:(id)sender
{   
    isSport = NO;
    
    [lotteryArray removeAllObjects];
    [lotteryArray addObject:@"双色球"];
    [lotteryArray addObject:@"七彩乐"];
    [lotteryArray addObject:@"快3"];
    [lotteryTab reloadData];
}
@end
