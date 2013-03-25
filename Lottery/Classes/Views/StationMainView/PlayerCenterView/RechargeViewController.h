//
//  RechargeViewController.h
//  Lottery
//
//  Created by lynn on 13-3-24.
//
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface RechargeViewController : UIViewController<
                                                    UITextFieldDelegate,
                                                    UIPickerViewDataSource,
                                                    UIPickerViewDelegate>
{
    User    *user;
    
    UIPickerView    *moneyPicker;
    NSArray         *moneyArray;
}

@property (nonatomic, retain) User  *user;
@end
