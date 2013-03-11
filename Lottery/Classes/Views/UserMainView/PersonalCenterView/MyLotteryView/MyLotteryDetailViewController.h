//
//  MyLotteryDetailViewController.h
//  Lottery
//
//  Created by lynn  lynn on 13-3-11.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Lottery.h"

@interface MyLotteryDetailViewController : UIViewController
{
    Lottery     *lottery;
}

@property (nonatomic, copy) Lottery   *lottery;
@end
