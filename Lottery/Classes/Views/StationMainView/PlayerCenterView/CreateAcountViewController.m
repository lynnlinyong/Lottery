//
//  CreateAcountViewController.m
//  Lottery
//
//  Created by lynn on 13-3-24.
//
//

#import "CreateAcountViewController.h"

@interface CreateAcountViewController ()

@end

@implementation CreateAcountViewController
@synthesize user;
@synthesize viewAction;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"开户";
    
    UIBarButtonItem *rightBarBtn = [[UIBarButtonItem alloc]initWithTitle:@"提交"
                                                                   style:UIBarButtonItemStyleBordered
                                                                  target:self
                                                                  action:@selector(doCommitClicked:)];
    self.navigationItem.rightBarButtonItem = rightBarBtn;

    txtFldArray = [[NSMutableArray alloc]init];
    nameTxtFld      = [[UITextField alloc]init];
    idNumberTxtFld  = [[UITextField alloc]init];
    telNumberTxtFld = [[UITextField alloc]init];
    userNameTxtFld  = [[UITextField alloc]init];
    pwdTxtFld       = [[UITextField alloc]init];
    
    if (viewAction == kShowView)
    {
        nameTxtFld.text      = user.name;
        idNumberTxtFld.text  = user.idNumber;
        telNumberTxtFld.text = user.telNumber;
        userNameTxtFld.text  = user.userName;
        
        UILabel *moneyLab    = [[UILabel alloc]init];
        UILabel *regTimeLab  = [[UILabel alloc]init];
        [txtFldArray addObject:moneyLab];
        [txtFldArray addObject:regTimeLab];
    }

    [txtFldArray addObject:nameTxtFld];
    [txtFldArray addObject:idNumberTxtFld];
    [txtFldArray addObject:telNumberTxtFld];
    [txtFldArray addObject:userNameTxtFld];
    [txtFldArray addObject:pwdTxtFld];
    
    accountTab = [[UITableView alloc]init];
    accountTab.delegate   = self;
    accountTab.dataSource = self;
    accountTab.scrollEnabled = NO;
    accountTab.frame = CGRectMake(0, 0, 320, 400);
    [self.view addSubview:accountTab];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void) viewDidUnload
{
    accountTab.delegate   = nil;
    accountTab.dataSource = nil;
    accountTab = nil;

    [super viewDidUnload];
}

- (void) dealloc
{
    [accountTab release];
    
    [nameTxtFld         release];
    [pwdTxtFld          release];
    [idNumberTxtFld     release];
    [telNumberTxtFld    release];
    [userNameTxtFld     release];
    [super dealloc];
}

#pragma mark -
#pragma mark UIButton Clicked Action
- (void) doCommitClicked:(id)sender
{
    if (nameTxtFld.text.length == 0      ||
        idNumberTxtFld.text.length == 0  ||
        telNumberTxtFld.text.length == 0 ||
        userNameTxtFld.text.length == 0  ||
        pwdTxtFld.text.length == 0)
    {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示"
                                                           message:@"用户信息不能为空!"
                                                          delegate:self
                                                 cancelButtonTitle:nil
                                                 otherButtonTitles:@"确定", nil];
        alertView.tag = 0;
        [alertView show];
        [alertView release];
        return;
    }
    
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示"
                                                       message:@"开户成功"
                                                      delegate:self
                                             cancelButtonTitle:nil
                                             otherButtonTitles:@"确定", nil];
    alertView.tag = 1;
    [alertView show];
    [alertView release];
}

#pragma mark -
#pragma mark UIAlertViewDelegate
- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 1)
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

