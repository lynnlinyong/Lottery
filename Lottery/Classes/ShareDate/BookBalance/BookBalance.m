//
//  BookBalance.m
//  Lottery
//
//  Created by lynn  lynn on 13-3-12.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "BookBalance.h"

@implementation BookBalance
@synthesize time;
@synthesize money;
@synthesize kPhaseType;
@synthesize kCommentType;

- (id)init
{
    self = [super init];
    if (self)
    {
        time  = [[NSString alloc]init];
        money = [[NSString alloc]init];
        kPhaseType   = kBuyLottery;
        kCommentType = kPhaseType;
    }
    
    return self;
}

- (void) dealloc
{
    [time  release];
    [money release];
    
    [super dealloc];
}

- (id) copyWithZone:(NSZone *)zone
{
    BookBalance *bookBalance = NSCopyObject(self, 0, zone);
    if (bookBalance)
    {
        bookBalance.time  = [time copy];
        bookBalance.money = [money copy];
        bookBalance.kPhaseType   = kPhaseType;
        bookBalance.kCommentType = kCommentType;
    }
    
    return bookBalance;
}

- (id) mutableCopyWithZone:(NSZone *)zone
{
    BookBalance *bookBalance = NSCopyObject(self, 0, zone);
    if (bookBalance)
    {
        bookBalance.time  = [time copy];
        bookBalance.money = [money copy];
        bookBalance.kPhaseType   = kPhaseType;
        bookBalance.kCommentType = kCommentType;
    }
    
    return bookBalance;
}
@end
