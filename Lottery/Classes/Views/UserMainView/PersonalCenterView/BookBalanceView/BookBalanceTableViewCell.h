//
//  BoolBalanceTableViewCell.h
//  Lottery
//
//  Created by lynn  lynn on 13-3-12.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BookBalanceTableViewCell : UITableViewCell
{
    UILabel     *timeInfoLab;
    UILabel     *timeLab;
    UILabel     *moneyInfoLab;
    UILabel     *moneyLab;
    UILabel     *phaseTypeInfoLab;
    UILabel     *phaseTypeLab;
    UILabel     *commentInfoLab;
    UILabel     *commentLab;
}

@property (nonatomic, retain) UILabel   *timeInfoLab;
@property (nonatomic, retain) UILabel   *timeLab;
@property (nonatomic, retain) UILabel   *moneyInfoLab;
@property (nonatomic, retain) UILabel   *moneyLab;
@property (nonatomic, retain) UILabel   *phaseTypeInfoLab;
@property (nonatomic, retain) UILabel   *phaseTypeLab;
@property (nonatomic, retain) UILabel   *commentInfoLab;
@property (nonatomic, retain) UILabel   *commentLab;
@end
