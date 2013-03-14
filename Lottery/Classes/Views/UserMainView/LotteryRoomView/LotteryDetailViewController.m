//
//  LotteryDetailViewController.m
//  Lottery
//
//  Created by lynn  lynn on 13-3-14.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "LotteryDetailViewController.h"
#import "HistoryLotteyViewController.h"

@interface LotteryDetailViewController ()

@end

@implementation LotteryDetailViewController
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
    self.title = @"中奖信息";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"历史开奖"
                                                                             style:UIBarButtonItemStyleBordered
                                                                            target:self 
                                                                            action:@selector(doHistoryLotteryBtnClicked:)];
    
    UILabel *nameLab = [[UILabel alloc]init];
    nameLab.font     = [UIFont fontWithName:@"Helvetica-Bold"
                                       size:18];
    nameLab.text     = lottery.name;
    nameLab.frame    = CGRectMake(0, 0, 320, 20);
    [self.view addSubview:nameLab];
    [nameLab release];
    
    UILabel *timeLab  = [[UILabel alloc]init];
    timeLab.text      = [NSString stringWithFormat:@"开奖日期:%@", lottery.time];
    timeLab.font      = [UIFont systemFontOfSize:14];
    timeLab.frame     = CGRectMake(0, 20, 160, 20);
    [self.view addSubview:timeLab];
    [timeLab release];
    
    UILabel *phaseLab = [[UILabel alloc]init];
    phaseLab.text     = [NSString stringWithFormat:@"第%@", lottery.phase];
    phaseLab.font     = [UIFont systemFontOfSize:14];
    phaseLab.frame    = CGRectMake(160, 20, 160, 20);
    [self.view addSubview:phaseLab];
    [phaseLab release];
    
    UILabel *curNumberLab = [[UILabel alloc]init];
    curNumberLab.text     = lottery.currentNumber;
    curNumberLab.frame    = CGRectMake(0, 40, 320, 20);
    curNumberLab.textAlignment = UITextAlignmentCenter;
    [self.view addSubview:curNumberLab];
    [curNumberLab release];
    
    /**
     * 创建二维表
     **/
}

- (void)viewDidUnload
{
    lottery  = nil;
    [super viewDidUnload];
}

- (void) dealloc
{
    [lottery release];
    [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark UIButton Clicked Action
- (void) doHistoryLotteryBtnClicked:(id)sender
{
    UINavigationController *navCtr = [UserMainViewController getNavViewController];
    HistoryLotteyViewController *hLViewCtr = [[HistoryLotteyViewController alloc]init];
    [navCtr pushViewController:hLViewCtr animated:YES];
    [hLViewCtr release];
}


@end
