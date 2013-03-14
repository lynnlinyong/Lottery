//
//  LotteryDetailViewController.h
//  Lottery
//
//  Created by lynn  lynn on 13-3-14.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Lottery.h"

@interface LotteryDetailViewController : UIViewController
{
    Lottery         *lottery;
}

@property (nonatomic, retain) Lottery     *lottery;
@end
