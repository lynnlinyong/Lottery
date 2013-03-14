//
//  LotteryRoomViewController.m
//  Lottery
//
//  Created by lynn  lynn on 13-3-10.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//
#import "Lottery.h"
#import "LotteryTableViewCell.h"
#import "LotteryRoomViewController.h"
#import "LotteryDetailViewController.h"

#define LOTTERY_TABLE_HEIGHT      (460 - 44 - 49)

@interface LotteryRoomViewController ()

@end

@implementation LotteryRoomViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem = [[[UITabBarItem alloc]initWithTitle:@"开奖大厅" 
                                                       image:[UIImage imageNamed:@"light"] 
                                                         tag:1]autorelease];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    lotteryArray = [[NSMutableArray alloc]init];
    Lottery *lottery1 = [[Lottery alloc]init];
    lottery1.name     = @"大乐透";
    lottery1.phase    = @"20130401期";
    lottery1.time     = @"2013-04-01";
    lottery1.currentNumber = @"01 02 03 04 05 06 07";
    [lotteryArray addObject:lottery1];
    
    Lottery *lottery2 = [[Lottery alloc]init];
    lottery2.name     = @"双色球";
    lottery2.phase    = @"20130401期";
    lottery2.time     = @"2013-04-01";
    lottery2.currentNumber = @"01 02 03 04 05 06 07";
    [lotteryArray addObject:lottery2];
    
    Lottery *lottery3 = [[Lottery alloc]init];
    lottery3.name     = @"7位数";
    lottery3.phase    = @"20130401期";
    lottery3.time     = @"2013-04-01";
    lottery3.currentNumber = @"01 02 03 04 05 06 07";
    [lotteryArray addObject:lottery3];
    
    Lottery *lottery4 = [[Lottery alloc]init];
    lottery4.name     = @"11选5";
    lottery4.phase    = @"20130401期";
    lottery4.time     = @"2013-04-01";
    lottery4.currentNumber = @"01 02 03 04 05 06 07";
    [lotteryArray addObject:lottery4];
    
    Lottery *lottery5 = [[Lottery alloc]init];
    lottery5.name     = @"快3";
    lottery5.phase    = @"20130401期";
    lottery5.time     = @"2013-04-01";
    lottery5.currentNumber = @"01 02 03 04 05 06 07";
    [lotteryArray addObject:lottery5];
    
    Lottery *lottery6 = [[Lottery alloc]init];
    lottery6.name     = @"7乐彩";
    lottery6.phase    = @"20130401期";
    lottery6.time     = @"2013-04-01";
    lottery6.currentNumber = @"01 02 03 04 05 06 07";
    [lotteryArray addObject:lottery6];
    
    lotteryTab   = [[UITableView alloc]init];
    lotteryTab.delegate   = self;
    lotteryTab.dataSource = self;
    lotteryTab.frame      = CGRectMake(0, 0, 320, LOTTERY_TABLE_HEIGHT);
    [self.view addSubview:lotteryTab];
}

- (void)viewDidUnload
{
    lotteryTab.delegate   = nil;
    lotteryTab.dataSource = nil;
    lotteryTab = nil;
    [super viewDidUnload];
}

- (void) dealloc
{
    [lotteryArray removeAllObjects];
    [lotteryArray release];
    
    [lotteryTab release];
    
    [super dealloc];
}

#pragma mark -
#pragma mark UITableViewDelegate and UITableViewDatasource
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

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
    return LOTTERY_TABLE_HEIGHT / 5;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *idString = @"idString";
    LotteryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idString];
    if (!cell)
    {
        cell = [[[LotteryTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idString]autorelease];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    Lottery *tmpLottery     = [lotteryArray objectAtIndex:indexPath.row];
    cell.nameLab.text       = tmpLottery.name;
    cell.phaseLab.text      = tmpLottery.phase;
    cell.timeLab.text       = tmpLottery.time;
    cell.curNumberLab.text  = tmpLottery.currentNumber;
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LotteryDetailViewController *lotteryDetailViewCtr = [[LotteryDetailViewController alloc]init];
    lotteryDetailViewCtr.lottery   = [lotteryArray objectAtIndex:indexPath.row];
    UINavigationController *navCtr = [UserMainViewController getNavViewController];
    [navCtr pushViewController:lotteryDetailViewCtr animated:YES];
    [lotteryDetailViewCtr release];
}
@end
