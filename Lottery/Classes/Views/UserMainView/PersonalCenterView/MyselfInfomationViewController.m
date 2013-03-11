//
//  MyselfInfomationViewController.m
//  Lottery
//
//  Created by lynn  lynn on 13-3-11.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "MyselfInfomationViewController.h"

@interface MyselfInfomationViewController ()

@end

@implementation MyselfInfomationViewController

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
    self.title = @"个人信息";
    
    myselfInfoTab = [[UITableView alloc]init];
    myselfInfoTab.delegate   = self;
    myselfInfoTab.dataSource = self;
    myselfInfoTab.frame      = CGRectMake(0, 0, 320, 44 * 4);
    myselfInfoTab.scrollEnabled = NO;
    [self.view addSubview:myselfInfoTab];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    myselfInfoTab = nil;
    myselfInfoTab.delegate   = nil;
    myselfInfoTab.dataSource = nil;
}

- (void) dealloc
{
    [super dealloc];
    [myselfInfoTab release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark UITableViewDelegate and UITableViewDatasource
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
    switch (indexPath.row)
    {
        case 0:         //真实姓名
        {
            UITableViewCell *cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idString]autorelease];
            cell.selectionStyle   = UITableViewCellSelectionStyleNone;
            cell.textLabel.font   = [UIFont systemFontOfSize:18];
            cell.textLabel.text   = @"真实姓名:林勇";
            return cell;
            break;
        }
        case 1:         //身份证号
        {
            UITableViewCell *cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idString]autorelease];
            cell.selectionStyle   = UITableViewCellSelectionStyleNone;
            cell.textLabel.font   = [UIFont systemFontOfSize:18];
            cell.textLabel.text   = @"身份证号:123333";
            return cell;
            break;
        }
        case 2:         //手机号码
        {
            UITableViewCell *cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idString]autorelease];
            cell.selectionStyle   = UITableViewCellSelectionStyleNone;
            cell.textLabel.font   = [UIFont systemFontOfSize:18];
            cell.textLabel.text   = @"   手机号:18610674146";
            return cell;
            break;
        }
        case 3:         //账户余额
        {
            UITableViewCell *cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idString]autorelease];
            cell.selectionStyle   = UITableViewCellSelectionStyleNone;
            cell.textLabel.font   = [UIFont systemFontOfSize:18];
            cell.textLabel.text   = @"账户余额:100元";
            return cell;
            break;
        }
        default:
            break;
    }
    
    return nil;
}
@end
