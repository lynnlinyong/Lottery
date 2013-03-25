//
//  HistoryBetDetailViewController.h
//  Lottery
//
//  Created by lynn on 13-3-25.
//
//

#import <UIKit/UIKit.h>
#import "Lottery.h"

@interface HistoryBetDetailViewController : UIViewController<
                                                            UISearchBarDelegate,
                                                            UITableViewDataSource,
                                                            UITableViewDelegate>
{
    Lottery         *lottery;
    UITableView     *hlTab;
    UISearchBar     *searchBar;
    
    NSMutableArray  *lotteryArray;
}

@property (nonatomic, retain) Lottery  *lottery;
@end
