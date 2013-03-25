//
//  HistoryBetViewController.m
//  Lottery
//
//  Created by lynn on 13-3-24.
//
//
#import "Lottery.h"
#import "HistoryBetTableCell.h"
#import "HistoryBetViewController.h"
#import "HistoryBetDetailViewController.h"

@interface HistoryBetViewController ()

@end

@implementation HistoryBetViewController

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
    self.title = @"历史投注";
    
    lotteryArray = [[NSMutableArray alloc]init];
    
    Lottery *lottery = [[Lottery alloc]init];
    lottery.name     = @"大乐透";
    [lotteryArray addObject:lottery];
    
    Lottery *lottery1 = [[Lottery alloc]init];
    lottery1.name     = @"大乐透";
    [lotteryArray addObject:lottery1];
    
    Lottery *lottery2 = [[Lottery alloc]init];
    lottery2.name     = @"大乐透";
    [lotteryArray addObject:lottery2];
    
    Lottery *lottery3 = [[Lottery alloc]init];
    lottery3.name     = @"大乐透";
    [lotteryArray addObject:lottery3];
    
    Lottery *lottery4 = [[Lottery alloc]init];
    lottery4.name     = @"大乐透";
    [lotteryArray addObject:lottery4];
    
    lotteryTab = [[UITableView alloc]init];
    lotteryTab.delegate   = self;
    lotteryTab.dataSource = self;
    lotteryTab.frame      = CGRectMake(0, 0, 320, 400);
    [self.view addSubview:lotteryTab];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    return 65;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *idString = @"idString";
    HistoryBetTableCell *cell = [tableView dequeueReusableCellWithIdentifier:idString];
    if (!cell)
    {
        cell = [[HistoryBetTableCell alloc]initWithStyle:UITableViewCellStyleDefault
                                         reuseIdentifier:idString];
    }
    
    Lottery *lottery    = [lotteryArray objectAtIndex:indexPath.row];
    cell.nameLab.text   = lottery.name;
    cell.phaseLab.text  = @"20120304期至20130405期";
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Lottery *lottery = [lotteryArray objectAtIndex:indexPath.row];
    
    HistoryBetDetailViewController *hbVc = [[HistoryBetDetailViewController alloc]init];
    hbVc.lottery = lottery;
    [self.navigationController pushViewController:hbVc
                                         animated:YES];
    [hbVc release];
}

@end
