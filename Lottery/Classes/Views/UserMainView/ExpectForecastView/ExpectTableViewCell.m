//
//  ExpectTableViewCell.m
//  Lottery
//
//  Created by lynn  lynn on 13-3-11.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "ExpectTableViewCell.h"

@implementation ExpectTableViewCell
@synthesize nameLab;
@synthesize numberLab;
@synthesize lotteryImgView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        lotteryImgView = [[UIImageView alloc]init];
        lotteryImgView.image = [UIImage imageNamed:@"lottery_icon"];
        lotteryImgView.frame = CGRectMake(5, 12.5, 40, 40);
        [self addSubview:lotteryImgView];
        
        nameLab = [[UILabel alloc]init];
        nameLab.font      = [UIFont systemFontOfSize:25];
        nameLab.frame     = CGRectMake(45, 7.5, 270, 30);
        nameLab.textColor = [UIColor redColor];
        [self addSubview:nameLab];
        
        numberLab = [[UILabel alloc]init];
        numberLab.frame = CGRectMake(45, 40, 270, 30);
        [self addSubview:numberLab];
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
    [super dealloc];
    
    [nameLab   release];
    [numberLab release];
    [lotteryImgView release];
}

@end
