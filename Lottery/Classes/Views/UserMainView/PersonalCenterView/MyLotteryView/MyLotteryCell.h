//
//  MyLotteryCell.h
//  Lottery
//
//  Created by lynn  lynn on 13-3-11.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyLotteryCell : UITableViewCell
{
    UIImageView     *lotteryImgView;
    UILabel         *nameLab;
    UILabel         *phaseLab;      //彩票期数
    UILabel         *moneyInfoLab;  
    UILabel         *moneyLab;
    UILabel         *timeInfoLab;
    UILabel         *timeLab;
    UILabel         *rewardInfoLab; //奖金
    UILabel         *rewardLab;
    UILabel         *stateInfoLab;  
    UILabel         *stateLab;
}

@property (nonatomic, retain) UILabel       *nameLab;
@property (nonatomic, retain) UILabel       *phaseLab;
@property (nonatomic, retain) UILabel       *moneyInfoLab;
@property (nonatomic, retain) UILabel       *moneyLab;
@property (nonatomic, retain) UILabel       *timeInfoLab;
@property (nonatomic, retain) UILabel       *timeLab;
@property (nonatomic, retain) UILabel       *rewardInfoLab;
@property (nonatomic, retain) UILabel       *rewardLab;
@property (nonatomic, retain) UILabel       *stateInfoLab;
@property (nonatomic, retain) UILabel       *stateLab;
@property (nonatomic, retain) UIImageView   *lotteryImgView;
@end