#pragma mark -
#pragma mark UITableViewDelegate and UITableDatasource 
- (int)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (viewAction == kShowView)
    {
        return 7;
    }
    else
    {
        return 5;
    }
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *idString = @"idString";
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                                  reuseIdentifier:idString];
    cell.selectionStyle   = UITableViewCellSelectionStyleNone;
    
    UILabel *playLab = [[UILabel alloc]init];
    playLab.frame = CGRectMake(10, 12, 100, 20);
    playLab.textAlignment = UITextAlignmentRight;
    [cell addSubview:playLab];
    [playLab release];
    
    if (viewAction == kShowView)
    {
        switch (indexPath.row)
        {
            case 0:
            {
                playLab.text = @"注册时间:";
                
                UILabel *regTimeLab = [txtFldArray objectAtIndex:0];
                regTimeLab.text     = user.regTime;
                regTimeLab.frame    = CGRectMake(120, 12, 200, 20);
                [cell addSubview:regTimeLab];
                [regTimeLab release];
                break;
            }
            case 1:
            {
                playLab.text = @"账户余额:";
                
                UILabel *moneyLab = [txtFldArray objectAtIndex:1];
                moneyLab.text     = user.money;
                moneyLab.frame    = CGRectMake(120, 12, 200, 20);
                [cell addSubview:moneyLab];
                [moneyLab release];
                break;
            }
            case 2:
            {
                UITextField *txtFld = [txtFldArray objectAtIndex:indexPath.row];
                txtFld.delegate = self;
                txtFld.frame    = CGRectMake(120, 7, 180, 30);
                txtFld.borderStyle = UITextBorderStyleLine;
                [cell addSubview:txtFld];
                txtFld.text  = user.name;
                playLab.text = @"真实姓名:";
                break;
            }
            case 3:
            {
                UITextField *txtFld = [txtFldArray objectAtIndex:indexPath.row];
                txtFld.delegate = self;
                txtFld.frame    = CGRectMake(120, 7, 180, 30);
                txtFld.borderStyle = UITextBorderStyleLine;
                [cell addSubview:txtFld];
                txtFld.text  = user.idNumber;
                playLab.text = @"身份证号:";
                break;
            }
            case 4:
            {
                UITextField *txtFld = [txtFldArray objectAtIndex:indexPath.row];
                txtFld.delegate = self;
                txtFld.frame    = CGRectMake(120, 7, 180, 30);
                txtFld.borderStyle = UITextBorderStyleLine;
                [cell addSubview:txtFld];
                txtFld.text  = user.telNumber;
                playLab.text = @"手机号码:";
                break;
            }
            case 5:
            {
                UITextField *txtFld = [txtFldArray objectAtIndex:indexPath.row];
                txtFld.delegate = self;
                txtFld.frame    = CGRectMake(120, 7, 180, 30);
                txtFld.borderStyle = UITextBorderStyleLine;
                [cell addSubview:txtFld];
                txtFld.text  = user.userName;
                playLab.text = @"用户名:";
                break;
            }
            case 6:
            {
                UITextField *txtFld = [txtFldArray objectAtIndex:indexPath.row];
                txtFld.delegate = self;
                txtFld.frame    = CGRectMake(120, 7, 180, 30);
                txtFld.borderStyle = UITextBorderStyleLine;
                [cell addSubview:txtFld];
                
                playLab.text = @"密码:";
                break;
            }
            default:
                break;
        }
    }
    else
    {
        switch (indexPath.row)
        {
            case 0:
            {
                playLab.text = @"真实姓名:";
                break;
            }
            case 1:
            {
                playLab.text = @"身份证号:";
                break;
            }
            case 2:
            {
                playLab.text = @"手机号码:";
                break;
            }
            case 3:
            {
                playLab.text = @"用户名:";
                break;
            }
            case 4:
            {
                playLab.text = @"密码:";
                break;
            }
            default:
                break;
        }
        
        UITextField *txtFld = [txtFldArray objectAtIndex:indexPath.row];
        txtFld.delegate = self;
        txtFld.frame    = CGRectMake(120, 7, 180, 30);
        txtFld.borderStyle = UITextBorderStyleLine;
        [cell addSubview:txtFld];
    }
    
    return cell;
}

#pragma mark -
#pragma mark UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

@end
