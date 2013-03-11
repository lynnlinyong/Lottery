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
    self.title = @"我的彩票";
    
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
    lottery.monery   = @"10";
    lottery.reward   = @"10";
    lottery.time     = @"15:43 03-11";
    lottery.kLotteryStatus = kLotteryWin;
    
    Lottery *lottery1 = [[[Lottery alloc]init]autorelease];
    lottery1.imgUrl   = @"lottery_icon";
    lottery1.name     = @"大乐透";
    lottery1.phase    = @"100022";
    lottery1.monery   = @"10";
    lottery1.reward   = @"10";
    lottery1.time     = @"15:43 03-11";
    lottery1.kLotteryStatus = kLotteryWin;
    
    Lottery *lottery2 = [[[Lottery alloc]init]autorelease];
    lottery2.imgUrl   = @"lottery_icon";
    lottery2.name     = @"大乐透";
    lottery2.phase    = @"100022";
    lottery2.monery   = @"10";
    lottery2.reward   = @"10";
    lottery2.time     = @"15:43 03-11";
    lottery2.kLotteryStatus = kLotteryWin;
    
    Lottery *lottery3 = [[[Lottery alloc]init]autorelease];
    lottery3.imgUrl   = @"lottery_icon";
    lottery3.name     = @"大乐透";
    lottery3.phase    = @"100022";
    lottery3.monery   = @"10";
    lottery3.reward   = @"10";
    lottery3.time     = @"15:43 03-11";
    lottery3.kLotteryStatus = kLotteryWin;
    
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
    cell.moneyLab.text  = [NSString stringWithFormat:@"%@元", lottery.monery];
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
    MyLotteryDetailViewController *lotteryDetailViewCtr = [[MyLotteryDetailViewController alloc]init];
    lotteryDetailViewCtr.lottery   = [myLotteryArray objectAtIndex:indexPath.row];
    AppDelegate *appDelegate       = [[UIApplication sharedApplication] delegate];
    UINavigationController *navCtr = (UINavigationController *)appDelegate.window.rootViewController;
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
