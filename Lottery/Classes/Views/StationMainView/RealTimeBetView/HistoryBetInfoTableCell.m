//
//  HistoryBetInfoTableCell.m
//  Lottery
//
//  Created by lynn on 13-3-25.
//
//

#import "HistoryBetInfoTableCell.h"

@implementation HistoryBetInfoTableCell
@synthesize userNameLab;
@synthesize buyInfoLab;
@synthesize betTimeLab;
@synthesize ptTickedLab;
@synthesize projLab;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        userNameLab = [[UILabel alloc]init];
        userNameLab.frame = CGRectMake(10, 0, 310, 20);
        userNameLab.textAlignment = UITextAlignmentLeft;
        [self addSubview:userNameLab];
        
        buyInfoLab  = [[UILabel alloc]init];
        buyInfoLab.frame = CGRectMake(10, 25, 310, 20);
        buyInfoLab.textAlignment = UITextAlignmentLeft;
        [self addSubview:buyInfoLab];
        
        betTimeLab  = [[UILabel alloc]init];
        betTimeLab.frame = CGRectMake(10, 50, 310, 20);
        betTimeLab.textAlignment = UITextAlignmentLeft;
        [self addSubview:betTimeLab];
        
        ptTickedLab = [[UILabel alloc]init];
        ptTickedLab.frame = CGRectMake(10, 75, 310, 20);
        ptTickedLab.textAlignment = UITextAlignmentLeft;
        [self addSubview:ptTickedLab];
        
        projLab     = [[UILabel alloc]init];
        projLab.frame = CGRectMake(10, 100, 310, 20);
        projLab.textAlignment = UITextAlignmentLeft;
        [self addSubview:projLab];
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
    [projLab        release];
    [userNameLab    release];
    [buyInfoLab     release];
    [betTimeLab     release];
    [ptTickedLab    release];
    [super dealloc];
}

@end
