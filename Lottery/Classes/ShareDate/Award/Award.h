//
//  Award.h
//  Lottery
//
//  Created by lynn  lynn on 13-3-15.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Award : NSObject <NSCopying, NSMutableCopying>
{
    NSString        *awardType;
    NSString        *winCount;
    NSString        *everyCountMoney;
}

@property (nonatomic, retain) NSString  *awardType;
@property (nonatomic, retain) NSString  *winCount;
@property (nonatomic, retain) NSString  *everyCountMoney;
@end
