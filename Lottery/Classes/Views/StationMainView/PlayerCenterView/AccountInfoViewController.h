//
//  AccountInfoViewController.h
//  Lottery
//
//  Created by lynn on 13-3-24.
//
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface AccountInfoViewController : UIViewController<
                                                        UITableViewDelegate,
                                                        UITableViewDataSource>
{
    User            *user;
    UITableView     *accountInfTab;
}

@property (nonatomic, retain) User      *user;
@end
