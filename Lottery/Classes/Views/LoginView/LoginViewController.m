//
//  LoginViewController.m
//  Lottery
//
//  Created by lynn  lynn on 13-3-10.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//
#import "AppDelegate.h"
#import "LoginViewController.h"
#import "UserMainViewController.h"
#import "StationMainViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize pwdFld;
@synthesize userNameFld;

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
    
    /**
     *初始化UI
     **/
    UILabel *titleLab  = [[UILabel alloc]init];
    titleLab.text      = @"用户登陆";
    titleLab.font      = [UIFont systemFontOfSize:30.0f];
    titleLab.textColor = [UIColor redColor];
    titleLab.frame     = CGRectMake(80, 60, 160, 40);
    titleLab.textAlignment = UITextAlignmentCenter;
    [self.view addSubview:titleLab];
    [titleLab release];
    
    
    UILabel *userNameLab = [[UILabel alloc]init];
    userNameLab.text     = @"用户名:";
    userNameLab.frame    = CGRectMake(30, 130, 80, 20);
    userNameLab.textAlignment = UITextAlignmentCenter;
    [self.view addSubview:userNameLab];
    [userNameLab release];
    
    userNameFld = [[UITextField alloc]init];
    userNameFld.delegate    = self;
    userNameFld.frame       = CGRectMake(110, 130, 160, 25);
    userNameFld.borderStyle = UITextBorderStyleLine;
    userNameFld.returnKeyType= UIReturnKeyDone;
    [self.view addSubview:userNameFld];
    
    UILabel *pwdLab = [[UILabel alloc]init];
    pwdLab.text     = @"密码:";
    pwdLab.frame    = CGRectMake(48, 180, 60, 20);
    pwdLab.textAlignment = UITextAlignmentCenter;
    [self.view addSubview:pwdLab];
    [pwdLab release];
    
    pwdFld = [[UITextField alloc]init];
    pwdFld.delegate     = self;
    pwdFld.frame        = CGRectMake(110, 180, 160, 25);
    pwdFld.borderStyle  = UITextBorderStyleLine;
    pwdFld.returnKeyType= UIReturnKeyDone;
    [self.view addSubview:pwdFld];
    
    UIButton *userLoginBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [userLoginBtn setTitle:@"彩民登陆"
                  forState:UIControlStateNormal];
    [userLoginBtn setFrame:CGRectMake(30, 250, 100, 30)];
    [userLoginBtn addTarget:self 
                     action:@selector(doUserLoginBtnClicked:) 
           forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:userLoginBtn];
    
    UIButton *stationLoginBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [stationLoginBtn setTitle:@"投注站登陆"
                     forState:UIControlStateNormal];
    [stationLoginBtn setFrame:CGRectMake(180, 250, 100, 30)];
    [stationLoginBtn addTarget:self 
                        action:@selector(doStationLoginBtnClicked:) 
              forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:stationLoginBtn];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    pwdFld = nil;
    pwdFld.delegate = nil;
    
    userNameFld = nil;
    userNameFld.delegate = nil;
}

- (void) dealloc
{
    [super dealloc];
    
    [pwdFld release];
    [userNameFld release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //隐藏Nav Bar
    self.navigationController.navigationBarHidden = YES;
}

#pragma mark -
#pragma mark UITextFeildDelegate
- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark- 
#pragma mark Button Clicked Action
- (void) doUserLoginBtnClicked:(id)sender
{
    UINavigationController *navViewCtr = [AppDelegate getNavViewController];
    
    UserMainViewController *userMainViewCtr = [[UserMainViewController alloc]init];
    [navViewCtr pushViewController:userMainViewCtr 
                                         animated:YES];
    [userMainViewCtr release];
}

- (void) doStationLoginBtnClicked:(id)sender
{
    UINavigationController *navViewCtr = [AppDelegate getNavViewController];
    
    StationMainViewController *stationMainViewCtr = [[StationMainViewController alloc]init];
    [navViewCtr pushViewController:stationMainViewCtr 
                                         animated:YES];
    [stationMainViewCtr release];
}
@end
