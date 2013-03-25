//
//  MyLotteryViewController.m
//  Lottery
//
//  Created by lynn  lynn on 13-3-11.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//
#import "Lottery.h"
#import "AppDelegate.h"
#import "MyLotteryCell.h"
#import "QuartzCore/QuartzCore.h"
#import "MyLotteryViewController.h"
#import "MyLotteryDetailViewController.h"

#define MY_LOTTERY_TABLE_HEIGHT   (460-44-45)

@interface MyLotteryViewController ()

@end

@implementation MyLotteryViewController
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
    
    UILabel *typeLab = [[UILabel alloc]init];
    typeLab.text  = @"类型:";
    typeLab.frame = CGRectMake(5, 10, 40, 20);
    [self.view addSubview:typeLab];
    [typeLab release];
    
    typeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    typeBtn.layer.borderWidth  = 1;
    typeBtn.layer.borderColor  = [[UIColor blackColor] CGColor];
    typeBtn.layer.cornerRadius = 5;
    [typeBtn setTitle:@"全部" 
             forState:UIControlStateNormal];
    [typeBtn setTitleColor:[UIColor blackColor] 
                  forState:UIControlStateNormal];
    [typeBtn addTarget:self 
                action:@selector(doTypeSelectBtnClicked:)
      forControlEvents:UIControlEventTouchUpInside];
    typeBtn.frame = CGRectMake(50, 7, 100, 30);
    [self.view addSubview:typeBtn];
    
    UILabel *statusLab = [[UILabel alloc]init];
    statusLab.text  = @"状态:";
    statusLab.frame = CGRectMake(320-110-40, 10, 40, 20);
    [self.view addSubview:statusLab];
    [statusLab release];
    
    statusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    statusBtn.layer.borderWidth  = 1;
    statusBtn.layer.borderColor  = [[UIColor blackColor] CGColor];
    statusBtn.layer.cornerRadius = 5;
    [statusBtn setTitleColor:[UIColor blackColor] 
                    forState:UIControlStateNormal];
    [statusBtn setTitle:@"全部" 
               forState:UIControlStateNormal];
    [statusBtn addTarget:self 
                  action:@selector(doStatusBtnClicked:)
        forControlEvents:UIControlEventTouchUpInside];
    statusBtn.frame = CGRectMake(320-110, 7, 100, 30);
    [self.view addSubview:statusBtn];
    
    /**
     * 初始化我的彩票列表
     **/
    Lottery *lottery = [[[Lottery alloc]init]autorelease];
    lottery.imgUrl   = @"lottery_icon";
    lottery.name     = @"大乐透";
    lottery.phase    = @"100022";
    lottery.money    = @"10";
    lottery.reward   = @"10";
    lottery.time     = @"15:43 03-11";
    lottery.kLotteryStatus = kLotteryWin;
    lottery.pepoleID   = @"123234";
    lottery.betAmounts = @"1";
    lottery.times      = @"1";
    lottery.buyType    = @"代购";
    lottery.betTime    = @"2013-01-10 15:42";
    lottery.projectStatus = @"投注成功";
    lottery.result     = @"未中奖";
    lottery.phaseTotal = @"0";
    lottery.currentNumber = @"01 02 03 04 05 06 07";
    lottery.projectArray  = [[NSMutableArray alloc]initWithObjects:@"01 02 44 43",
                                                                   @"02 04 50 09",
                                                                   @"13 11 14 15",
                                                                   @"16 17 18 19",
                                                                   @"12 13 14 15",nil];
    
    
    Lottery *lottery1 = [[[Lottery alloc]init]autorelease];
    lottery1.imgUrl   = @"lottery_icon";
    lottery1.name     = @"大乐透";
    lottery1.phase    = @"100022";
    lottery1.money    = @"10";
    lottery1.reward   = @"10";
    lottery1.time     = @"15:43 03-11";
    lottery1.kLotteryStatus = kLotteryWin;
    lottery1.pepoleID   = @"123234";
    lottery1.betAmounts = @"1";
    lottery1.times      = @"1";
    lottery1.buyType    = @"代购";
    lottery1.betTime    = @"2013-01-10 15:42";
    lottery1.projectStatus = @"投注成功";
    lottery1.result     = @"未中奖";
    lottery1.phaseTotal = @"0";
    lottery1.currentNumber = @"01 02 03 04 05 06 07";
    lottery1.projectArray  = [[NSMutableArray alloc]initWithObjects:@"01 02 44 43",
                             @"02 04 50 09",
                             @"13 11 14 15",
                             @"16 17 18 19",
                             @"12 13 14 15",nil];
    
    Lottery *lottery2 = [[[Lottery alloc]init]autorelease];
    lottery2.imgUrl   = @"lottery_icon";
    lottery2.name     = @"大乐透";
    lottery2.phase    = @"100022";
    lottery2.money    = @"10";
    lottery2.reward   = @"10";
    lottery2.time     = @"15:43 03-11";
    lottery2.kLotteryStatus = kLotteryWin;
    lottery2.pepoleID   = @"123234";
    lottery2.betAmounts = @"1";
    lottery2.times      = @"1";
    lottery2.buyType    = @"代购";
    lottery2.betTime    = @"2013-01-10 15:42";
    lottery2.projectStatus = @"投注成功";
    lottery2.result     = @"未中奖";
    lottery2.phaseTotal = @"0";
    lottery2.currentNumber = @"01 02 03 04 05 06 07";
    lottery2.projectArray  = [[NSMutableArray alloc]initWithObjects:@"01 02 44 43",
                                                                    @"02 04 50 09",
                                                                    @"13 11 14 15",
                                                                    @"16 17 18 19",
                                                                    @"12 13 14 15",nil];
    
    Lottery *lottery3 = [[[Lottery alloc]init]autorelease];
    lottery3.imgUrl   = @"lottery_icon";
    lottery3.name     = @"大乐透";
    lottery3.phase    = @"100022";
    lottery3.money    = @"10";
    lottery3.reward   = @"10";
    lottery3.time     = @"15:43 03-11";
    lottery3.kLotteryStatus = kLotteryWin;
    lottery3.pepoleID   = @"123234";
    lottery3.betAmounts = @"1";
    lottery3.times      = @"1";
    lottery3.buyType    = @"代购";
    lottery3.betTime    = @"2013-01-10 15:42";
    lottery3.projectStatus = @"投注成功";
    lottery3.result     = @"未中奖";
    lottery3.phaseTotal = @"0";
    lottery3.currentNumber = @"01 02 03 04 05 06 07";
    lottery3.projectArray  = [[NSMutableArray alloc]initWithObjects:@"01 02 44 43",
                             @"02 04 50 09",
                             @"13 11 14 15",
                             @"16 17 18 19",
                             @"12 13 14 15",nil];
    
    myLotteryArray = [[NSMutableArray alloc]init];
    [myLotteryArray addObject:lottery];
    [myLotteryArray addObject:lottery1];
    [myLotteryArray addObject:lottery2];
    [myLotteryArray addObject:lottery3];
    
    myLotterTab = [[UITableView alloc]init];
    myLotterTab.delegate   = self;
    myLotterTab.dataSource = self;
    myLotterTab.frame      = CGRectMake(0, 45, 320, MY_LOTTERY_TABLE_HEIGHT);
    [self.view addSubview:myLotterTab];
}

