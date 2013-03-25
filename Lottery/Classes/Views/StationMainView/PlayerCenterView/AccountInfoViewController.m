//
//  AccountInfoViewController.m
//  Lottery
//
//  Created by lynn on 13-3-24.
//
//
#import "RechargeViewController.h"
#import "MyLotteryViewController.h"
#import "BookBalanceViewController.h"
#import "AccountInfoViewController.h"
#import "CreateAcountViewController.h"

@interface AccountInfoViewController ()

@end

@implementation AccountInfoViewController
@synthesize user;

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
    
    self.title    = user.name;
    
    accountInfTab = [[UITableView alloc]init];
    accountInfTab.delegate   = self;
    accountInfTab.dataSource = self;
    accountInfTab.frame      = CGRectMake(0, 0, 320, 320);
    [self.view addSubview:accountInfTab];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void) viewDidUnload
{
    accountInfTab.delegate   = nil;
    accountInfTab.dataSource = nil;
    accountInfTab = nil;
    [super viewDidUnload];
}

- (void) dealloc
{
    [accountInfTab release];
    [super dealloc];
}

#pragma mark -
#pragma mark UITableDelegate and UITableDatasource
- (int) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *idString = @"idString";
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                                  reuseIdentifier:idString];
    
    UILabel *infoLab = [[UILabel alloc]init];
    infoLab.textAlignment = UITextAlignmentCenter;
    infoLab.frame    = CGRectMake(10, 12, 300, 20);
    [cell addSubview:infoLab];
    switch (indexPath.row)
    {
        case 0:
        {
            infoLab.text = @"个人资料";
            break;
        }
        case 1:
        {
            infoLab.text = @"投注记录";
            break;
        }
        case 2:
        {
            infoLab.text = @"现金流水";
            break;
        }
        case 3:
        {
            infoLab.text = @"充值";
            break;
        }
        default:
            break;
    }
    [infoLab release];
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row)
    {
        case 0:
        {
            CreateAcountViewController *caVc = [[CreateAcountViewController alloc]init];
            caVc.user       = user;
            caVc.viewAction = kShowView;
            [self.navigationController pushViewController:caVc animated:YES];
            [caVc release];
            break;
        }
        case 1:
        {
            MyLotteryViewController *mlVc = [[MyLotteryViewController alloc]init];
            mlVc.title = [NSString stringWithFormat:@"%@-投注信息", user.name];
            [self.navigationController pushViewController:mlVc animated:YES];
            [mlVc release];
            break;
        }
        case 2:
        {
            BookBalanceViewController *cdVc = [[BookBalanceViewController alloc]init];
            cdVc.title = [NSString stringWithFormat:@"%@-账户流水", user.name];
            [self.navigationController pushViewController:cdVc
                                                 animated:YES];
            [cdVc release];
            break;
        }
        case 3:
        {
            RechargeViewController *rgVc = [[RechargeViewController alloc]init];
            rgVc.user       = user;
            [self.navigationController pushViewController:rgVc
                                                 animated:YES];
            [rgVc release];
            break;
        }
        default:
            break;
    }
}
@end
