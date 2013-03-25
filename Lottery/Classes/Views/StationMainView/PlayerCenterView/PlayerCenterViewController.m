//
//  PlayerCenterViewController.m
//  Lottery
//
//  Created by lynn on 13-3-23.
//
//
#import "User.h"
#import "AppDelegate.h"
#import "AccountInfoViewController.h"
#import "PlayerCenterViewController.h"

#define TABLE_HEIGHT   (400-44-49)

@interface PlayerCenterViewController ()

@end

@implementation PlayerCenterViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem = [[[UITabBarItem alloc]initWithTitle:@"彩民中心"
                                                        image:[UIImage imageNamed:@"light"]
                                                          tag:2]autorelease];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"彩民中心";
    
    searchBar = [[UISearchBar alloc]init];
    searchBar.delegate = self;
    searchBar.frame    = CGRectMake(0, 0, 320, 44);
    [self.view addSubview:searchBar];
    
    accountArray = [[NSMutableArray alloc]init];
    
    User *user = [[User alloc]init];
    user.name  = @"张三";
    user.idNumber  = @"11111111111111111111111";
    user.telNumber = @"123445678901";
    user.money     = @"100";
    user.regTime   = @"2013-10-10";
    user.userName  = @"Lynn";
    [accountArray addObject:user];
    
    User *user1 = [[User alloc]init];
    user1.name  = @"张三";
    user1.idNumber  = @"11111111111111111111111";
    user1.telNumber = @"123445678901";
    user1.money     = @"100";
    user1.regTime   = @"2013-10-10";
    user1.userName  = @"Lynn";
    [accountArray addObject:user1];
    
    User *user2 = [[User alloc]init];
    user2.name  = @"张三";
    user2.idNumber  = @"11111111111111111111111";
    user2.telNumber = @"123445678901";
    user2.money     = @"100";
    user2.regTime   = @"2013-10-10";
    user2.userName  = @"Lynn";
    [accountArray addObject:user2];
    
    User *user3 = [[User alloc]init];
    user3.name  = @"张三";
    user3.idNumber  = @"11111111111111111111111";
    user3.telNumber = @"123445678901";
    user3.money     = @"100";
    user3.regTime   = @"2013-10-10";
    user3.userName  = @"Lynn";
    [accountArray addObject:user3];
    
    User *user4 = [[User alloc]init];
    user4.name  = @"张三";
    user4.idNumber  = @"11111111111111111111111";
    user4.telNumber = @"123445678901";
    user4.money     = @"100";
    user4.regTime   = @"2013-10-10";
    user4.userName  = @"Lynn";
    [accountArray addObject:user4];
    
    accountTab = [[UITableView alloc]init];
    accountTab.delegate   = self;
    accountTab.dataSource = self;
    accountTab.frame      = CGRectMake(0, 50, 320, TABLE_HEIGHT);
    [self.view addSubview:accountTab];
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
    
    accountTab.delegate   = nil;
    accountTab.dataSource = nil;
    accountTab = nil;
    
    [super viewDidUnload];
}

- (void) dealloc
{
    [searchBar  release];
    [accountTab release];
    [super dealloc];
}

#pragma mark -
#pragma mark UISearchBarDelegate
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    CLog(@"%@", searchText);
}

#pragma mark -
#pragma mark UITableViewDelegate and UITableDatasource
- (int) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return accountArray.count;
}

- (float) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return TABLE_HEIGHT/5;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *idString    = @"idString";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idString];
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                     reuseIdentifier:idString];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    User *user = [accountArray objectAtIndex:indexPath.row];
    
    UILabel *userNameLab = [[UILabel alloc]init];
    userNameLab.text  = [NSString stringWithFormat:@"用户名:%@", user.userName];
    userNameLab.frame = CGRectMake(10, 10, 320, 20);
    userNameLab.textAlignment = UITextAlignmentLeft;
    [cell addSubview:userNameLab];
    [userNameLab release];
    
    UILabel *regTimeLab = [[UILabel alloc]init];
    regTimeLab.text     = [NSString stringWithFormat:@"注册时间:%@", user.regTime];
    regTimeLab.textAlignment = UITextAlignmentLeft;
    regTimeLab.frame    = CGRectMake(10, 35, 320, 20);
    [cell addSubview:regTimeLab];
    [regTimeLab release];
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UINavigationController *nc     = [AppDelegate getNavViewController];
    AccountInfoViewController *aiVc = [[AccountInfoViewController alloc]init];
    User *user = [accountArray objectAtIndex:indexPath.row];
    aiVc.user  = user;
    [nc pushViewController:aiVc animated:YES];
    [aiVc release];
}
@end
