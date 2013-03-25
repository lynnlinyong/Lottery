//
//  NewsDetailViewController.h
//  Lottery
//
//  Created by lynn on 13-3-24.
//
//

#import <UIKit/UIKit.h>
#import "News.h"

@interface NewsDetailViewController : UIViewController<UIAlertViewDelegate>
{
    News      *newsDetail;
}

@property (nonatomic,retain) News       *newsDetail;
@end
