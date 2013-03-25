//
//  Manager.m
//  Lottery
//
//  Created by lynn on 13-3-24.
//
//

#import "User.h"

@implementation User
@synthesize name;
@synthesize money;
@synthesize regTime;
@synthesize idNumber;
@synthesize telNumber;
@synthesize userName;
@synthesize lplayerCount;
- (id)init
{
    self = [super init];
    if (self)
    {
        name      = [[NSString alloc]init];
        money     = [[NSString alloc]init];
        regTime   = [[NSString alloc]init];
        idNumber  = [[NSString alloc]init];
        telNumber = [[NSString alloc]init];
        lplayerCount = [[NSString alloc]init];
    }
    
    return self;
}

- (void) dealloc
{
    [name       release];
    [money      release];
    [regTime    release];
    [idNumber   release];
    [telNumber  release];
    [lplayerCount release];
    [super dealloc];
}

- (id) copyWithZone:(NSZone *)zone
{
    User *mObj = NSCopyObject(self, 0, zone);
    if (mObj)
    {
        mObj.name         = [name       copy];
        mObj.money        = [money      copy];
        mObj.regTime      = [regTime    copy];
        mObj.idNumber     = [idNumber   copy];
        mObj.telNumber    = [telNumber  copy];
        mObj.userName     = [userName   copy];
        mObj.lplayerCount = [lplayerCount copy];
    }
    
    return mObj;
}

- (id) mutableCopyWithZone:(NSZone *)zone
{
    User *mObj = NSCopyObject(self, 0, zone);
    if (mObj)
    {
        mObj.name         = [name       copy];
        mObj.money        = [money      copy];
        mObj.regTime      = [regTime    copy];
        mObj.idNumber     = [idNumber   copy];
        mObj.telNumber    = [telNumber  copy];
        mObj.userName     = [userName   copy];
        mObj.lplayerCount = [lplayerCount copy];
    }
    
    return mObj;
}
@end
