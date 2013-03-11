//
//  LetteryTableViewCell.h
//  Lottery
//
//  Created by lynn  lynn on 13-3-10.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LetteryTableViewCell : UITableViewCell
{
    UIImageView    *iconImgView;
    UILabel        *nameLab;
    UILabel        *limitInfoLab;
    UILabel        *limitTimeLab;
    NSTimeInterval time;
    NSTimer        *timer;
}

@property (nonatomic, retain) UILabel     *nameLab;
@property (nonatomic, retain) UILabel     *limitInfoLab;
@property (nonatomic, retain) UILabel     *limitTimeLab;
@property (nonatomic, retain) UIImageView *iconImgView;
@end
