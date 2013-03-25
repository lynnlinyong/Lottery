//
//  AddNewsViewController.h
//  Lottery
//
//  Created by lynn on 13-3-24.
//
//

#import <UIKit/UIKit.h>
#import "News.h"
#import "NIDropDown.h"

typedef enum _viewType
{
    kAddView = 0,
    kEditView
}ViewType;

@interface AddNewsViewController : UIViewController<UITextFieldDelegate,
                                                    UITextViewDelegate,
                                                    NIDropDownDelegate,
                                                    UIAlertViewDelegate>
{
    UITextField *titleFld;
    UITextView  *contentTxt;

    News            *newsDetail;
    ViewType        viewType;
    
    UIButton        *typeBtn;
    NIDropDown      *typeDropDown;
}

@property (nonatomic, assign)   ViewType        viewType;
@property (nonatomic, retain)   News            *newsDetail;
@end
