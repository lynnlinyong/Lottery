//
//  LotterySettingViewController.m
//  Lottery
//
//  Created by lynn on 13-3-23.
//
//
#import "AppDelegate.h"
#import "LetteryTableViewCell.h"
#import "LotterySettingViewController.h"
#import "LotterySettingForAwardViewController.h"

#define LOTTERY_TABLE_HEIGHT        400

@interface LotterySettingViewController ()

@end

@implementation LotterySettingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem = [[[UITabBarItem alloc]initWithTitle:@"彩票设定"
                                                        image:[UIImage imageNamed:@"light"]
                                                          tag:1]autorelease];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"彩票设定";
    
    lotteryArray = [[NSMutableArray alloc]initWithObjects:@"大乐透",@"7位数",@"11选5", @"双色球",nil];
    lotteryTab   = [[UITableView alloc]init];
    lotteryTab.delegate   = self;
    lotteryTab.dataSource = self;
    lotteryTab.frame      = CGRectMake(0, 0, 320, LOTTERY_TABLE_HEIGHT);
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
    return LOTTERY_TABLE_HEIGHT/4;
}

- (UITableViewCell *) tableView:(UITableView *)tableView
          cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *idString = @"idString";
    LetteryTableViewCell *cell = [[[LetteryTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                                             reuseIdentifier:idString]autorelease];
    cell.nameLab.text = [lotteryArray objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UINavigationController *navCtr = [AppDelegate getNavViewController];
    LotterySettingForAwardViewController *lsVc = [[LotterySettingForAwardViewController alloc]init];
    [navCtr pushViewController:lsVc animated:YES];
    [lsVc release];
}

@end
