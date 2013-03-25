//
//  Manager.h
//  Lottery
//
//  Created by lynn on 13-3-24.
//
//

#import <Foundation/Foundation.h>

@interface User : NSObject<NSCopying,NSMutableCopying>
{
    NSString        *name;
    NSString        *idNumber;
    NSString        *telNumber;
    NSString        *money;
    NSString        *lpayerCount;
    NSString        *regTime;
    NSString        *userName;
}

@property (nonatomic, retain) NSString  *name;
@property (nonatomic, retain) NSString  *money;
@property (nonatomic, retain) NSString  *userName;
@property (nonatomic, retain) NSString  *regTime;
@property (nonatomic, retain) NSString  *idNumber;
@property (nonatomic, retain) NSString  *telNumber;
@property (nonatomic, retain) NSString  *lplayerCount;

@end
