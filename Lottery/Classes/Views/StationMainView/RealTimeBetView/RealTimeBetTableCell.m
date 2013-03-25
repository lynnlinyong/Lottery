//
//  RealTimeBetTableCell.m
//  Lottery
//
//  Created by lynn on 13-3-25.
//
//

#import "RealTimeBetTableCell.h"

@implementation RealTimeBetTableCell
@synthesize nameInfoLab;
@synthesize nameLab;
@synthesize typeInfoLab;
@synthesize typeLab;
@synthesize proj1Lab;
@synthesize proj2Lab;
@synthesize projInfoLab;
@synthesize stateBtn;
@synthesize stateLab;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        nameInfoLab = [[UILabel alloc]init];
        nameInfoLab.text  = @"姓名:";
        nameInfoLab.frame = CGRectMake(10, 0, 40, 20);
        nameInfoLab.textAlignment = UITextAlignmentRight;
        [self addSubview:nameInfoLab];
        
        nameLab = [[UILabel alloc]init];
        nameLab.frame = CGRectMake(55, 0, 200, 20);
        [self addSubview:nameLab];
        
        typeInfoLab = [[UILabel alloc]init];
        typeInfoLab.text  = @"类型:";
        typeInfoLab.frame = CGRectMake(10, 25, 40, 20);
        typeInfoLab.textAlignment = UITextAlignmentRight;
        [self addSubview:typeInfoLab];
        
        typeLab = [[UILabel alloc]init];
        typeLab.frame = CGRectMake(55, 25, 200, 20);
        [self addSubview:typeLab];
        
        projInfoLab = [[UILabel alloc]init];
        projInfoLab.text  = @"方案:";
        projInfoLab.frame = CGRectMake(10, 50, 40, 20);
        projInfoLab.textAlignment = UITextAlignmentRight;
        [self addSubview:projInfoLab];
        
        proj1Lab = [[UILabel alloc]init];
        proj1Lab.frame = CGRectMake(55, 50, 260, 20);
        [self addSubview:proj1Lab];
        
        proj2Lab = [[UILabel alloc]init];
        proj2Lab.frame = CGRectMake(55, 75, 260, 20);
        [self addSubview:proj2Lab];
        
        stateBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        stateBtn.frame = CGRectMake(260, 27.5, 60, 30);
        [stateBtn setTitle:@"确认出票"
                  forState:UIControlStateNormal];
        stateBtn.hidden = YES;
        [self addSubview:stateBtn];
        
        stateLab = [[UILabel alloc]init];
        stateLab.frame = CGRectMake(260, 27.5, 60, 20);
        stateLab.hidden = YES;
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
    [nameLab     release];
    [nameInfoLab release];
    
    [typeLab     release];
    [typeInfoLab release];
    
    [projInfoLab release];
    [proj1Lab    release];
    [proj2Lab    release];
    
    [stateLab    release];
    [super dealloc];
}

@end
