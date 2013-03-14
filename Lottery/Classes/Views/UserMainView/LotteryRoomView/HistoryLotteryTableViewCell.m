//
//  HistoryLotteryTableViewCell.m
//  Lottery
//
//  Created by lynn  lynn on 13-3-14.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "HistoryLotteryTableViewCell.h"

@implementation HistoryLotteryTableViewCell
@synthesize timeLab;
@synthesize nameLab;
@synthesize phaseLab;
@synthesize curNumberLab;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        nameLab       = [[UILabel alloc]init];
        nameLab.frame = CGRectMake(0, 5, 94, 20);
        nameLab.font  = [UIFont fontWithName:@"Helvetica-Bold" size:18];
        [self addSubview:nameLab];
        
        phaseLab       = [[UILabel alloc]init];
        phaseLab.frame = CGRectMake(94, 5, 94, 20);
        phaseLab.font  = [UIFont systemFontOfSize:14];
        [self addSubview:phaseLab];
        
        timeLab        = [[UILabel alloc]init];
        timeLab.frame  = CGRectMake(210, 5, 94, 20); 
        timeLab.font   = [UIFont systemFontOfSize:14];
        [self addSubview:timeLab];
        
        curNumberLab = [[UILabel alloc]init];
        curNumberLab.frame = CGRectMake(0, 30, 320, 20);
        curNumberLab.textAlignment = UITextAlignmentCenter;
        [self addSubview:curNumberLab];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) dealloc
{
    [timeLab        release];
    [nameLab        release];
    [phaseLab       release];
    [curNumberLab   release];
    [super dealloc];
}

@end
