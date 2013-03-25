//
//  StationDetailViewController.m
//  Lottery
//
//  Created by lynn on 13-3-24.
//
//
#import "User.h"
#import "StationDetailViewController.h"

@interface StationDetailViewController ()

@end

@implementation StationDetailViewController

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
    
    manager = [[User alloc]init];
    manager.name     = @"张三";
    manager.idNumber = @"1234456677886543332";
    manager.telNumber= @"12344567881";
    manager.money    = @"100";
    manager.lplayerCount = @"200";
    manager.regTime  = @"2012-12-12";
    
    self.title = manager.name;
    
    managerTab = [[UITableView alloc]init];
    managerTab.delegate   = self;
    managerTab.dataSource = self;
    managerTab.frame      = CGRectMake(0, 0, 320, 460);
    managerTab.scrollEnabled = NO;
    [self.view addSubview:managerTab];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload
{
    managerTab.delegate   = nil;
    managerTab.dataSource = nil;
    managerTab = nil;
    [super viewDidUnload];
}

- (void)dealloc
{
    [manager release];
    [managerTab release];
    [super dealloc];
}

#pragma mark -
#pragma mark UITableViwDelegate and UITableDatasource
- (int) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *idString = @"idString";
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idString];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    switch (indexPath.row)
    {
        case 0:
        {
            UILabel *regTimeLab = [[UILabel alloc]init];
            regTimeLab.text  = @"注册时间:";
            regTimeLab.frame = CGRectMake(10, 12, 100, 20);
            regTimeLab.textAlignment = UITextAlignmentRight;
            [cell addSubview:regTimeLab];
            [regTimeLab release];
            
            UILabel *dataLab = [[UILabel alloc]init];
            dataLab.text     = manager.regTime;
            dataLab.frame    = CGRectMake(120, 12, 180, 20);
            [cell addSubview:dataLab];
            [dataLab release];
            break;
        }
        case 1:
        {
            UILabel *nameLab = [[UILabel alloc]init];
            nameLab.text  = @"持有人姓名:";
            nameLab.frame = CGRectMake(10, 12, 100, 20);
            nameLab.textAlignment = UITextAlignmentRight;
            [cell addSubview:nameLab];
            [nameLab release];
            
            UILabel *dataLab = [[UILabel alloc]init];
            dataLab.text     = manager.name;
            dataLab.frame    = CGRectMake(120, 12, 180, 20);
            [cell addSubview:dataLab];
            [dataLab release];
            break;
        }
        case 2:
        {
            UILabel *idNumLab = [[UILabel alloc]init];
            idNumLab.text  = @"身份证号:";
            idNumLab.frame = CGRectMake(10, 12, 100, 20);
            idNumLab.textAlignment = UITextAlignmentRight;
            [cell addSubview:idNumLab];
            [idNumLab release];
            
            UILabel *dataLab = [[UILabel alloc]init];
            dataLab.text     = manager.idNumber;
            dataLab.frame    = CGRectMake(120, 12, 180, 20);
            [cell addSubview:dataLab];
            [dataLab release];
            break;
        }
        case 3:
        {
            UILabel *telLab = [[UILabel alloc]init];
            telLab.text  = @"手机号码:";
            telLab.frame = CGRectMake(10, 12, 100, 20);
            telLab.textAlignment = UITextAlignmentRight;
            [cell addSubview:telLab];
            [telLab release];
            
            UILabel *dataLab = [[UILabel alloc]init];
            dataLab.text     = manager.telNumber;
            dataLab.frame    = CGRectMake(120, 12, 180, 20);
            [cell addSubview:dataLab];
            [dataLab release];
            break;
        }
        case 4:
        {
            UILabel *moneyLab = [[UILabel alloc]init];
            moneyLab.text  = @"账户余额:";
            moneyLab.frame = CGRectMake(10, 12, 100, 20);
            moneyLab.textAlignment = UITextAlignmentRight;
            [cell addSubview:moneyLab];
            [moneyLab release];
            
            UILabel *dataLab = [[UILabel alloc]init];
            dataLab.text     = manager.money;
            dataLab.frame    = CGRectMake(120, 12, 180, 20);
            [cell addSubview:dataLab];
            [dataLab release];
            
            break;
        }
        case 5:
        {
            UILabel *playLab = [[UILabel alloc]init];
            playLab.text  = @"彩民数量:";
            playLab.frame = CGRectMake(10, 12, 100, 20);
            playLab.textAlignment = UITextAlignmentRight;
            [cell addSubview:playLab];
            [playLab release];
            
            UILabel *dataLab = [[UILabel alloc]init];
            dataLab.text     = manager.lplayerCount;
            dataLab.frame    = CGRectMake(120, 12, 180, 20);
            [cell addSubview:dataLab];
            [dataLab release];
            break;
        }
        default:
            break;
    }
    return cell;
}
@end
