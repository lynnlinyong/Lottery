//
//  ExpectTableViewCell.h
//  Lottery
//
//  Created by lynn  lynn on 13-3-11.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExpectTableViewCell : UITableViewCell
{
    UIImageView     *lotteryImgView;
    UILabel         *nameLab;
    UILabel         *numberLab;
}

@property (nonatomic, retain) UILabel           *nameLab;
@property (nonatomic, retain) UILabel           *numberLab;
@property (nonatomic, retain) UIImageView       *lotteryImgView;
@end
