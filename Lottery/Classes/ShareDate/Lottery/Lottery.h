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
    NSString        *phase;         //彩票期数
    NSString        *time;
    NSString        *money;
    NSString        *reward;        //奖金
    LotteryStatus   kLotteryStatus;
    
    NSString        *pepoleID;      //发起人
    NSString        *betAmounts;    //注数
    NSString        *times;         //倍数
    NSString        *buyType;       //购买方式
    NSString        *betTime;       //下注时间
    NSString        *projectStatus; //方案状态
    NSString        *result;        //中奖情况
    NSString        *phaseTotal;    //总奖金
    
    NSString        *currentNumber; //当期开奖号码
    NSMutableArray  *projectArray;  //方案内容
}

@property (nonatomic, retain) NSString *imgUrl;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *phase;
@property (nonatomic, retain) NSString *time;
@property (nonatomic, retain) NSString *money;
@property (nonatomic, retain) NSString *reward;
@property (nonatomic, assign) LotteryStatus  kLotteryStatus; 

@property (nonatomic, retain) NSString          *pepoleID;
@property (nonatomic, retain) NSString          *betAmounts;
@property (nonatomic, retain) NSString          *times;
@property (nonatomic, retain) NSString          *buyType;
@property (nonatomic, retain) NSString          *betTime;
@property (nonatomic, retain) NSString          *projectStatus;
@property (nonatomic, retain) NSString          *result;
@property (nonatomic, retain) NSString          *phaseTotal;
@property (nonatomic, retain) NSString          *currentNumber;
@property (nonatomic, retain) NSMutableArray    *projectArray;
@end
