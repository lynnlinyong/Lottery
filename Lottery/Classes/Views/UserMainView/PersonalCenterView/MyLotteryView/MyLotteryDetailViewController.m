//
//  MyLotteryDetailViewController.m
//  Lottery
//
//  Created by lynn  lynn on 13-3-11.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "MyLotteryDetailViewController.h"
@interface MyLotteryDetailViewController ()

@end

@implementation MyLotteryDetailViewController
@synthesize lottery;

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
    self.title = [NSString stringWithFormat:@"%@%@期", lottery.name,lottery.phase];
    
    lotteryDetailTab = [[UITableView alloc]init];
    lotteryDetailTab.delegate   = self;
    lotteryDetailTab.dataSource = self;
    lotteryDetailTab.frame      = CGRectMake(0, 0, 320, 460);
    [self.view addSubview:lotteryDetailTab];
}

- (void)viewDidUnload
{
    lottery = nil;
    
    lotteryDetailTab.delegate   = nil;
    lotteryDetailTab.dataSource = nil;
    lotteryDetailTab = nil;
    [super viewDidUnload];
}

- (void) dealloc
{
    [lottery          release];
    [lotteryDetailTab release];
    [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark UITbaleViewDelegate and UITableViewDatasource
- (int) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
        {
            return 4;
            break;
        }
        case 1:
        {
            return 3;
            break;
        }
        case 2:
        {
            return 2;
            break;
        }
        default:
            break;
    }
    
    return 1;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *idString    = @"idString";
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                                  reuseIdentifier:idString];
    switch (indexPath.section)
    {
        case 0:
        {
            switch (indexPath.row)
            {
                case 0:     //发起人
                {
                    UILabel *pepoleIDLab = [[UILabel alloc]init];
                    pepoleIDLab.text     = lottery.pepoleID;
                    pepoleIDLab.frame    = CGRectMake(0, 12, 320, 20);
                    [cell addSubview:pepoleIDLab];
                    [pepoleIDLab release];
                    break;
                }   
                case 1:     //方案金额,玩法
                {   
                    UILabel *moneyLab = [[UILabel alloc]init];
                    moneyLab.text     = [NSString stringWithFormat:@"方案金额:%@元",lottery.money];
                    moneyLab.frame    = CGRectMake(0, 12, 160, 20);
                    [cell addSubview:moneyLab];
                    [moneyLab release];
                    
                    UILabel *playLab = [[UILabel alloc]init];
                    playLab.text = [NSString stringWithFormat:@"玩法:前一?"];
                    playLab.frame = CGRectMake(170, 12, 150, 20);
                    [cell addSubview:playLab];
                    [playLab release];
                    break;
                }
                case 2:     //注数,倍数,购买方式
                {
                    UILabel *betCountLab = [[UILabel alloc]init];
                    betCountLab.text  = [NSString stringWithFormat:@"注数:%@",lottery.betAmounts];
                    betCountLab.frame = CGRectMake(0, 12, 100, 20);
                    [cell addSubview:betCountLab];
                    [betCountLab release];
                    
                    UILabel *timesLab = [[UILabel alloc]init];
                    timesLab.text  = [NSString stringWithFormat:@"倍数:%@", lottery.times];
                    timesLab.frame = CGRectMake(110, 12, 100, 20);
                    [cell addSubview:timesLab];
                    [timesLab release];
                    
                    UILabel *buyTypeLab = [[UILabel alloc]init];
                    buyTypeLab.text = [NSString stringWithFormat:@"购买方式:%@", lottery.buyType];
                    buyTypeLab.frame = CGRectMake(220, 12, 100, 20);
                    [cell addSubview:buyTypeLab];
                    [buyTypeLab release];
                    break;
                }
                case 3:     //下注时间
                {
                    UILabel *betTimeLab = [[UILabel alloc]init];
                    betTimeLab.text = [NSString stringWithFormat:@"购买方式:%@", lottery.buyType];
                    betTimeLab.frame = CGRectMake(0, 12, 320, 20);
                    [cell addSubview:betTimeLab];
                    [betTimeLab release];
                    break;
                }
                default:
                    break;
            }
            break;
        }
        case 1:
        {
            switch (indexPath.row)
            {
                case 0:     //方案状态
                {
                    UILabel *pjStatusLab = [[UILabel alloc]init];
                    pjStatusLab.text  = [NSString stringWithFormat:@"方案状态:%@", lottery.projectStatus];
                    pjStatusLab.frame = CGRectMake(0, 12, 320, 20); 
                    [cell addSubview:pjStatusLab];
                    [pjStatusLab release];
                    break;
                }   
                case 1:     //中奖情况
                {
                    UILabel *resultLab = [[UILabel alloc]init];
                    resultLab.text = [NSString stringWithFormat:@"中奖情况:%@", lottery.result];
                    resultLab.frame = CGRectMake(0, 12, 320, 20);
                    [cell addSubview:resultLab];
                    [resultLab release];
                    break;
                }
                case 2:     //总奖金
                {
                    UILabel *totalPhaseLab = [[UILabel alloc]init];
                    totalPhaseLab.frame = CGRectMake(0, 12, 320, 20);
                    totalPhaseLab.text = [NSString stringWithFormat:@"总奖金(税后):%@", lottery.phaseTotal];
                    [cell addSubview:totalPhaseLab];
                    [totalPhaseLab release];
                    break;
                }
                default:
                    break;
            }
            break;
        }
        case 2:
        {
            switch (indexPath.row)
            {
                case 0:     //方案内容
                {
                    break;
                }   
                case 1:     //当期开奖号码
                {
                    break;
                }
                default:
                    break;
            }
            break;
        }
        default:
            break;
    }
    
    return nil;
}

@end
