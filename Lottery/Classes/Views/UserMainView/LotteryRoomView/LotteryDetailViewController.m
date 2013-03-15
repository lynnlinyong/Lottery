//
//  LotteryDetailViewController.m
//  Lottery
//
//  Created by lynn  lynn on 13-3-14.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//
#import "Award.h"
#import "LotteryDetailViewController.h"
#import "HistoryLotteyViewController.h"

@interface LotteryDetailViewController ()

@end

@implementation LotteryDetailViewController
@synthesize lottery;

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
    self.title = @"中奖信息";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"历史开奖"
                                                                             style:UIBarButtonItemStyleBordered
                                                                            target:self 
                                                                            action:@selector(doHistoryLotteryBtnClicked:)];
    
    UILabel *nameLab = [[UILabel alloc]init];
    nameLab.font     = [UIFont fontWithName:@"Helvetica-Bold"
                                       size:18];
    nameLab.text     = lottery.name;
    nameLab.frame    = CGRectMake(0, 0, 320, 20);
    [self.view addSubview:nameLab];
    [nameLab release];
    
    UILabel *timeLab  = [[UILabel alloc]init];
    timeLab.text      = [NSString stringWithFormat:@"开奖日期:%@", lottery.time];
    timeLab.font      = [UIFont systemFontOfSize:14];
    timeLab.frame     = CGRectMake(0, 20, 160, 20);
    [self.view addSubview:timeLab];
    [timeLab release];
    
    UILabel *phaseLab = [[UILabel alloc]init];
    phaseLab.text     = [NSString stringWithFormat:@"第%@", lottery.phase];
    phaseLab.font     = [UIFont systemFontOfSize:14];
    phaseLab.frame    = CGRectMake(160, 20, 160, 20);
    [self.view addSubview:phaseLab];
    [phaseLab release];
    
    UILabel *curNumberLab = [[UILabel alloc]init];
    curNumberLab.text     = lottery.currentNumber;
    curNumberLab.frame    = CGRectMake(0, 40, 320, 20);
    curNumberLab.textAlignment = UITextAlignmentCenter;
    [self.view addSubview:curNumberLab];
    [curNumberLab release];
    
    /**
     * 创建表格
     **/
    rankArray = [[NSMutableArray alloc]init];
    
    Award *award = [[Award alloc]init];
    award.awardType = @"一等奖";
    award.winCount  = @"4";
    award.everyCountMoney = @"10000000";
    [rankArray addObject:award];
    
    Award *award1 = [[Award alloc]init];
    award1.awardType = @"二等奖";
    award1.winCount  = @"5";
    award1.everyCountMoney = @"10000000";
    [rankArray addObject:award1];
    
    Award *award2 = [[Award alloc]init];
    award2.awardType = @"三等奖";
    award2.winCount  = @"3";
    award2.everyCountMoney = @"10000000";
    [rankArray addObject:award2];
    
    Award *award3 = [[Award alloc]init];
    award3.awardType = @"四等奖";
    award3.winCount  = @"2";
    award3.everyCountMoney = @"10000000";
    [rankArray addObject:award3];
    
    Award *award4 = [[Award alloc]init];
    award4.awardType = @"五等奖";
    award4.winCount  = @"2";
    award4.everyCountMoney = @"10000000";
    [rankArray addObject:award4];
    
    Award *award5 = [[Award alloc]init];
    award5.awardType = @"六等奖";
    award5.winCount  = @"1";
    award5.everyCountMoney = @"10000000";
    [rankArray addObject:award5];
    
    lotteryRankTab  = [[UITableView alloc]init];
    lotteryRankTab.delegate   = self;
    lotteryRankTab.dataSource = self;
    lotteryRankTab.frame      = CGRectMake(10, 70, 300, 310);
    lotteryRankTab.scrollEnabled = NO;
    [self.view addSubview:lotteryRankTab];
}

- (void)viewDidUnload
{
    lottery = nil;
    
    lotteryRankTab.delegate   = self;
    lotteryRankTab.dataSource = self;
    lotteryRankTab = nil;
    [super viewDidUnload];
}

