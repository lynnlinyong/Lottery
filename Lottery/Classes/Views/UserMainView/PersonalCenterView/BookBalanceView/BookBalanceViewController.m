//
//  BookBalanceViewController.m
//  Lottery
//
//  Created by lynn  lynn on 13-3-11.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//
#import "BookBalance.h"
#import "QuartzCore/QuartzCore.h"
#import "BookBalanceTableViewCell.h"
#import "BookBalanceViewController.h"

#define MY_BOOL_BALANCE_TABLE_HEIGHT   (460-44-45)

@interface BookBalanceViewController ()

@end

@implementation BookBalanceViewController

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
    self.title = @"现金流水账";
    
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
    
    timeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    timeBtn.layer.borderWidth  = 1;
    timeBtn.layer.borderColor  = [[UIColor blackColor] CGColor];
    timeBtn.layer.cornerRadius = 5;
    [timeBtn setTitleColor:[UIColor blackColor] 
                    forState:UIControlStateNormal];
    [timeBtn setTitle:@"全部" 
             forState:UIControlStateNormal];
    [timeBtn addTarget:self 
                action:@selector(doTimeBtnClicked:)
      forControlEvents:UIControlEventTouchUpInside];
    timeBtn.frame = CGRectMake(320-110, 7, 100, 30);
    [self.view addSubview:timeBtn];
    
    /**
     * 初始化账户流水列表
     **/
    bookBalanceArray = [[NSMutableArray alloc]init];
    
    BookBalance *bBalance = [[[BookBalance alloc]init]autorelease];
    bBalance.time  = @"2013-03-11 06:49:06";
    bBalance.money = @"10";
    bBalance.kPhaseType     = kBuyLottery;
    bBalance.kCommentType   = kPayedLottery;
    
    BookBalance *bBalance1 = [[[BookBalance alloc]init]autorelease];
    bBalance1.time  = @"2013-03-11 06:49:06";
    bBalance1.money = @"10";
    bBalance1.kPhaseType     = kBuyLottery;
    bBalance1.kCommentType   = kPayedLottery;
    
    BookBalance *bBalance2 = [[[BookBalance alloc]init]autorelease];
    bBalance2.time  = @"2013-03-11 06:49:06";
    bBalance2.money = @"10";
    bBalance2.kPhaseType     = kBuyLottery;
    bBalance2.kCommentType   = kPayedLottery;
    
    [bookBalanceArray addObject:bBalance];
    [bookBalanceArray addObject:bBalance1];
    [bookBalanceArray addObject:bBalance2];
    
    bookBalanceTab   = [[UITableView alloc]init];
    bookBalanceTab.delegate   = self;
    bookBalanceTab.dataSource = self;
    bookBalanceTab.frame      = CGRectMake(0, 45,
                                           320, MY_BOOL_BALANCE_TABLE_HEIGHT);
    [self.view addSubview:bookBalanceTab];
}

- (void)viewDidUnload
{
    bookBalanceTab.delegate   = nil;
    bookBalanceTab.dataSource = nil;
    bookBalanceTab = nil;
    [super viewDidUnload];
}

- (void) dealloc
{
    [bookBalanceArray removeAllObjects];
    [bookBalanceArray release];
    
    [bookBalanceTab release];
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
    return bookBalanceArray.count;
}

- (float) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *idString = @"idString";
    BookBalanceTableViewCell *cell = [[[BookBalanceTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idString]autorelease];
    
    
    BookBalance *bBalance = [bookBalanceArray objectAtIndex:indexPath.row];
    
    cell.timeLab.text = bBalance.time;
    cell.moneyLab.text      = [NSString stringWithFormat:@"%@元", bBalance.money];
    switch (bBalance.kPhaseType)
    {
        case kBuyLottery:   //购买彩票
        {
            cell.phaseTypeLab.text  = @"购买彩票";
            break;
        }   
        default:
            break;
    }
    
    switch (bBalance.kCommentType)
    {
        case kPayedLottery: //投注支付
        {
            cell.commentLab.text = @"投注支付";
            break;
        }
        case kRegistGive:   //注册赠送
        {
            cell.commentLab.text = @"注册赠送";
            break;
        }
        default:
            break;
    }
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
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
        [self releaseTimeDropDown];
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

- (void) doTimeBtnClicked:(id)sender
{
    NSArray * arr = [[NSArray alloc] init];
    arr = [NSArray arrayWithObjects:@"全部",@"一天",
                                    @"一周",@"一月",nil];
    if(timeDropDown == nil) 
    {
        CGFloat f = 200;
        timeDropDown = [[NIDropDown alloc]showDropDown:sender :&f :arr];
        timeDropDown.delegate = self;
    }
    else {
        [timeDropDown hideDropDown:sender];
        [self releaseTimeDropDown];
    }
}

- (void) releaseTimeDropDown
{
    [timeDropDown release];
    timeDropDown = nil;
}

- (void) releaseTypeDropDown
{
    [typeDropDown release];
    typeDropDown   = nil;
}
@end
