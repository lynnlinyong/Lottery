//
//  CreateAcountViewController.h
//  Lottery
//
//  Created by lynn on 13-3-24.
//
//

#import <UIKit/UIKit.h>
#import "User.h"

typedef enum _tagViewAction
{
    kShowView = 0,
    kCreateView
}ViewAction;

@interface CreateAcountViewController : UIViewController<
                                                        UIAlertViewDelegate,
                                                        UITextFieldDelegate,
                                                        UITableViewDataSource,
                                                        UITableViewDelegate>
{
    UITableView     *accountTab;
    UITextField     *nameTxtFld;
    UITextField     *idNumberTxtFld;
    UITextField     *telNumberTxtFld;
    UITextField     *userNameTxtFld;
    UITextField     *pwdTxtFld;
    
    NSMutableArray  *txtFldArray;
    
    User            *user;
    ViewAction      viewAction;
}

@property (nonatomic, retain) User          *user;
@property (nonatomic, assign) ViewAction    viewAction;
@end
