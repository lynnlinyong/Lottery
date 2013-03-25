//
//  PlayerCenterViewController.h
//  Lottery
//
//  Created by lynn on 13-3-23.
//
//

#import <UIKit/UIKit.h>

@interface PlayerCenterViewController : UIViewController<
                                                        UISearchBarDelegate,
                                                        UITableViewDelegate,
                                                        UITableViewDataSource>
{
    UISearchBar     *searchBar;
    UITableView     *accountTab;
    
    NSMutableArray  *accountArray;
}
@end
