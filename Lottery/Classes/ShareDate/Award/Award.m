//
//  Award.m
//  Lottery
//
//  Created by lynn  lynn on 13-3-15.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "Award.h"

@implementation Award
@synthesize awardType;
@synthesize winCount;
@synthesize everyCountMoney;

- (id) init
{
    self = [super init];
    if (self)
    {
        awardType       = [[NSString alloc]init];
        winCount        = [[NSString alloc]init];
        everyCountMoney = [[NSString alloc]init];
    }
    
    return self;
}

- (void) dealloc
{
    [awardType release];
    [winCount  release];
    [everyCountMoney release];
    [super dealloc];
}

- (id) copyWithZone:(NSZone *)zone
{
    Award   *awardObj = NSCopyObject(self, 0, zone);
    if (awardObj)
    {
        awardObj.awardType         = [awardType copy];
        awardObj.winCount          = [winCount  copy];
        awardObj.everyCountMoney   = [everyCountMoney copy];
    }
    
    return awardObj;
}

- (id) mutableCopyWithZone:(NSZone *)zone
{
    Award *awardObj = NSCopyObject(self, 0, zone);
    if (awardObj)
    {
        awardObj.awardType       = [awardType   copy];
        awardObj.winCount        = [winCount    copy];
        awardObj.everyCountMoney = [everyCountMoney copy];
    }
    
    return awardObj;
}
@end
