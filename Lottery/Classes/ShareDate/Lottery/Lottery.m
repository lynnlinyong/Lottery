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
@synthesize money;
@synthesize reward;
@synthesize kLotteryStatus;
@synthesize pepoleID;
@synthesize betAmounts;
@synthesize times;
@synthesize buyType;
@synthesize betTime;
@synthesize projectStatus;
@synthesize result;
@synthesize phaseTotal;
@synthesize currentNumber;
@synthesize projectArray;

@synthesize playName;
@synthesize playMethod;
@synthesize startTime;
@synthesize startAwardTime;
@synthesize endTime;
@synthesize expectPro;
@synthesize awardArray;

- (id)init
{
    self = [super init];
    if (self)
    {
        imgUrl = [[NSString alloc]init];
        name   = [[NSString alloc]init];
        phase  = [[NSString alloc]init];
        time   = [[NSString alloc]init];
        money = [[NSString alloc]init];
        reward = [[NSString alloc]init];
        kLotteryStatus = kLotteryIsNotTicket;
        
        pepoleID        = [[NSString alloc]init];
        betAmounts      = [[NSString alloc]init];
        times           = [[NSString alloc]init];
        buyType         = [[NSString alloc]init];
        betTime         = [[NSString alloc]init];
        projectStatus   = [[NSString alloc]init];
        result          = [[NSString alloc]init];
        phaseTotal      = [[NSString alloc]init];
        currentNumber   = [[NSString alloc]init];
        projectArray    = [[NSMutableArray alloc]init];
        
        playName        = [[NSString alloc]init];
        playMethod      = [[NSString alloc]init];
        startTime       = [[NSString alloc]init];
        startAwardTime  = [[NSString alloc]init];
        endTime         = [[NSString alloc]init];
        expectPro       = [[NSString alloc]init];
        awardArray      = [[NSMutableArray alloc]init];
    }
    
    return self;
}

- (void) dealloc
{
    [imgUrl release];
    [name   release];
    [phase  release];
    [time   release];
    [money  release];
    [reward release];
    
    [playMethod     release];
    [startTime      release];
    [startAwardTime release];
    [endTime        release];
    [expectPro      release];
    [awardArray     release];
    
    [playName       release];
    [pepoleID       release];
    [betAmounts     release];
    [times          release];
    [buyType        release];
    [betTime        release];
    [projectStatus  release];
    [result         release];
    [phaseTotal     release];
    [currentNumber  release];
    [projectArray   release];
    
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
        lotteryObj.money  = [money  copy];
        lotteryObj.reward = [reward copy];
        lotteryObj.kLotteryStatus = kLotteryStatus;
        
        lotteryObj.betAmounts = [betAmounts copy];
        lotteryObj.times   = [times     copy];
        lotteryObj.buyType = [buyType   copy];
        lotteryObj.betTime = [betTime   copy];
        lotteryObj.projectStatus = [projectStatus   copy];
        lotteryObj.result        = [result          copy];
        lotteryObj.phaseTotal    = [phaseTotal      copy];
        lotteryObj.currentNumber = [currentNumber   copy];
        lotteryObj.projectArray  = [projectArray mutableCopy];
        
        lotteryObj.playName        = [playName       copy];
        lotteryObj.playMethod      = [playMethod     copy];
        lotteryObj.startTime       = [startTime      copy];
        lotteryObj.startAwardTime  = [startAwardTime copy];
        lotteryObj.endTime         = [endTime        copy];
        lotteryObj.expectPro       = [expectPro      copy];
        lotteryObj.awardArray      = [awardArray     copy];
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
        lotteryObj.money  = [money  copy];
        lotteryObj.reward = [reward copy];
        lotteryObj.kLotteryStatus = kLotteryStatus;
        
        lotteryObj.betAmounts = [betAmounts copy];
        lotteryObj.times   = [times     copy];
        lotteryObj.buyType = [buyType   copy];
        lotteryObj.betTime = [betTime   copy];
        lotteryObj.projectStatus = [projectStatus   copy];
        lotteryObj.result        = [result          copy];
        lotteryObj.phaseTotal    = [phaseTotal      copy];
        lotteryObj.currentNumber = [currentNumber   copy];
        lotteryObj.projectArray  = [projectArray    mutableCopy];
        
        lotteryObj.playName        = [playName       copy];
        lotteryObj.playMethod      = [playMethod     copy];
        lotteryObj.startTime       = [startTime      copy];
        lotteryObj.startAwardTime  = [startAwardTime copy];
        lotteryObj.endTime         = [endTime        copy];
        lotteryObj.expectPro       = [expectPro      copy];
        lotteryObj.awardArray      = [awardArray   mutableCopy];
    }
    
    return lotteryObj;
}
@end
