//
//  StationManagerViewController.h
//  Lottery
//
//  Created by lynn on 13-3-23.
//
//

#import <UIKit/UIKit.h>

@interface StationManagerViewController : UIViewController<
                                                        UITableViewDataSource,
                                                        UITableViewDelegate>
{
    UITableView     *funcTab;
}
@end
