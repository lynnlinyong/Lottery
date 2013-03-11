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
        iconImgView = [[UIImageView alloc]init];
        iconImgView.image = [UIImage imageNamed:@"lottery_icon.png"];
        iconImgView.frame = CGRectMake(5, 7.5, 80, 80);
        [self addSubview:iconImgView];
        
        nameLab = [[UILabel alloc]init];
        nameLab.frame     = CGRectMake(85, 25, 100, 40);
        nameLab.textColor = [UIColor redColor];
        nameLab.font      = [UIFont systemFontOfSize:25];
        [self addSubview:nameLab];
        
        limitInfoLab = [[UILabel alloc]init];
        limitInfoLab.frame = CGRectMake(190, 17, 125, 20);
        limitInfoLab.text  = @"投注截止剩余:";
        [self addSubview:limitInfoLab];
        
        
        timer = [NSTimer scheduledTimerWithTimeInterval:1 
                                                 target:self 
                                               selector:@selector(doTimer:)
                                               userInfo:nil 
                                                repeats:YES];
        
        limitTimeLab = [[UILabel alloc]init];
        limitTimeLab.frame = CGRectMake(170, 47, 155, 20);
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
    NSString* timeStr = @"2013-03-26 17:40:50";  
    NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];  
    [formatter setDateStyle:NSDateFormatterMediumStyle];  
    [formatter setTimeStyle:NSDateFormatterShortStyle];     
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];  
    [formatter setTimeZone:timeZone];
    
    NSDate *targetDate  = [formatter dateFromString:timeStr]; 
    time  = [targetDate timeIntervalSinceNow];
    time -= 1;
    int day    = (long)time / (24 * 60 * 60);
    int hour   = ((long)time % (24 * 60 * 60)) / (60 * 60); 
    int minute = ((long)time % (24 * 60 * 60)) % (60 * 60) / 60;
    int second = ((long)time % (24 * 60 * 60)) % (60 * 60) % 60;
    NSString *diffTimeStr = [NSString stringWithFormat:@"%d天:%d时:%d分:%d秒", day,hour,minute,second];
    limitTimeLab.text = diffTimeStr;
}

@end
