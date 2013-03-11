//
//  ExpectForecastViewController.m
//  Lottery
//
//  Created by lynn  lynn on 13-3-10.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//
#import "ExpectTableViewCell.h"
#import "ExpectForecastViewController.h"

@interface ExpectForecastViewController ()

@end

@implementation ExpectForecastViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem = [[[UITabBarItem alloc]initWithTitle:@"专家预测" 
                                                       image:[UIImage imageNamed:@"light"] 
                                                         tag:3]autorelease];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"专家预测";
    
    lotteryArray = [[NSMutableArray alloc]initWithObjects:@"大乐透",@"11选5",
                                                          @"11选3",@"七彩乐",
                                                          @"双色球",@"7位数", nil];
    
    expectTab = [[UITableView alloc]init];
    expectTab.delegate   = self;
    expectTab.dataSource = self;
    expectTab.frame = CGRectMake(0, 0, 320, 460-44-49);
    [self.view addSubview:expectTab];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    expectTab = nil;
    expectTab.delegate   = nil;
    expectTab.dataSource = nil; 
}

- (void) dealloc
{
    [super dealloc];
    [expectTab release];
    
    [lotteryArray removeAllObjects];
    [lotteryArray release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark UITbaleViewDelegate and UITableViewDatasource
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
    return 75;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *idString = @"idString";
    ExpectTableViewCell *cell = [[[ExpectTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idString]autorelease];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.nameLab.text   = [lotteryArray objectAtIndex:indexPath.row];
    cell.numberLab.text = @"01 20 30 02 13 15"; 
    return cell;
}
@end
