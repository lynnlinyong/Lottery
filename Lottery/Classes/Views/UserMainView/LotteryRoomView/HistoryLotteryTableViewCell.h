//
//  HistoryLotteryTableViewCell.h
//  Lottery
//
//  Created by lynn  lynn on 13-3-14.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HistoryLotteryTableViewCell : UITableViewCell
{
    UILabel     *nameLab;
    UILabel     *phaseLab;
    UILabel     *timeLab;
    UILabel     *curNumberLab;
}

@property (nonatomic, retain) UILabel   *nameLab;
@property (nonatomic, retain) UILabel   *phaseLab;
@property (nonatomic, retain) UILabel   *timeLab;
@property (nonatomic, retain) UILabel   *curNumberLab;
@end
