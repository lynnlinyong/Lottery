//
//  RealTimeBetTableCell.h
//  Lottery
//
//  Created by lynn on 13-3-25.
//
//

#import <UIKit/UIKit.h>

@interface RealTimeBetTableCell : UITableViewCell
{
    UILabel  *nameInfoLab;
    UILabel  *nameLab;
    UILabel  *typeInfoLab;
    UILabel  *typeLab;
    
    UILabel  *projInfoLab;
    UILabel  *proj1Lab;
    UILabel  *proj2Lab;
    
    UIButton *stateBtn;
    UILabel  *stateLab;
}

@property (nonatomic,retain) UIButton  *stateBtn;
@property (nonatomic,retain) UILabel   *stateLab;
@property (nonatomic,retain) UILabel   *nameInfoLab;
@property (nonatomic,retain) UILabel   *nameLab;
@property (nonatomic,retain) UILabel   *typeInfoLab;
@property (nonatomic,retain) UILabel   *typeLab;
@property (nonatomic,retain) UILabel   *projInfoLab;
@property (nonatomic,retain) UILabel   *proj1Lab;
@property (nonatomic,retain) UILabel   *proj2Lab;
@end
