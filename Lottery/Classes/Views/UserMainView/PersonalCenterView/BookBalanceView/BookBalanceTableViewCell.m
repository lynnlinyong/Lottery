//
//  BoolBalanceTableViewCell.m
//  Lottery
//
//  Created by lynn  lynn on 13-3-12.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "BookBalanceTableViewCell.h"

@implementation BookBalanceTableViewCell
@synthesize timeInfoLab;
@synthesize timeLab;
@synthesize moneyLab;
@synthesize moneyInfoLab;
@synthesize phaseTypeLab;
@synthesize phaseTypeInfoLab;
@synthesize commentLab;
@synthesize commentInfoLab;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        timeInfoLab = [[UILabel alloc]init];
        timeInfoLab.text  = @"日期:";
        timeInfoLab.frame = CGRectMake(5, 5, 60, 20);
        timeInfoLab.textAlignment = UITextAlignmentCenter;
        timeInfoLab.font =  [UIFont fontWithName:@"Helvetica-Bold" size:18];
        [self addSubview:timeInfoLab];
        
        timeLab = [[UILabel alloc]init];
        timeLab.frame = CGRectMake(60, 5, 250, 20);
        timeLab.font  =  [UIFont fontWithName:@"Helvetica-Bold" size:18];
        [self addSubview:timeLab];
        
        moneyInfoLab = [[UILabel alloc]init];
        moneyInfoLab.text  = @"金额";
        moneyInfoLab.frame = CGRectMake(10, 30, 40, 20);
        moneyInfoLab.textAlignment = UITextAlignmentCenter;
        [self addSubview:moneyInfoLab];
        
        moneyLab = [[UILabel alloc]init];
        moneyLab.frame = CGRectMake(10, 55, 40, 20);
        moneyLab.textAlignment = UITextAlignmentCenter;
        [self addSubview:moneyLab];
        
        phaseTypeInfoLab = [[UILabel alloc]init];
        phaseTypeInfoLab.text = @"奖金类型";
        phaseTypeInfoLab.textAlignment = UITextAlignmentCenter;
        phaseTypeInfoLab.frame = CGRectMake(90, 30, 100, 20);
        [self addSubview:phaseTypeInfoLab];
        
        phaseTypeLab = [[UILabel alloc]init];
        phaseTypeLab.textAlignment = UITextAlignmentCenter;
        phaseTypeLab.frame = CGRectMake(90, 55, 100, 20);
        [self addSubview:phaseTypeLab];
        
        commentInfoLab = [[UILabel alloc]init];
        commentInfoLab.text  = @"备注";
        commentInfoLab.frame = CGRectMake(200, 30, 100, 20);
        commentInfoLab.textAlignment = UITextAlignmentCenter;
        [self addSubview:commentInfoLab];
        
        commentLab = [[UILabel alloc]init];
        commentLab.frame = CGRectMake(200, 55, 100, 20);
        commentLab.textAlignment = UITextAlignmentCenter;
        [self addSubview:commentLab];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

- (void) dealloc
{
    [timeLab            release];
    [timeInfoLab        release];
    [moneyInfoLab       release];
    [moneyLab           release];
    [phaseTypeInfoLab   release];
    [phaseTypeLab       release];
    [commentInfoLab     release];
    [commentLab         release];
    [super dealloc];
}
@end
