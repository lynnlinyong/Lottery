//
//  ExpectForecastViewController.h
//  Lottery
//
//  Created by lynn  lynn on 13-3-10.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExpectForecastViewController : UIViewController<
                                                        UITableViewDelegate,
                                                        UITableViewDataSource>
{
    UITableView         *expectTab;
    NSMutableArray      *lotteryArray;
}
@end
