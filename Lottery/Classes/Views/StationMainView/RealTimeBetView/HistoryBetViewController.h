//
//  HistoryBetViewController.h
//  Lottery
//
//  Created by lynn on 13-3-24.
//
//

#import <UIKit/UIKit.h>

@interface HistoryBetViewController : UIViewController <
                                                        UITableViewDataSource,
                                                        UITableViewDelegate>
{
    UITableView     *lotteryTab;
    NSMutableArray  *lotteryArray;
}
@end
