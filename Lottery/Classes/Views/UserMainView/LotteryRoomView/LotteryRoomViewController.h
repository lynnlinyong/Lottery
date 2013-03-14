//
//  LotteryRoomViewController.h
//  Lottery
//
//  Created by lynn  lynn on 13-3-10.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LotteryRoomViewController : UIViewController <UITableViewDelegate,
                                                         UITableViewDataSource>
{
    UITableView     *lotteryTab;
    NSMutableArray  *lotteryArray;
}
@end
