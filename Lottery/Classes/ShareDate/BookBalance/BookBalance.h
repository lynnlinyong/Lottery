//
//  BookBalance.h
//  Lottery
//
//  Created by lynn  lynn on 13-3-12.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum _tagPhaseType
{
    kBuyLottery = 0,    //购买彩票
}PhaseType;

typedef enum _tagCommentType
{
    kPayedLottery = 0,  //投注支付
    kRegistGive         //注册赠送
}CommentType;

@interface BookBalance : NSObject<NSCopying, NSMutableCopying>
{
    NSString    *time;
    NSString    *money;
    
    PhaseType   kPhaseType;
    CommentType kCommentType;
}

@property (nonatomic, retain) NSString      *time;
@property (nonatomic, retain) NSString      *money;
@property (nonatomic, assign) PhaseType     kPhaseType;
@property (nonatomic, assign) CommentType   kCommentType;
@end
