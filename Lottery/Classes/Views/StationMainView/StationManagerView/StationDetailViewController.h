//
//  StationDetailViewController.h
//  Lottery
//
//  Created by lynn on 13-3-24.
//
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface StationDetailViewController : UIViewController<
                                                        UITableViewDelegate,
                                                        UITableViewDataSource>
{
    UITableView     *managerTab;
    User            *manager;
}
@end
