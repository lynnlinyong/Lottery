//
//  RechargeViewController.m
//  Lottery
//
//  Created by lynn on 13-3-24.
//
//

#import "RechargeViewController.h"

@interface RechargeViewController ()

@end

@implementation RechargeViewController
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
    self.title = [NSString stringWithFormat:@"充值-%@", user.name];
    
    UIBarButtonItem *commitBtn = [[UIBarButtonItem alloc]initWithTitle:@"充值"
                                                                 style:UIBarButtonItemStyleBordered
                                                                target:self
                                                                action:@selector(doCommitBtn:)];
    self.navigationItem.rightBarButtonItem = commitBtn;
    [commitBtn release];
    
    UILabel *moneyInfoLab = [[UILabel alloc]init];
    moneyInfoLab.text     = @"账户余额:";
    moneyInfoLab.frame    = CGRectMake(0, 30, 100, 20);
    moneyInfoLab.textAlignment = UITextAlignmentRight;
    [self.view addSubview:moneyInfoLab];
    [moneyInfoLab release];
    
    UILabel *moneyLab = [[UILabel alloc]init];
    moneyLab.text     = user.money;
    moneyLab.frame    = CGRectMake(110, 30, 200, 20);
    [self.view addSubview:moneyLab];
    [moneyLab release];
    
    UILabel *rechargInfoLab = [[UILabel alloc]init];
    rechargInfoLab.text     = @"充值金额:";
    rechargInfoLab.frame    = CGRectMake(0, 70, 100, 20);
    rechargInfoLab.textAlignment = UITextAlignmentRight;
    [self.view addSubview:rechargInfoLab];
    [rechargInfoLab release];
    
    UITextField *rechargeTxtFld = [[UITextField alloc]init];
    rechargeTxtFld.delegate     = self;
    rechargeTxtFld.frame        = CGRectMake(110, 65, 200, 30);
    rechargeTxtFld.borderStyle  = UITextBorderStyleLine;
    [self.view addSubview:rechargeTxtFld];
    [rechargeTxtFld release];
    
    moneyArray  = [[NSArray alloc]initWithObjects:@"10",@"20",@"30",
                                                  @"40",@"50",@"100",
                                                  @"200",@"300",@"100", nil];
    
    moneyPicker = [[UIPickerView alloc]init];
    moneyPicker.delegate   = self;
    moneyPicker.dataSource = self;
    moneyPicker.showsSelectionIndicator = YES;
    moneyPicker.frame      = CGRectMake(0, 420, 320, 215);
    [self.view addSubview:moneyPicker];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidUnload
{
    moneyPicker.delegate   = nil;
    moneyPicker.dataSource = nil;
    moneyPicker = nil;
    
    [super viewDidUnload];
}

- (void) dealloc
{
    [moneyPicker release];
    [moneyArray release];
    [super dealloc];
}

#pragma mark -
#pragma mark UIButton Clicked Action
- (void) doCommitBtn:(id)sender
{
    
}

#pragma mark -
#pragma mark UIPickerViewDelegate and UIPickerViewDatasource
- (int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (int) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return moneyArray.count;
}

- (NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [moneyArray objectAtIndex:row];
}

#pragma mark -
#pragma mark UITextFieldDelegate
- (void) textFieldDidBeginEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    [UIView animateWithDuration:0.3 animations:^{
        moneyPicker.frame = CGRectMake(0, 460-215, 320, 215);
    }];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [UIView animateWithDuration:0.3 animations:^{
        moneyPicker.frame = CGRectMake(0, 420, 320, 215);
    }];
}

@end
