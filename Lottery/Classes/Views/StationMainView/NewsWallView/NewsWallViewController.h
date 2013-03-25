//
//  NewsWallViewController.h
//  Lottery
//
//  Created by lynn on 13-3-24.
//
//

#import <UIKit/UIKit.h>
#import "NIDropDown.h"

@interface NewsWallViewController : UIViewController<
                                                    NIDropDownDelegate,
                                                    UITableViewDataSource,
                                                    UITableViewDelegate>
{
    UITableView     *newsTab;
    NSMutableArray  *newsArray;
    
    UIButton        *typeBtn;
    NIDropDown      *typeDropDown;
}
@end
