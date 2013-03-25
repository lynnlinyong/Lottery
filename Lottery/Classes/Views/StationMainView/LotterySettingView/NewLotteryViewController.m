//
//  NewLotteryViewController.m
//  Lottery
//
//  Created by lynn on 13-3-24.
//
//

#import "NewLotteryViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface NewLotteryViewController ()

@end

@implementation NewLotteryViewController

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
    
    self.title = @"彩票开售";
    
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]initWithTitle:@"提交"
                                                                style:UIBarButtonItemStyleBordered
                                                               target:self
                                                               action:@selector(doCommitClicked:)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    [rightBtn release];
    
    UILabel *typeLab = [[UILabel alloc]init];
    typeLab.text  = @"彩种:";
    typeLab.frame = CGRectMake(30, 10, 40, 20);
    typeLab.textAlignment = UITextAlignmentRight;
    [self.view addSubview:typeLab];
    [typeLab release];
    
    typeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    typeBtn.layer.borderWidth  = 1;
    typeBtn.layer.borderColor  = [[UIColor blackColor] CGColor];
    typeBtn.layer.cornerRadius = 5;
    [typeBtn setTitle:@"全部"
             forState:UIControlStateNormal];
    [typeBtn setTitleColor:[UIColor blackColor]
                  forState:UIControlStateNormal];
    [typeBtn addTarget:self
                action:@selector(doTypeSelectBtnClicked:)
      forControlEvents:UIControlEventTouchUpInside];
    typeBtn.frame = CGRectMake(80, 7, 80, 20);
    [self.view addSubview:typeBtn];
    
    UILabel *playLab = [[UILabel alloc]init];
    playLab.text     = @"玩法:";
    playLab.frame    = CGRectMake(30, 40, 40, 20);
    playLab.textAlignment = UITextAlignmentRight;
    [self.view addSubview:playLab];
    [playLab release];
    
    cbv1 = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(80, 30, 100, 20)
                                          style:kSSCheckBoxViewStyleGreen
                                        checked:NO];
    [cbv1 setText:@"玩法一"];
    [self.view addSubview:cbv1];
    
    cbv2 = [[SSCheckBoxView alloc]initWithFrame:CGRectMake(190, 30, 100, 20)
                                          style:kSSCheckBoxViewStyleGreen
                                        checked:NO];
    [cbv2 setText:@"玩法二"];
    [self.view addSubview:cbv2];
    
    UILabel *phaseLab = [[UILabel alloc]init];
    phaseLab.text     = @"期号:";
    phaseLab.frame    = CGRectMake(30, 70, 40, 20);
    phaseLab.textAlignment = UITextAlignmentRight;
    [self.view addSubview:phaseLab];
    [phaseLab release];
    
    pharseNumFld = [[UITextField alloc]init];
    pharseNumFld.delegate    = self;
    pharseNumFld.frame       = CGRectMake(80, 65, 200, 30);
    pharseNumFld.borderStyle = UITextBorderStyleLine;
    pharseNumFld.returnKeyType = UITextAlignmentRight;
    [self.view addSubview:pharseNumFld];
    
    UILabel *sSellTimeLab = [[UILabel alloc]init];
    sSellTimeLab.text     = @"开售时间:";
    sSellTimeLab.frame    = CGRectMake(0, 105, 80, 20);
    sSellTimeLab.textAlignment = UITextAlignmentRight;
    [self.view addSubview:sSellTimeLab];
    [sSellTimeLab release];
    
    startSellTimeFld = [[UITextField alloc]init];
    startSellTimeFld.delegate = self;
    startSellTimeFld.frame    = CGRectMake(80, 100, 200, 30);
    startSellTimeFld.borderStyle = UITextBorderStyleLine;
    startSellTimeFld.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:startSellTimeFld];
    
    UILabel *sAwardLab = [[UILabel alloc]init];
    sAwardLab.text     = @"开奖时间:";
    sAwardLab.frame    = CGRectMake(0, 140, 80, 20);
    sAwardLab.textAlignment = UITextAlignmentRight;
    [self.view addSubview:sAwardLab];
    [sAwardLab release];
    
    startAwardTimeFld = [[UITextField alloc]init];
    startAwardTimeFld.delegate = self;
    startAwardTimeFld.frame    = CGRectMake(80, 135, 200, 30);
    startAwardTimeFld.borderStyle = UITextBorderStyleLine;
    startAwardTimeFld.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:startAwardTimeFld];
    
    UILabel *endTimeLab = [[UILabel alloc]init];
    endTimeLab.text     = @"截止时间:";
    endTimeLab.frame    = CGRectMake(0, 175, 80, 20);
    endTimeLab.textAlignment = UITextAlignmentRight;
    [self.view addSubview:endTimeLab];
    [endTimeLab release];
    
    endTimeFld = [[UITextField alloc]init];
    endTimeFld.frame       = CGRectMake(80, 170, 200, 30);
    endTimeFld.delegate    = self;
    endTimeFld.borderStyle = UITextBorderStyleLine;
    endTimeFld.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:endTimeFld];
    
    UILabel *expectLab = [[UILabel alloc]init];
    expectLab.text     = @"专家预测:";
    expectLab.frame    = CGRectMake(0, 210, 80, 20);
    expectLab.textAlignment = UITextAlignmentRight;
    [self.view addSubview:expectLab];
    [expectLab release];
    
    expectFld = [[UITextField alloc]init];
    expectFld.delegate = self;
    expectFld.frame    = CGRectMake(80, 205, 200, 30);
    expectFld.borderStyle = UITextBorderStyleLine;
    expectFld.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:expectFld];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidUnload
{
    [typeDropDown release];
    typeDropDown = nil;
    typeBtn      = nil;
    
    [cbv1 release];
    [cbv2 release];
    
    [pharseNumFld      release];
    [endTimeFld        release];
    [expectFld         release];
    [startAwardTimeFld release];
    [startSellTimeFld  release];
    [super viewDidUnload];
}

- (void) dealloc
{
    [cbv1 release];
    [cbv2 release];
    [super dealloc];
}

#pragma mark -
#pragma mark UITextFeildDelegate
- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

#pragma mark-
#pragma mark NIDropDownDelegate
- (void) niDropDownDelegateMethod: (NIDropDown *) sender
{
    [self releaseTypeDropDown];
}

#pragma mark-
#pragma mark UIButton Clicked Action
- (void) doCommitClicked:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) doTypeSelectBtnClicked:(id)sender
{
    NSArray * arr = [[NSArray alloc] init];
    arr = [NSArray arrayWithObjects:@"全部",@"七彩乐",
           @"双色球",@"7位数",
           @"大乐透",@"11选5",
           @"快3",nil];
    if(typeDropDown == nil)
    {
        CGFloat f = 200;
        typeDropDown = [[NIDropDown alloc]showDropDown:sender :&f :arr];
        typeDropDown.delegate = self;
    }
    else
    {
        [typeDropDown hideDropDown:sender];
        [self releaseTypeDropDown];
    }
}

- (void) releaseTypeDropDown
{
    [typeDropDown release];
    typeDropDown = nil;
}
@end
