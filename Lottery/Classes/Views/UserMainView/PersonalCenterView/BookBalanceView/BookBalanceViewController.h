//
//  BookBalanceViewController.h
//  Lottery
//
//  Created by lynn  lynn on 13-3-11.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NIDropDown.h"

@interface BookBalanceViewController : UIViewController<
                                                        NIDropDownDelegate,
                                                        UITableViewDelegate,
                                                        UITableViewDataSource>
{
    UIButton    *typeBtn;
    UIButton    *timeBtn;
    
    NIDropDown  *typeDropDown;
    NIDropDown  *timeDropDown;
    
    UITableView     *bookBalanceTab;
    NSMutableArray  *bookBalanceArray;
}
@end
