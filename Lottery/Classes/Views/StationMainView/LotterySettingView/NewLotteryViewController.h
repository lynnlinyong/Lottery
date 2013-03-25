//
//  NewLotteryViewController.h
//  Lottery
//
//  Created by lynn on 13-3-24.
//
//

#import <UIKit/UIKit.h>
#import "NIDropDown.h"
#import "SSCheckBoxView.h"

@interface NewLotteryViewController : UIViewController<
                                                      NIDropDownDelegate,
                                                      UITextFieldDelegate>
{
    SSCheckBoxView  *cbv1;
    SSCheckBoxView  *cbv2;
    
    UIButton    *typeBtn;
    NIDropDown  *typeDropDown;
    
    UITextField *endTimeFld;
    UITextField *pharseNumFld;
    UITextField *startSellTimeFld;
    UITextField *startAwardTimeFld;
    UITextField *expectFld;
}
@end
