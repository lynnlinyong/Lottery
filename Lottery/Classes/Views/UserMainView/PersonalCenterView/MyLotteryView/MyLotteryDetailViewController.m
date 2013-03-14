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
    
    arrayController = [[GCArraySectionController alloc] initWithArray:[lottery.projectArray copy] 
                                                       viewController:self];
    arrayController.title = NSLocalizedString(@"01 02 03 04 05",);
}

- (void)viewDidUnload
{
    lottery = nil;
    [super viewDidUnload];
}

- (void) dealloc
{
    [lottery          release];
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
    return 4;
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
            return 1;
            break;
        }
        case 3:
        {
            return arrayController.numberOfRow;
            break;
        }
        default:
            break;
    }
    
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 2)
    {
        return @"当期开奖号码";
    }
    else if (section == 3)
    {
        return @"方案内容";
    }
    return nil;
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
                    pepoleIDLab.text     = [NSString stringWithFormat:@"发起人:%@",lottery.pepoleID];
                    pepoleIDLab.frame    = CGRectMake(20, 12, 280, 20);
                    pepoleIDLab.backgroundColor = [UIColor clearColor];
                    [cell addSubview:pepoleIDLab];
                    [pepoleIDLab release];
                    
                    return cell;
                    break;
                }   
                case 1:     //方案金额,玩法
                {   
                    UILabel *moneyLab = [[UILabel alloc]init];
                    moneyLab.text     = [NSString stringWithFormat:@"方案金额:%@元",lottery.money];
                    moneyLab.frame    = CGRectMake(20, 12, 160, 20);
                    moneyLab.backgroundColor = [UIColor clearColor];
                    [cell addSubview:moneyLab];
                    [moneyLab release];
                    
                    UILabel *playLab = [[UILabel alloc]init];
                    playLab.text = [NSString stringWithFormat:@"玩法:前一?"];
                    playLab.frame = CGRectMake(170, 12, 140, 20);
                    playLab.backgroundColor = [UIColor clearColor];
                    [cell addSubview:playLab];
                    [playLab release];
                    break;
                }
                case 2:     //注数,倍数,购买方式
                {
                    UILabel *betCountLab = [[UILabel alloc]init];
                    betCountLab.text  = [NSString stringWithFormat:@"注数:%@",lottery.betAmounts];
                    betCountLab.frame = CGRectMake(20, 12, 100, 20);
                    betCountLab.backgroundColor = [UIColor clearColor];
                    [cell addSubview:betCountLab];
                    [betCountLab release];
                    
                    UILabel *timesLab = [[UILabel alloc]init];
                    timesLab.text  = [NSString stringWithFormat:@"倍数:%@", lottery.times];
                    timesLab.frame = CGRectMake(110, 12, 90, 20);
                    timesLab.backgroundColor = [UIColor clearColor];
                    [cell addSubview:timesLab];
                    [timesLab release];
                    
                    UILabel *buyTypeLab = [[UILabel alloc]init];
                    buyTypeLab.text = [NSString stringWithFormat:@"购买方式:%@", lottery.buyType];
                    buyTypeLab.frame = CGRectMake(220, 12, 90, 20);
                    buyTypeLab.backgroundColor = [UIColor clearColor];
                    [cell addSubview:buyTypeLab];
                    [buyTypeLab release];
                    break;
                }
                case 3:     //下注时间
                {
                    UILabel *betTimeLab = [[UILabel alloc]init];
                    betTimeLab.text = [NSString stringWithFormat:@"下注时间:%@", lottery.betTime];
                    betTimeLab.frame = CGRectMake(20, 12, 300, 20);
                    [cell addSubview:betTimeLab];
                    betTimeLab.backgroundColor = [UIColor clearColor];
                    [betTimeLab release];
                    break;
                }
                default:
                    break;
            }
            return cell;
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
                    pjStatusLab.frame = CGRectMake(20, 12, 300, 20); 
                    pjStatusLab.backgroundColor = [UIColor clearColor];
                    [cell addSubview:pjStatusLab];
                    [pjStatusLab release];
                    break;
                }   
                case 1:     //中奖情况
                {
                    UILabel *resultLab = [[UILabel alloc]init];
                    resultLab.text = [NSString stringWithFormat:@"中奖情况:%@", lottery.result];
                    resultLab.frame = CGRectMake(20, 12, 300, 20);
                    resultLab.backgroundColor = [UIColor clearColor];
                    [cell addSubview:resultLab];
                    [resultLab release];
                    break;
                }
                case 2:     //总奖金
                {
                    UILabel *totalPhaseLab = [[UILabel alloc]init];
                    totalPhaseLab.frame = CGRectMake(20, 12, 300, 20);
                    totalPhaseLab.text = [NSString stringWithFormat:@"总奖金(税后):%@", lottery.phaseTotal];
                    totalPhaseLab.backgroundColor = [UIColor clearColor];
                    [cell addSubview:totalPhaseLab];
                    [totalPhaseLab release];
                    break;
                }
                default:
                    break;
            }
            
            return cell;
            break;
        }
        case 2:
        {
            switch (indexPath.row)
            {
                case 0:     //当期开奖号码
                {   
                    UILabel *curNumberLab = [[UILabel alloc]init];
                    curNumberLab.text     = @"01 02 03 04 05 06 07";
                    curNumberLab.frame    = CGRectMake(20, 12, 300, 20);
                    curNumberLab.backgroundColor = [UIColor clearColor];
                    [cell addSubview:curNumberLab];
                    [curNumberLab release];
                    return cell;
                    break;
                }
                default:
                    break;
            }
        }
        case 3:
        {
            return [arrayController cellForRow:indexPath.row];
        }
        default:
            break;
    }
    
    return nil;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 3)
    {
        if (indexPath.row == 0)
        {
            return [arrayController didSelectCellAtRow:indexPath.row];
        }
    }
}

@end
