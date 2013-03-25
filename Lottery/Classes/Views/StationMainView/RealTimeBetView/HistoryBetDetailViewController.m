//
//  HistoryBetDetailViewController.m
//  Lottery
//
//  Created by lynn on 13-3-25.
//
//

#import "HistoryBetDetailViewController.h"
#import "HistoryBetInfomationViewController.h"

@interface HistoryBetDetailViewController ()

@end

@implementation HistoryBetDetailViewController
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
    self.title = [NSString stringWithFormat:@"%@-投注历史", lottery.name];
    
    searchBar = [[UISearchBar alloc]init];
    searchBar.delegate = self;
    searchBar.frame    = CGRectMake(0, 0, 320, 44);
    [self.view addSubview:searchBar];
    
    lotteryArray = [[NSMutableArray alloc]init];
    
    Lottery *lottery1  = [[Lottery alloc]init];
    lottery1.name      = @"大乐透";
    lottery1.phase     = @"2010322";
    lottery1.startTime = @"2012-04-15";
    [lotteryArray addObject:lottery1];
    
    Lottery *lottery2  = [[Lottery alloc]init];
    lottery2.name      = @"大乐透";
    lottery2.phase     = @"2010322";
    lottery2.startTime = @"2012-04-15";
    [lotteryArray addObject:lottery2];
    
    Lottery *lottery3  = [[Lottery alloc]init];
    lottery3.name      = @"大乐透";
    lottery3.phase     = @"2010322";
    lottery3.startTime = @"2012-04-15";
    [lotteryArray addObject:lottery3];
    
    Lottery *lottery4  = [[Lottery alloc]init];
    lottery4.name      = @"大乐透";
    lottery4.phase     = @"2010322";
    lottery4.startTime = @"2012-04-15";
    [lotteryArray addObject:lottery4];
    
    Lottery *lottery5  = [[Lottery alloc]init];
    lottery5.name      = @"大乐透";
    lottery5.phase     = @"2010322";
    lottery5.startTime = @"2012-04-15";
    [lotteryArray addObject:lottery5];
    
    hlTab = [[UITableView alloc]init];
    hlTab.delegate   = self;
    hlTab.dataSource = self;
    hlTab.frame      = CGRectMake(0, 50, 320, 350);
    [self.view addSubview:hlTab];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidUnload
{
    searchBar.delegate = nil;
    searchBar = nil;
    
    hlTab.delegate   = nil;
    hlTab.dataSource = nil;
    hlTab = nil;
    
    [super viewDidUnload];
}

- (void) dealloc
{
    [hlTab      release];
    [searchBar  release];
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
    return lotteryArray.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *idString = @"idString";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idString];
    
    Lottery *tl = [lotteryArray objectAtIndex:indexPath.row];
    if (!cell)
    {
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                     reuseIdentifier:idString]autorelease];
        
        UILabel *contentLab = [[UILabel alloc]init];
        contentLab.text     = [NSString stringWithFormat:@"%@ %@期 %@",
                                            tl.name, tl.phase,tl.startTime];
        contentLab.frame    = CGRectMake(0, 12, 320, 20);
        contentLab.textAlignment = UITextAlignmentCenter;
        [cell addSubview:contentLab];
        [contentLab release];
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Lottery *lottery = [lotteryArray objectAtIndex:indexPath.row];
    HistoryBetInfomationViewController *hbInfoVc = [[HistoryBetInfomationViewController alloc]init];
    hbInfoVc.lottery = lottery;
    [self.navigationController pushViewController:hbInfoVc
                                         animated:YES];
    [hbInfoVc release];
}

@end
