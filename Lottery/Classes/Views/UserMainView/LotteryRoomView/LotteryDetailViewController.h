//
//  LotteryDetailViewController.h
//  Lottery
//
//  Created by lynn  lynn on 13-3-14.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Lottery.h"

@interface LotteryDetailViewController : UIViewController<
                                                        UITableViewDelegate,
                                                        UITableViewDataSource>
{
    Lottery         *lottery;
    
    UITableView     *lotteryRankTab;
    
    NSMutableArray  *rankArray;
}

@property (nonatomic, retain) Lottery    *lottery;
@end
