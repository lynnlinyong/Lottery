//
//  NewsDetailViewController.m
//  Lottery
//
//  Created by lynn on 13-3-24.
//
//

#import <QuartzCore/QuartzCore.h>
#import "AddNewsViewController.h"
#import "NewsDetailViewController.h"

@interface NewsDetailViewController ()

@end

@implementation NewsDetailViewController
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
    
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStyleBordered
                                                                                          target:self
                                                                                          action:@selector(doEditBtnClicked:)]autorelease];
    UILabel *titleLab = [[UILabel alloc]init];
    titleLab.text     = newsDetail.title;
    titleLab.frame    = CGRectMake(10, 30, 300, 20);
    titleLab.textAlignment = UITextAlignmentCenter;
    [self.view addSubview:titleLab];
    [titleLab release];
    
    UILabel *timeLab  = [[UILabel alloc]init];
    timeLab.text      = newsDetail.time;
    timeLab.frame     = CGRectMake(10, 60, 300, 20);
    timeLab.textAlignment = UITextAlignmentCenter;
    [self.view addSubview:timeLab];
    [timeLab release];
    
    UITextView *txtView = [[UITextView alloc]init];
    txtView.layer.borderColor = [UIColor blackColor].CGColor;
    txtView.layer.borderWidth = 0.1;
    txtView.text     = newsDetail.content;
    txtView.editable = NO;
    txtView.frame    = CGRectMake(10, 90, 300, 300);
    [self.view addSubview:txtView];
    [txtView release];
    
    UIButton *deleteBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
    [deleteBtn setFrame:CGRectMake(110, 380, 100, 30)];
    [deleteBtn addTarget:self
                  action:@selector(doDeleteBtnClicked:)
        forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:deleteBtn];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark UIButton Clicked Action
- (void) doEditBtnClicked:(id)sender
{
    AddNewsViewController *anViewCtr = [[AddNewsViewController alloc]init];
    anViewCtr.viewType   = kEditView;
    anViewCtr.newsDetail = newsDetail;
    [self.navigationController pushViewController:anViewCtr animated:YES];
    [anViewCtr release];
}

- (void) doDeleteBtnClicked:(id)sender
{
    UIAlertView *alertView =[[UIAlertView alloc]initWithTitle:@"提示"
                                                      message:@"确定删除"
                                                     delegate:self
                                            cancelButtonTitle:@"取消"
                                            otherButtonTitles:@"确定", nil];
    [alertView show];
    [alertView release];
}

#pragma mark -
#pragma mark UIAlertViewDelegate
- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) //取消
    {
        CLog(@"Cancel");
    }
    else
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
}
@end
