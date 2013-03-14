//
//  LotteryTableViewCell.m
//  Lottery
//
//  Created by lynn  lynn on 13-3-14.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "LotteryTableViewCell.h"

@implementation LotteryTableViewCell
@synthesize iconImgView;
@synthesize nameLab;
@synthesize phaseLab;
@synthesize timeLab;
@synthesize curNumberLab;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        iconImgView = [[UIImageView alloc]init];
        iconImgView.image = [UIImage imageNamed:@"lottery_icon"];
        iconImgView.frame = CGRectMake(5, 15, 40, 40);
        [self addSubview:iconImgView];
        
        nameLab = [[UILabel alloc]init];
        nameLab.textColor = [UIColor redColor];
        nameLab.font = [UIFont systemFontOfSize:18];
        nameLab.frame = CGRectMake(45, 0, 80, 30);
        [self addSubview:nameLab];
        
        phaseLab = [[UILabel alloc]init];
        phaseLab.font  = [UIFont systemFontOfSize:14];
        phaseLab.frame = CGRectMake(115, 5, 105, 20);
        [self addSubview:phaseLab];
        
        timeLab  = [[UILabel alloc]init];
        timeLab.font  = [UIFont systemFontOfSize:14];
        timeLab.frame = CGRectMake(220, 5, 105, 20);
        [self addSubview:timeLab];
        
        curNumberLab = [[UILabel alloc]init];
        curNumberLab.frame = CGRectMake(45, 35, 260, 20);
        curNumberLab.textAlignment = UITextAlignmentCenter;
        [self addSubview:curNumberLab];
    }
    return self;
}

- (void) dealloc
{
    [iconImgView    release];
    [nameLab        release];
    [phaseLab       release];
    [timeLab        release];
    [curNumberLab   release];
    [super dealloc];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
