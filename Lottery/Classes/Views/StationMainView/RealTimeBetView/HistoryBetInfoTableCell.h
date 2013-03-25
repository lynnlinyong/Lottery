//
//  HistoryBetInfoTableCell.h
//  Lottery
//
//  Created by lynn on 13-3-25.
//
//

#import <UIKit/UIKit.h>

@interface HistoryBetInfoTableCell : UITableViewCell
{
    UILabel  *userNameLab;
    UILabel  *buyInfoLab;
    UILabel  *betTimeLab;
    UILabel  *ptTickedLab;
    UILabel  *projLab;
}

@property (nonatomic,retain) UILabel  *userNameLab;
@property (nonatomic,retain) UILabel  *buyInfoLab;
@property (nonatomic,retain) UILabel  *betTimeLab;
@property (nonatomic,retain) UILabel  *ptTickedLab;
@property (nonatomic,retain) UILabel  *projLab;
@end
