//
//  MyLotteryCell.m
//  Lottery
//
//  Created by lynn  lynn on 13-3-11.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "MyLotteryCell.h"

@implementation MyLotteryCell
@synthesize nameLab;
@synthesize phaseLab;
@synthesize moneyLab;
@synthesize moneyInfoLab;
@synthesize timeLab;
@synthesize timeInfoLab;
@synthesize rewardLab;
@synthesize rewardInfoLab;
@synthesize stateLab;
@synthesize stateInfoLab;
@synthesize lotteryImgView;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        lotteryImgView = [[UIImageView alloc]init];
        lotteryImgView.image = [UIImage imageNamed:@"lottery_icon"];
        lotteryImgView.frame = CGRectMake(10, 5, 40, 40);
        [self addSubview:lotteryImgView];
        
        nameLab = [[UILabel alloc]init];
        nameLab.frame = CGRectMake(5, 45, 60, 20);
        nameLab.textAlignment = UITextAlignmentCenter;
        [self addSubview:nameLab];
        
        phaseLab = [[UILabel alloc]init];
        phaseLab.frame = CGRectMake(55, 5, 120, 20);
        [self addSubview:phaseLab];
        
        moneyInfoLab = [[UILabel alloc]init];
        moneyInfoLab.text  = @"金额";
        moneyInfoLab.textAlignment = UITextAlignmentCenter;
        moneyInfoLab.frame = CGRectMake(80, 25, 40, 20);
        [self addSubview:moneyInfoLab];
        
        moneyLab = [[UILabel alloc]init];
        moneyLab.textAlignment = UITextAlignmentCenter;
        moneyLab.frame = CGRectMake(80, 45, 40, 20);
        [self addSubview:moneyLab];
        
        timeInfoLab = [[UILabel alloc]init];
        timeInfoLab.text  = @"时间:";
        timeInfoLab.frame = CGRectMake(180, 5, 60, 20);
        [self addSubview:timeInfoLab];
        
        timeLab = [[UILabel alloc]init];
        timeLab.frame = CGRectMake(220, 5, 150, 20);
        [self addSubview:timeLab];
        
        rewardInfoLab = [[UILabel alloc]init];
        rewardInfoLab.text  = @"奖金";
        rewardInfoLab.frame = CGRectMake(160, 25, 40, 20);
        rewardInfoLab.textAlignment = UITextAlignmentCenter;
        [self addSubview:rewardInfoLab];
        
        rewardLab = [[UILabel alloc]init];
        rewardLab.frame = CGRectMake(160, 45, 40, 20);
        rewardLab.textAlignment = UITextAlignmentCenter;
        [self addSubview:rewardLab];
        
        stateInfoLab = [[UILabel alloc]init];
        stateInfoLab.text  = @"状态";
        stateInfoLab.frame = CGRectMake(240, 25, 40, 20);
        stateInfoLab.textAlignment = UITextAlignmentCenter;
        [self addSubview:stateInfoLab];
        
        stateLab = [[UILabel alloc]init];
        stateLab.frame = CGRectMake(240, 45, 40, 20);
        stateLab.textAlignment = UITextAlignmentCenter;
        [self addSubview:stateLab];
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
    [nameLab        release];
    [phaseLab       release];
    [moneyLab       release];
    [moneyInfoLab   release];
    [timeLab        release];
    [timeInfoLab    release];
    [rewardLab      release];
    [rewardInfoLab  release];
    [stateLab       release];
    [stateInfoLab   release];
    [lotteryImgView release];
    [super dealloc];
}

@end
