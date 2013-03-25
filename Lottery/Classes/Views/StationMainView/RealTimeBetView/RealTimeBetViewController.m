//
//  RealTimeBetViewController.m
//  Lottery
//
//  Created by lynn on 13-3-23.
//
//
#import "Lottery.h"
#import "AppDelegate.h"
#import "RealTimeBetTableCell.h"
#import "RealTimeBetViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface RealTimeBetViewController ()

@end

@implementation RealTimeBetViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem = [[[UITabBarItem alloc]initWithTitle:@"实时投注"
                                                        image:[UIImage imageNamed:@"light"]
                                                          tag:0]autorelease];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"实时投注";
    
    UILabel *typeLab = [[UILabel alloc]init];
    typeLab.text     = @"类型:";
    typeLab.frame    = CGRectMake(5, 10, 40, 20);
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
    
    
    lotteryArray = [[NSMutableArray alloc]init];
    
    Lottery *lottery = [[Lottery alloc]init];
    lottery.playName = @"张三";
    lottery.name     = @"11选5";
    lottery.kLotteryStatus = kLotteryWin;
    lottery.projectArray = [NSMutableArray arrayWithObjects:@"01020304050607",
                                                            @"01020304050607", nil];
    [lotteryArray addObject:lottery];
    
    
    Lottery *lottery3 = [[Lottery alloc]init];
    lottery3.playName = @"张三";
    lottery3.name     = @"11选5";
    lottery3.kLotteryStatus = kLotteryLose;
    lottery3.projectArray = [NSMutableArray arrayWithObjects:@"01020304050607",
                                                             @"01020304050607", nil];
    [lotteryArray addObject:lottery3];
    
    Lottery *lottery1 = [[Lottery alloc]init];
    lottery1.playName = @"张三";
    lottery1.name     = @"11选5";
    lottery1.kLotteryStatus = kLotteryIsNotTicket;
    lottery1.projectArray = [NSMutableArray arrayWithObjects:@"01020304050607",
                                                             @"01020304050607", nil];
    [lotteryArray addObject:lottery1];
    
    Lottery *lottery2 = [[Lottery alloc]init];
    lottery2.playName = @"张三";
    lottery2.name     = @"11选5";
    lottery2.kLotteryStatus = kLotteryIsNotTicket;
    lottery2.projectArray = [NSMutableArray arrayWithObjects:@"01020304050607",
                                                             @"01020304050607", nil];
    [lotteryArray addObject:lottery2];
    
    lotteryTab = [[UITableView alloc]init];
    lotteryTab.delegate   = self;
    lotteryTab.dataSource = self;
    lotteryTab.frame      = CGRectMake(0, 60, 320, 270);
    [self.view addSubview:lotteryTab];    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidUnload
{
    lotteryTab.delegate   = nil;
    lotteryTab.dataSource = nil;
    lotteryTab = nil;
    [super viewDidUnload];
}

- (void) dealloc
{
    [lotteryTab release];
    
    [lotteryArray removeAllObjects];
    [lotteryArray release];
    [super dealloc];
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

- (void) doTickedBtnClicked:(id)sender
{
    delBtn = sender;
    
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示"
                                                       message:@"是否确认出票!"
                                                      delegate:self
                                             cancelButtonTitle:@"取消"
                                             otherButtonTitles:@"确认", nil];
    [alertView show];
    [alertView release];
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

#pragma mark -
#pragma mark UIAlertViewDelegate
- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)   //确认
    {
        //删除出票
        NSArray *visiblecells = [lotteryTab visibleCells];
        for(UITableViewCell *cell in visiblecells)
        {
            if(cell.tag == delBtn.tag)
            {
                [lotteryArray removeObjectAtIndex:[cell tag]];
                [lotteryTab   reloadData];
                break;
            }    
        }
    }
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
    return 95;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *idString = @"idString";
    RealTimeBetTableCell  *cell = [tableView dequeueReusableCellWithIdentifier:idString];
    if (!cell)
    {
        cell = [[RealTimeBetTableCell alloc]initWithStyle:UITableViewCellStyleDefault
                                          reuseIdentifier:idString];
    }
    
    Lottery *lottery  = [lotteryArray objectAtIndex:indexPath.row];
    cell.nameLab.text = lottery.playName;
    cell.typeLab.text = lottery.name;
    cell.proj1Lab.text = [NSString stringWithFormat:@"%@  10注", [lottery.projectArray objectAtIndex:0]];
    cell.proj2Lab.text = [NSString stringWithFormat:@"%@  20注", [lottery.projectArray objectAtIndex:1]];
    switch (lottery.kLotteryStatus)
    {
        case kLotteryIsNotTicket:  //未出票
        {
            cell.stateBtn.hidden = NO;
            cell.stateBtn.tag    = indexPath.row;
            cell.tag             = indexPath.row;
            [cell.stateBtn addTarget:self
                              action:@selector(doTickedBtnClicked:)
                    forControlEvents:UIControlEventTouchUpInside];
            break;
        }
        case kLotteryWin:          //已出票
        {
            cell.stateLab.text   = @"已出票";
            cell.stateLab.hidden = NO;
            break;
        }
        case kLotteryLose:         //未出票
        {
            cell.stateLab.text   = @"未出票";
            cell.stateLab.hidden = NO;
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

- (UITableViewCellEditingStyle) tableView:(UITableView *)tableView
            editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [lotteryArray removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                     withRowAnimation:UITableViewRowAnimationTop];
}
@end
