//
//  HistoryLotteyViewController.m
//  Lottery
//
//  Created by lynn  lynn on 13-3-14.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//
#import "Lottery.h"
#import "HistoryLotteryTableViewCell.h"
#import "HistoryLotteyViewController.h"

@interface HistoryLotteyViewController ()

@end

@implementation HistoryLotteyViewController

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
    self.title = @"历史开奖";
    
    hLArray = [[NSMutableArray alloc]init];
    
    Lottery *lottery = [[Lottery alloc]init];
    lottery.name  = @"大乐透";
    lottery.phase = @"20130104期";
    lottery.time  = @"2013-01-15";
    lottery.currentNumber = @"01 02 03 04 05 06 07";
    [hLArray addObject:lottery];
    
    Lottery *lottery1 = [[Lottery alloc]init];
    lottery1.name  = @"大乐透";
    lottery1.phase = @"20130104期";
    lottery1.time  = @"2013-01-15";
    lottery1.currentNumber = @"01 02 03 04 05 06 07";
    [hLArray addObject:lottery1];
    
    Lottery *lottery2 = [[Lottery alloc]init];
    lottery2.name  = @"大乐透";
    lottery2.phase = @"20130104期";
    lottery2.time  = @"2013-01-15";
    lottery2.currentNumber = @"01 02 03 04 05 06 07";
    [hLArray addObject:lottery2];
    
    Lottery *lottery3 = [[Lottery alloc]init];
    lottery3.name  = @"大乐透";
    lottery3.phase = @"20130104期";
    lottery3.time  = @"2013-01-15";
    lottery3.currentNumber = @"01 02 03 04 05 06 07";
    [hLArray addObject:lottery3];
    
    Lottery *lottery4 = [[Lottery alloc]init];
    lottery4.name  = @"大乐透";
    lottery4.phase = @"20130104期";
    lottery4.time  = @"2013-01-15";
    lottery4.currentNumber = @"01 02 03 04 05 06 07";
    [hLArray addObject:lottery4];
    
    Lottery *lottery5 = [[Lottery alloc]init];
    lottery5.name  = @"大乐透";
    lottery5.phase = @"20130104期";
    lottery5.time  = @"2013-01-15";
    lottery5.currentNumber = @"01 02 03 04 05 06 07";
    [hLArray addObject:lottery5];
    
    Lottery *lottery6 = [[Lottery alloc]init];
    lottery6.name  = @"大乐透";
    lottery6.phase = @"20130104期";
    lottery6.time  = @"2013-01-15";
    lottery6.currentNumber = @"01 02 03 04 05 06 07";
    [hLArray addObject:lottery6];
}

- (void)viewDidUnload
{
    hLArray = nil;
    [super viewDidUnload];
}

- (void) dealloc
{
    [hLArray release];
    [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark UITableViewDelegate and UITableDatasource
- (int) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return hLArray.count;
}

- (float) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 460 / 7;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *idString = @"idString";
    HistoryLotteryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idString];
    if (!cell)
    {
        cell = [[HistoryLotteryTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault 
                                                 reuseIdentifier:idString];
        Lottery *lottery    = [hLArray objectAtIndex:indexPath.row];
        cell.nameLab.text   = lottery.name;
        cell.phaseLab.text  = lottery.phase;
        cell.timeLab.text   = lottery.time;
        cell.curNumberLab.text = lottery.currentNumber;
    }
    
    return cell;
}
@end
