//
//  Lottery.h
//  Lottery
//
//  Created by lynn  lynn on 13-3-11.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum _tagLotteryStatus
{
    kLotteryWin = 0,        //中奖
    kLotteryLose,           //未中奖
    kLotteryIsNotTicket     //未出票
}LotteryStatus;

@interface Lottery : NSObject <NSCopying, NSMutableCopying>
{
    NSString        *imgUrl;
    NSString        *name;
    NSString        *phase;     //彩票期数
    NSString        *time;
    NSString        *monery;
    NSString        *reward;
    LotteryStatus   kLotteryStatus;
}

@property (nonatomic, retain) NSString *imgUrl;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *phase;
@property (nonatomic, retain) NSString *time;
@property (nonatomic, retain) NSString *monery;
@property (nonatomic, retain) NSString *reward;
@property (nonatomic, assign) LotteryStatus  kLotteryStatus; 
@end
