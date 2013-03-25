//
//  LetteryTableViewCell.m
//  Lottery
//
//  Created by lynn  lynn on 13-3-10.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "LetteryTableViewCell.h"

@implementation LetteryTableViewCell
@synthesize nameLab;
@synthesize limitInfoLab;
@synthesize limitTimeLab;
@synthesize iconImgView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        iconImgView       = [[UIImageView alloc]init];
        iconImgView.image = [UIImage imageNamed:@"lottery_icon.png"];
        iconImgView.frame = CGRectMake(5, 7.5, 80, 80);
        [self addSubview:iconImgView];
        
        nameLab           = [[UILabel alloc]init];
        nameLab.frame     = CGRectMake(85, 25, 100, 40);
        nameLab.textColor = [UIColor redColor];
        nameLab.font      = [UIFont systemFontOfSize:25];
        [self addSubview:nameLab];
        
        limitInfoLab       = [[UILabel alloc]init];
        limitInfoLab.frame = CGRectMake(160, 17, 125, 20);
        limitInfoLab.text  = @"投注截止剩余:";
        limitInfoLab.textAlignment = UITextAlignmentCenter;
        [self addSubview:limitInfoLab];
        
        timer = [NSTimer scheduledTimerWithTimeInterval:1 
                                                 target:self 
                                               selector:@selector(doTimer:)
                                               userInfo:nil 
                                                repeats:YES];
        limitTimeLab = [[UILabel alloc]init];
        limitTimeLab.font  = [UIFont systemFontOfSize:14];
        limitTimeLab.frame = CGRectMake(160, 47, 155, 20);
        limitTimeLab.textAlignment = UITextAlignmentCenter;
        [self addSubview:limitTimeLab];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

- (void) dealloc
{
    [super dealloc];
    [nameLab release];
    [iconImgView  release];
    [limitInfoLab release];
    [limitTimeLab release];
    
    [timer fire];
    [timer invalidate];
    timer = nil;
}

- (void) doTimer:(id)sender
{
    NSString *dateStr     = @"2013-05-17 11:23:23";
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSUInteger unitFlags  = NSDayCalendarUnit    |
                            NSHourCalendarUnit   |
                            NSMinuteCalendarUnit |
                            NSSecondCalendarUnit;
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate     *fromdate    = [format dateFromString:dateStr];
    NSTimeZone *fromzone    = [NSTimeZone systemTimeZone];
    NSInteger  frominterval = [fromzone secondsFromGMTForDate: fromdate];
    NSDate     *fromDate    = [fromdate  dateByAddingTimeInterval: frominterval];
    [format release];
    
    NSDate *date       = [NSDate date];
    NSTimeZone *zone   = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: date];
    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    NSDateComponents *components = [gregorian components:unitFlags
                                                fromDate:fromDate
                                                  toDate:localeDate
                                                 options:0];
    NSInteger days     = abs([components  day]);
    NSInteger hour     = abs([components  hour]);
    NSInteger minute   = abs([components  minute]);
    NSInteger second   = abs([components  second]);
    
    limitTimeLab.text  = [NSString stringWithFormat:@"%d天:%d时:%d分:%d秒",
                                                                  days,hour,
                                                                  minute,second];
}
@end
