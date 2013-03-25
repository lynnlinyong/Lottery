//
//  AddNewsViewController.m
//  Lottery
//
//  Created by lynn on 13-3-24.
//
//

#import "AddNewsViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface AddNewsViewController ()

@end

@implementation AddNewsViewController
@synthesize viewType;
@synthesize newsDetail;

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
    self.title = @"新闻公告";
    
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc]initWithTitle:@"提交"
                                                                             style:UIBarButtonItemStyleBordered
                                                                            target:self
                                                                            action:@selector(doCommitBtn:)]autorelease];
    
    UILabel *typeLab  = [[UILabel alloc]init];
    typeLab.text      = @"类型:";
    typeLab.frame     = CGRectMake(30, 40, 60, 20);
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
    typeBtn.frame = CGRectMake(80, 35, 100, 30);
    [self.view addSubview:typeBtn];
    
    UILabel *titleLab = [[UILabel alloc]init];
    titleLab.text     = @"标题:";
    titleLab.frame    = CGRectMake(30, 80, 60, 20);
    [self.view addSubview:titleLab];
    [titleLab release];
    
    titleFld = [[UITextField alloc]init];
    titleFld.delegate     = self;
    titleFld.borderStyle  = UITextBorderStyleLine;
    titleFld.returnKeyType= UIReturnKeyDone;
    titleFld.frame        = CGRectMake(80, 75, 210, 30);
    [self.view addSubview:titleFld];
    [titleFld release];
    
    UILabel *contentLab = [[UILabel alloc]init];
    contentLab.text     = @"正文:";
    contentLab.frame    = CGRectMake(30, 120, 60, 20);
    [self.view addSubview:contentLab];
    [contentLab release];
    
    contentTxt = [[UITextView alloc]init];
    contentTxt.delegate = self;
    contentTxt.layer.borderColor = [UIColor blackColor].CGColor;
    contentTxt.layer.borderWidth =1.0;
//    contentTxt.layer.cornerRadius=5.0;
    contentTxt.frame    = CGRectMake(80, 120, 210, 220);
    contentTxt.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:contentTxt];
    
    /**
     * 如果是编辑视图,填充新闻内容
     **/
    if (viewType == kEditView)
    {
        titleFld.text   = newsDetail.title;
        contentTxt.text = newsDetail.content;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidUnload
{
    titleFld.delegate = nil;
    titleFld = nil;
    
    contentTxt = nil;
    [super viewDidUnload];
}

- (void) dealloc
{
    [titleFld   release];
    [contentTxt release];
    [super dealloc];
}

#pragma mark - 
#pragma mark UIAlertViewDelegate
- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 0)     //不成功提示
    {
        if (buttonIndex == 0) //取消
        {
            CLog(@"Cancel");
        }
        else                  //确定
        {
            CLog(@"Commit");
        }
    }
    else
    {
        CLog(@"Commit");
    }
}

#pragma mark -
#pragma mark UIButton Clicked Action
- (void) doCommitBtn:(id)sender
{
    if (titleFld.text.length == 0 || contentTxt.text.length == 0)
    {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示"
                                                           message:@"新闻所有信息不能为空!"
                                                          delegate:self
                                                 cancelButtonTitle:@"取消"
                                                 otherButtonTitles:@"确定", nil];
        alertView.tag = 0;
        [alertView show];
        [alertView release];
    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示"
                                                           message:@"提交成功!"
                                                          delegate:self
                                                 cancelButtonTitle:nil
                                                 otherButtonTitles:@"确定", nil];
        alertView.tag = 1;
        [alertView show];
        [alertView release];
    }
}

#pragma mark-
#pragma mark NIDropDownDelegate
- (void) niDropDownDelegateMethod: (NIDropDown *) sender
{
    [self releaseTypeDropDown];
}

#pragma mark-
#pragma mark UIButton Clicked Action
- (void) doTypeSelectBtnClicked:(id)sender
{
    NSArray * arr = [[NSArray alloc] init];
    arr = [NSArray arrayWithObjects:@"全部",@"彩票",
                                    @"中奖",@"彩民",nil];
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

#pragma mark -
#pragma mark UITextFeildDelegate
- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL) textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"])
    {
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
}

@end
