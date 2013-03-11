//
//  Lottery.m
//  Lottery
//
//  Created by lynn  lynn on 13-3-11.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "Lottery.h"

@implementation Lottery
@synthesize imgUrl;
@synthesize name;
@synthesize phase;
@synthesize time;
@synthesize monery;
@synthesize reward;
@synthesize kLotteryStatus;

- (id)init
{
    self = [super init];
    if (self)
    {
        imgUrl = [[NSString alloc]init];
        name   = [[NSString alloc]init];
        phase  = [[NSString alloc]init];
        time   = [[NSString alloc]init];
        monery = [[NSString alloc]init];
        reward = [[NSString alloc]init];
        kLotteryStatus = kLotteryIsNotTicket;
    }
    
    return self;
}

- (void) dealloc
{
    [imgUrl release];
    [name   release];
    [phase  release];
    [time   release];
    [monery release];
    [reward release];
    
    [super dealloc];
}

- (id) copyWithZone:(NSZone *)zone
{
    Lottery *lotteryObj = NSCopyObject(self, 0, zone);
    if (lotteryObj)
    {
        lotteryObj.imgUrl = [imgUrl copy];
        lotteryObj.name   = [name   copy];
        lotteryObj.phase  = [phase  copy];
        lotteryObj.time   = [time   copy];
        lotteryObj.monery = [monery copy];
        lotteryObj.reward = [reward copy];
        lotteryObj.kLotteryStatus = kLotteryStatus;
    }
    
    return lotteryObj;
}

- (id) mutableCopyWithZone:(NSZone *)zone
{
    Lottery *lotteryObj = NSCopyObject(self, 0, zone);
    if (lotteryObj)
    {
        lotteryObj.imgUrl = [imgUrl copy];
        lotteryObj.name   = [name   copy];
        lotteryObj.phase  = [phase  copy];
        lotteryObj.time   = [time   copy];
        lotteryObj.monery = [monery copy];
        lotteryObj.reward = [reward copy];
        lotteryObj.kLotteryStatus = kLotteryStatus;
    }
    
    return lotteryObj;
}
@end
