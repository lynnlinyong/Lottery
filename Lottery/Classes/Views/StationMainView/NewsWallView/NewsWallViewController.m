//
//  NewsWallViewController.m
//  Lottery
//
//  Created by lynn on 13-3-24.
//
//
#import "News.h"
#import "AppDelegate.h"
#import "NewsWallViewController.h"
#import "NewsDetailViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface NewsWallViewController ()

@end

@implementation NewsWallViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem = [[[UITabBarItem alloc]initWithTitle:@"新闻公告"
                                                        image:[UIImage imageNamed:@"light"]
                                                          tag:4]autorelease];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"新闻公告";
    
    newsArray = [[NSMutableArray alloc]init];
    
    News *news1   = [[News alloc]init];
    news1.title   = @"注册新会员即返3元彩票基金";
    news1.type    = @"彩票";
    news1.content = @"注册新会员即返3元彩票基金注册新会员即返3元彩票基金注册新会员即返3元彩票基金注册新会员即返3元彩票基金注册新会员即返3元彩票基金注册新会员即返3元彩票基金注册新会员即返3元彩票基金注册新会员即返3元彩票基金注册新会员即返3元彩票基金注册新会员即返3元彩票基金注册新会员即返3元彩票基金";
    news1.time    = @"2013-01-01 12:20:20";
    [newsArray addObject:news1];
    
    News *news2   = [[News alloc]init];
    news2.title   = @"注册新会员即返3元彩票基金";
    news2.type    = @"彩票";
    news2.content = @"注册新会员即返3元彩票基金注册新会员即返3元彩票基金注册新会员即返3元彩票基金注册新会员即返3元彩票基金注册新会员即返3元彩票基金注册新会员即返3元彩票基金注册新会员即返3元彩票基金注册新会员即返3元彩票基金注册新会员即返3元彩票基金注册新会员即返3元彩票基金注册新会员即返3元彩票基金";
    news2.time    = @"2013-01-01 12:20:20";
    [newsArray addObject:news2];
    
    News *news3   = [[News alloc]init];
    news3.title   = @"注册新会员即返3元彩票基金";
    news3.type    = @"彩票";
    news3.content = @"注册新会员即返3元彩票基金注册新会员即返3元彩票基金注册新会员即返3元彩票基金注册新会员即返3元彩票基金注册新会员即返3元彩票基金注册新会员即返3元彩票基金注册新会员即返3元彩票基金注册新会员即返3元彩票基金注册新会员即返3元彩票基金注册新会员即返3元彩票基金注册新会员即返3元彩票基金";
    news3.time    = @"2013-01-01 12:20:20";
    [newsArray addObject:news3];
    
    News *news4   = [[News alloc]init];
    news4.title   = @"注册新会员即返3元彩票基金";
    news4.type    = @"彩票";
    news4.content = @"注册新会员即返3元彩票基金注册新会员即返3元彩票基金注册新会员即返3元彩票基金注册新会员即返3元彩票基金注册新会员即返3元彩票基金注册新会员即返3元彩票基金注册新会员即返3元彩票基金注册新会员即返3元彩票基金注册新会员即返3元彩票基金注册新会员即返3元彩票基金注册新会员即返3元彩票基金";
    news4.time    = @"2013-01-01 12:20:20";
    [newsArray addObject:news4];
    
    News *news5   = [[News alloc]init];
    news5.title   = @"注册新会员即返3元彩票基金";
    news5.type    = @"彩票";
    news5.content = @"注册新会员即返3元彩票基金注册新会员即返3元彩票基金注册新会员即返3元彩票基金注册新会员即返3元彩票基金注册新会员即返3元彩票基金注册新会员即返3元彩票基金注册新会员即返3元彩票基金注册新会员即返3元彩票基金注册新会员即返3元彩票基金注册新会员即返3元彩票基金注册新会员即返3元彩票基金";
    news5.time    = @"2013-01-01 12:20:20";
    [newsArray addObject:news5];
    
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
    typeBtn.frame = CGRectMake(110, 10, 100, 30);
    [self.view addSubview:typeBtn];
    
    
    newsTab = [[UITableView alloc]init];
    newsTab.delegate   = self;
    newsTab.dataSource = self;
    newsTab.frame = CGRectMake(0, 80, 320, 360);
    [self.view addSubview:newsTab];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload
{
    newsTab.delegate   = nil;
    newsTab.dataSource = nil;
    
    [super viewDidUnload];
}

- (void) dealloc
{
    [newsArray removeAllObjects];
    [newsArray release];
    [newsTab   release];
    
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
    return newsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *idString = @"idString";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idString];
    if (!cell)
    {
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                     reuseIdentifier:idString]autorelease];
        
        News *news = [newsArray objectAtIndex:indexPath.row];
        
        UILabel *titleLab = [[UILabel alloc]init];
        titleLab.frame    = CGRectMake(10, 12, 300, 20);
        titleLab.text     = news.title;
        titleLab.textAlignment = UITextAlignmentCenter;
        [cell addSubview:titleLab];
        [titleLab release];
    }
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UINavigationController *nc = [AppDelegate getNavViewController];
    
    News *obj = [newsArray objectAtIndex:indexPath.row];
    NewsDetailViewController *ndViewCtr = [[NewsDetailViewController alloc]init];
    ndViewCtr.newsDetail = obj;
    [nc pushViewController:ndViewCtr
                  animated:YES];
    [ndViewCtr release];
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
@end
