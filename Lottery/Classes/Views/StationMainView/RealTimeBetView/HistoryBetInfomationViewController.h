//
//  HistoryBetInfomationViewController.h
//  Lottery
//
//  Created by lynn on 13-3-25.
//
//

#import <UIKit/UIKit.h>
#import "Lottery.h"
#import "NIDropDown.h"

@interface HistoryBetInfomationViewController : UIViewController<
                                                                UISearchBarDelegate,
                                                                NIDropDownDelegate,
                                                                UITableViewDelegate,
                                                                UITableViewDataSource>
{
    Lottery             *lottery;
    UITableView         *hbInfoTab;
    
    UIButton            *statusBtn;
    NIDropDown          *statusDropDown;
    
    UISearchBar         *searchBar;
    
    NSMutableArray      *blArray;
}

@property (nonatomic, retain) Lottery   *lottery;
@end
