//
//  HistoryBetTableCell.m
//  Lottery
//
//  Created by lynn on 13-3-25.
//
//

#import "HistoryBetTableCell.h"

@implementation HistoryBetTableCell
@synthesize nameLab;
@synthesize phaseLab;
@synthesize imageView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        nameLab = [[UILabel alloc]init];
        nameLab.frame     = CGRectMake(45, 5, 100, 30);
        nameLab.textColor = [UIColor redColor];
        nameLab.font      = [UIFont systemFontOfSize:25];
        [self addSubview:nameLab];
        
        imgIconView = [[UIImageView alloc]init];
        imgIconView.frame = CGRectMake(5, 5, 40, 40);
        imgIconView.image = [UIImage imageNamed:@"lottery_icon.png"];
        [self addSubview:imgIconView];
        
        phaseLab = [[UILabel alloc]init];
        phaseLab.frame = CGRectMake(45, 40, 280, 20);
        [self addSubview:phaseLab];
        
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
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
    [nameLab     release];
    [phaseLab    release];
    [imgIconView release];
    [super dealloc];
}

@end
