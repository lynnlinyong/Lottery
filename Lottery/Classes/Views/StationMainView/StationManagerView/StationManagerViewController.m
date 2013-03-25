//
//  StationManagerViewController.m
//  Lottery
//
//  Created by lynn on 13-3-23.
//
//
#import "AppDelegate.h"
#import "MyLotteryViewController.h"
#import "BookBalanceViewController.h"
#import "StationDetailViewController.h"
#import "StationManagerViewController.h"
@interface StationManagerViewController ()

@end

@implementation StationManagerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem = [[[UITabBarItem alloc]initWithTitle:@"本站管理"
                                                        image:[UIImage imageNamed:@"light"]
                                                          tag:3]autorelease];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"本站管理";
    
    funcTab = [[UITableView alloc]init];
    funcTab.delegate   = self;
    funcTab.dataSource = self;
    funcTab.frame      = CGRectMake(0, 30, 320, 200);
    funcTab.scrollEnabled = NO;
    [self.view addSubview:funcTab];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidUnload
{
    funcTab.delegate   = nil;
    funcTab.dataSource = nil;
    funcTab = nil;
    [super viewDidUnload];
}

- (void) dealloc
{
    [funcTab release];
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
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *idString = @"idString";
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                                  reuseIdentifier:idString];
    
    UILabel *txtLab = [[UILabel alloc]init];
    txtLab.frame    = CGRectMake(10, 12, 300, 20);
    txtLab.textAlignment = UITextAlignmentCenter;
    [cell addSubview:txtLab];
    
    switch (indexPath.row)
    {
        case 0:     //本站信息
        {
            txtLab.text = @"本站信息";
            break;
        }
        case 1:     //本站投注
        {
            txtLab.text = @"本站投注";
            break;
        }
        case 2:     //现金流水
        {
            txtLab.text = @"现金流水";
            break;
        }
        default:
            break;
    }
    [txtLab release];
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UINavigationController *nc = [AppDelegate getNavViewController];
    switch (indexPath.row)
    {
        case 0:   //本站信息
        {
            StationDetailViewController *sdViewCtr = [[StationDetailViewController alloc]init];
            [nc pushViewController:sdViewCtr animated:YES];
            [sdViewCtr release];
            break;
        }
        case 1:   //本站投注
        {
            MyLotteryViewController *mlVc = [[MyLotteryViewController alloc]init];
            mlVc.title = @"本站投注";
            [nc pushViewController:mlVc animated:YES];
            [mlVc release];
            break;
        }
        case 2:   //现金流水
        {
            BookBalanceViewController *bVc = [[BookBalanceViewController alloc]init];
            [nc pushViewController:bVc animated:YES];
            [bVc release];
            break;
        }
        default:
            break;
    }
}

@end
