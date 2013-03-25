//
//  RealTimeBetViewController.h
//  Lottery
//
//  Created by lynn on 13-3-23.
//
//

#import <UIKit/UIKit.h>
#import "NIDropDown.h"

@interface RealTimeBetViewController : UIViewController<
                                                        UIAlertViewDelegate,
                                                        NIDropDownDelegate,
                                                        UITableViewDelegate,
                                                        UITableViewDataSource>
{
    UIButton        *delBtn;
    
    UIButton        *typeBtn;
    UIButton        *statusBtn;
    NIDropDown      *typeDropDown;
    NIDropDown      *statusDropDown;
    
    UITableView     *lotteryTab;
    NSMutableArray  *lotteryArray;          //已购买的彩票容器
}
@end
