//
//  LotterySettingViewController.h
//  Lottery
//
//  Created by lynn on 13-3-23.
//
//

#import <UIKit/UIKit.h>

@interface LotterySettingViewController : UIViewController<
                                                        UITableViewDelegate,
                                                        UITableViewDataSource>
{
    UITableView     *lotteryTab;
    NSMutableArray  *lotteryArray;
}
@end
