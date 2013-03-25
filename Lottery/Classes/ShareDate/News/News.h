//
//  News.h
//  Lottery
//
//  Created by lynn on 13-3-24.
//
//

#import <Foundation/Foundation.h>

@interface News : NSObject <NSCopying, NSMutableCopying>
{
    NSString   *type;
    NSString   *title;
    NSString   *content;
    NSString   *time;
}
@property (nonatomic, retain) NSString  *time;
@property (nonatomic, retain) NSString  *type;
@property (nonatomic, retain) NSString  *title;
@property (nonatomic, retain) NSString  *content;
@end
