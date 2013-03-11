//
//  MyLotteryViewController.h
//  Lottery
//
//  Created by lynn  lynn on 13-3-11.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NIDropDown.h"

@interface MyLotteryViewController : UIViewController<
                                                    NIDropDownDelegate,
                                                    UITableViewDelegate,
                                                    UITableViewDataSource>
{
    UIButton    *typeBtn;
    UIButton    *statusBtn;
    NIDropDown  *typeDropDown;
    NIDropDown  *statusDropDown;
    
    UITableView     *myLotterTab;
    NSMutableArray  *myLotteryArray;
}

@end