- (void) dealloc
{
    [lottery release];
    
    [rankArray removeAllObjects];
    [rankArray release];
    
    lotteryRankTab.delegate   = nil;
    lotteryRankTab.dataSource = nil;
    [lotteryRankTab release];
    [super dealloc];
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
    return rankArray.count+1;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        return 20;
    }
    
    return 44;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *idString = @"idString";
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                                  reuseIdentifier:idString];
    cell.selectedBackgroundView = [[[UIView alloc]init]autorelease];
    cell.selectedBackgroundView.backgroundColor = [UIColor clearColor];
    if (indexPath.row == 0)
    {
        UILabel *awardTypeLab = [[UILabel alloc]init];
        awardTypeLab.text     = @"奖项";
        awardTypeLab.frame    = CGRectMake(0, 0, 98, 20);
        awardTypeLab.backgroundColor = [UIColor grayColor];
        awardTypeLab.textAlignment   = UITextAlignmentCenter;
        [cell addSubview:awardTypeLab];
        [awardTypeLab release];
        
        UIImageView *lineImgView = [[UIImageView alloc]init];
        lineImgView.image = [UIImage imageNamed:@"line.png"];
        lineImgView.frame = CGRectMake(98, 0, 2, 20);
        [cell addSubview:lineImgView];
        [lineImgView release];
        
        UILabel *winCountLab = [[UILabel alloc]init];
        winCountLab.text     = @"中奖注数";
        winCountLab.frame    = CGRectMake(100, 0, 102, 20);
        winCountLab.backgroundColor = [UIColor grayColor];
        winCountLab.textAlignment   = UITextAlignmentCenter;
        [cell addSubview:winCountLab];
        [winCountLab release];
        
        UIImageView *lineImgView1 = [[UIImageView alloc]init];
        lineImgView1.image = [UIImage imageNamed:@"line.png"];
        lineImgView1.frame = CGRectMake(202, 0, 2, 20);
        [cell addSubview:lineImgView1];
        [lineImgView1 release];
        
        UILabel *everyWinMoneyLab = [[UILabel alloc]init];
        everyWinMoneyLab.text     = @"每注奖金";
        everyWinMoneyLab.frame    = CGRectMake(204, 0, 100, 20);
        everyWinMoneyLab.backgroundColor = [UIColor grayColor];
        everyWinMoneyLab.textAlignment   = UITextAlignmentCenter;
        [cell addSubview:everyWinMoneyLab];
        [everyWinMoneyLab release];
    }
    else 
    {    
        Award *tAward = [rankArray objectAtIndex:indexPath.row-1];
        
        UILabel *awardLab = [[UILabel alloc]init];
        awardLab.text     = tAward.awardType;
        awardLab.frame    = CGRectMake(0, 10, 98, 20);
        if (indexPath.row%2 != 0)
        {
            awardLab.backgroundColor = [UIColor lightGrayColor];
        }
        awardLab.textAlignment = UITextAlignmentCenter;
        [cell addSubview:awardLab];
        [awardLab release];
        
        UIImageView *lineImgView = [[UIImageView alloc]init];
        lineImgView.image = [UIImage imageNamed:@"line.png"];
        lineImgView.frame = CGRectMake(98, 0, 2, 44);
        [cell addSubview:lineImgView];
        [lineImgView release];
        
        UILabel *winCountLab = [[UILabel alloc]init];
        winCountLab.text     = tAward.winCount;
        winCountLab.frame    = CGRectMake(100, 10, 102, 20);
        if (indexPath.row%2 != 0)
        {
            winCountLab.backgroundColor = [UIColor lightGrayColor];
        }
        winCountLab.textAlignment = UITextAlignmentCenter;
        [cell addSubview:winCountLab];
        [winCountLab release];
        
        UIImageView *lineImgView1 = [[UIImageView alloc]init];
        lineImgView1.image = [UIImage imageNamed:@"line.png"];
        lineImgView1.frame = CGRectMake(202, 0, 2, 44);
        [cell addSubview:lineImgView1];
        [lineImgView1 release];
        
        UILabel *everyCountLab = [[UILabel alloc]init];
        everyCountLab.text     = tAward.everyCountMoney;
        everyCountLab.frame    = CGRectMake(204, 10, 100, 20);
        if (indexPath.row%2 != 0)
        {
            everyCountLab.backgroundColor = [UIColor lightGrayColor];
        }
        everyCountLab.textAlignment = UITextAlignmentCenter;
        [cell addSubview:everyCountLab];
        [everyCountLab release];
        
        if (indexPath.row%2 != 0)
        {
            cell.backgroundView = [[[UIView alloc]init]autorelease];
            cell.backgroundView.backgroundColor = [UIColor lightGrayColor];
        }
    }
    
    return cell;
}

#pragma mark -
#pragma mark UIButton Clicked Action
- (void) doHistoryLotteryBtnClicked:(id)sender
{
    UINavigationController *navCtr = [UserMainViewController getNavViewController];
    HistoryLotteyViewController *hLViewCtr = [[HistoryLotteyViewController alloc]init];
    [navCtr pushViewController:hLViewCtr animated:YES];
    [hLViewCtr release];
}
@end
