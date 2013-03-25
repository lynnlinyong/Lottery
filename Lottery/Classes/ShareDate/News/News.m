//
//  News.m
//  Lottery
//
//  Created by lynn on 13-3-24.
//
//

#import "News.h"

@implementation News
@synthesize title;
@synthesize content;
@synthesize type;
@synthesize time;

- (id) init
{
    self = [super init];
    if (self)
    {
        self.type    = [[NSString alloc]init];
        self.title   = [[NSString alloc]init];
        self.content = [[NSString alloc]init];
        self.time    = [[NSString alloc]init];
    }
    
    return self;
}

- (void) dealloc
{
    [type    release];
    [title   release];
    [content release];
    [time    release];
    [super dealloc];
}

- (id)copyWithZone:(NSZone *)zone
{
    News *obj = NSCopyObject(self, 0, zone);
    if (obj)
    {
        obj.type    = [type     copy];
        obj.title   = [title    copy];
        obj.content = [content  copy];
        obj.time    = [time     copy];
    }
    
    return obj;
}

- (id)mutableCopyWithZone:(NSZone *)zone
{
    News *obj = NSCopyObject(self, 0, zone);
    if (obj)
    {
        obj.time    = [time     copy];
        obj.type    = [type     copy];
        obj.title   = [title    copy];
        obj.content = [content  copy];
    }
    
    return obj;
}
@end
