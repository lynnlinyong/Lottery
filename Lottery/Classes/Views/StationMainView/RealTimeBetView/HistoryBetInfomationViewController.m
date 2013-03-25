//
//  HistoryBetInfomationViewController.m
//  Lottery
//
//  Created by lynn on 13-3-25.
//
//
#import <QuartzCore/QuartzCore.h>
#import "HistoryBetInfoTableCell.h"
#import "HistoryBetInfomationViewController.h"

@interface HistoryBetInfomationViewController ()

@end

@implementation HistoryBetInfomationViewController
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
    self.title = @"投注信息";
    
    UILabel *statusLab = [[UILabel alloc]init];
    statusLab.text  = @"状态:";
    statusLab.frame = CGRectMake(20, 10, 40, 20);
//    [self.view addSubview:statusLab];
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
    statusBtn.frame = CGRectMake(60, 7, 100, 30);
//    [self.view addSubview:statusBtn];
    
    searchBar = [[UISearchBar alloc]init];
    searchBar.delegate = self;
    searchBar.frame    = CGRectMake(0, 0, 320, 44);
    [self.view addSubview:searchBar];
    
    blArray   = [[NSMutableArray alloc]init];
    
    Lottery *lottery1   = [[Lottery alloc]init];
    lottery1.playName   = @"张三";
    lottery1.betAmounts = @"10";
    lottery1.times      = @"1";
    lottery1.money      = @"20";
    lottery1.betTime    = @"2013-01-02";
    lottery1.time       = @"2013-01-01";
    lottery1.projectArray = [NSMutableArray arrayWithObjects:@"0102030405060704", nil];
    [blArray addObject:lottery1];
    
    Lottery *lottery2   = [[Lottery alloc]init];
    lottery2.playName   = @"张三";
    lottery2.betAmounts = @"10";
    lottery2.times      = @"1";
    lottery2.money      = @"20";
    lottery2.betTime    = @"2013-01-02";
    lottery2.time       = @"2013-01-01";
    lottery2.projectArray = [NSMutableArray arrayWithObjects:@"0102030405060704", nil];
    [blArray addObject:lottery2];
    
    Lottery *lottery3   = [[Lottery alloc]init];
    lottery3.playName   = @"张三";
    lottery3.betAmounts = @"10";
    lottery3.times      = @"1";
    lottery3.money      = @"20";
    lottery3.betTime    = @"2013-01-02";
    lottery3.time       = @"2013-01-01";
    lottery3.projectArray = [NSMutableArray arrayWithObjects:@"0102030405060704", nil];
    [blArray addObject:lottery3];
    
    hbInfoTab = [[UITableView alloc]init];
    hbInfoTab.delegate   = self;
    hbInfoTab.dataSource = self;
    hbInfoTab.frame      = CGRectMake(0, 0, 320, 400);
    [self.view addSubview:hbInfoTab];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload
{
    searchBar.delegate = nil;
    
    hbInfoTab.delegate   = self;
    hbInfoTab.dataSource = self;
    hbInfoTab = nil;
    [super viewDidUnload];
}

- (void) dealloc
{
    [searchBar release];
    [hbInfoTab release];
    [super dealloc];
}

#pragma mark -
#pragma mark UITableViewDelegate and UITableViewDatasource
- (int) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return blArray.count;
}

- (float) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *idString = @"idString";
    HistoryBetInfoTableCell *cell = [tableView dequeueReusableCellWithIdentifier:idString];
    if (!cell)
    {
        cell = [[HistoryBetInfoTableCell alloc]initWithStyle:UITableViewCellStyleDefault
                                             reuseIdentifier:idString];
    }
    
    Lottery *bl = [blArray objectAtIndex:indexPath.row];
    cell.userNameLab.text = [NSString stringWithFormat:@"用户名:%@", bl.playName];
    cell.buyInfoLab.text  = [NSString stringWithFormat:@"注数:%@ 倍数:%@ 金额:%@",
                                                bl.betAmounts,bl.times,bl.money];
    cell.betTimeLab.text  = [NSString stringWithFormat:@"投注时间:%@", bl.betTime];
    cell.ptTickedLab.text = [NSString stringWithFormat:@"出票时间:%@", bl.time];
    cell.projLab.text     = [NSString stringWithFormat:@"投注方案:%@", [bl.projectArray objectAtIndex:0]];
    
    return cell;
}

#pragma mark-
#pragma mark NIDropDownDelegate
- (void) niDropDownDelegateMethod: (NIDropDown *) sender
{
    [self releaseStatusDropDown];
}

#pragma mark-
#pragma mark UIButton Clicked Action
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

@end
