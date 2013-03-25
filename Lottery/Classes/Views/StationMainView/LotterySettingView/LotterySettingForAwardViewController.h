//
//  LotterySettingForAwardViewController.h
//  Lottery
//
//  Created by lynn on 13-3-24.
//
//

#import <UIKit/UIKit.h>
#import "Lottery.h"

@interface LotterySettingForAwardViewController : UIViewController<
                                                            UITableViewDelegate,
                                                            UITableViewDataSource>
{
    Lottery         *lottery;
    UITableView     *lotteryTab;
}

@property (nonatomic, retain) Lottery       *lottery;
@end
