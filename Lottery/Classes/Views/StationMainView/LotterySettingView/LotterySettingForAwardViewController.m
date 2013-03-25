//
//  LotterySettingForAwardViewController.m
//  Lottery
//
//  Created by lynn on 13-3-24.
//
//

#import "LotterySettingForAwardViewController.h"

@interface LotterySettingForAwardViewController ()

@end

@implementation LotterySettingForAwardViewController
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
    self.title = @"彩票详情";
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
