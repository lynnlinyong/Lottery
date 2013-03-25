//
//  HistoryBetTableCell.h
//  Lottery
//
//  Created by lynn on 13-3-25.
//
//

#import <UIKit/UIKit.h>

@interface HistoryBetTableCell : UITableViewCell
{
    UIImageView     *imgIconView;
    UILabel         *nameLab;
    UILabel         *phaseLab;
}

@property (nonatomic,retain) UILabel  *nameLab;
@property (nonatomic,retain) UILabel  *phaseLab;
@property (nonatomic,retain) UIImage  *imgIconView;
@end