- (void)viewDidUnload
{
    [typeDropDown release];
    typeDropDown = nil;
    typeBtn      = nil;
    
    [statusDropDown release];
    statusDropDown = nil;
    statusBtn      = nil;
    
    myLotterTab.delegate   = nil;
    myLotterTab.dataSource = nil;
    myLotterTab = nil;
    [super viewDidUnload];
}

- (void) dealloc
{
    [myLotterTab release];
    [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark-
#pragma mark UITableViewDelegate and UITableViewDatasource
- (int) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return myLotteryArray.count;
}

- (float) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return MY_LOTTERY_TABLE_HEIGHT / 5;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *idString = @"idString";
    MyLotteryCell *cell = [[[MyLotteryCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idString]autorelease];
    Lottery *lottery = [myLotteryArray objectAtIndex:indexPath.row];
    
    cell.nameLab.text   = lottery.name;
    cell.phaseLab.text  = [NSString stringWithFormat:@"%@期", lottery.phase];
    cell.moneyLab.text  = [NSString stringWithFormat:@"%@元", lottery.money];
    cell.timeLab.text   = lottery.time;
    cell.rewardLab.text = [NSString stringWithFormat:@"%@元", lottery.reward];
    switch (lottery.kLotteryStatus)
    {
        case kLotteryWin:
        {
            cell.stateLab.text  = @"中奖";
            break;
        }  
        case kLotteryLose:
        {
            cell.stateLab.text  = @"未中奖";
            break;
        }   
        case kLotteryIsNotTicket:
        {
            cell.stateLab.text = @"未出票";
            break;
        }   
        default:
            break;
    }
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyLotteryDetailViewController *lotteryDetailViewCtr = [[MyLotteryDetailViewController alloc]initWithStyle:UITableViewStyleGrouped];
    lotteryDetailViewCtr.lottery   = [myLotteryArray objectAtIndex:indexPath.row];
    UINavigationController *navCtr = [AppDelegate getNavViewController];
    [navCtr pushViewController:lotteryDetailViewCtr 
                      animated:YES];
    [lotteryDetailViewCtr release];
}

#pragma mark-
#pragma mark NIDropDownDelegate
- (void) niDropDownDelegateMethod: (NIDropDown *) sender
{
    if (sender == typeDropDown)
    {
        [self releaseTypeDropDown];
    }
    else 
    {
        [self releaseStatusDropDown];
    }
}

#pragma mark-
#pragma mark UIButton Clicked Action
- (void) doTypeSelectBtnClicked:(id)sender
{
    NSArray * arr = [[NSArray alloc] init];
    arr = [NSArray arrayWithObjects:@"全部",@"七彩乐",
                                    @"双色球",@"7位数",
                                    @"大乐透",@"11选5",
                                    @"快3",nil];
    if(typeDropDown == nil) 
    {
        CGFloat f = 200;
        typeDropDown = [[NIDropDown alloc]showDropDown:sender :&f :arr];
        typeDropDown.delegate = self;
    }
    else 
    {
        [typeDropDown hideDropDown:sender];
        [self releaseTypeDropDown];
    }
}

- (void) doStatusBtnClicked:(id)sender
{
    NSArray * arr = [[NSArray alloc] init];
    arr = [NSArray arrayWithObjects:@"全部",@"已中奖",
                                    @"未中奖",@"未出票",nil];
    if(statusDropDown == nil) 
    {
        CGFloat f = 200;
        statusDropDown = [[NIDropDown alloc]showDropDown:sender :&f :arr];
        statusDropDown.delegate = self;
    }
    else {
        [statusDropDown hideDropDown:sender];
        [self releaseStatusDropDown];
    }
}

- (void) releaseStatusDropDown
{
    [statusDropDown release];
    statusDropDown = nil;
}

- (void) releaseTypeDropDown
{
    [typeDropDown release];
    typeDropDown = nil;
}
@end
