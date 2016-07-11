//
//  MeTableViewCell.h
//  hmWechat
//
//  Created by 黄明族 on 16/7/6.
//  Copyright © 2016年 king_hm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonalModel.h"


@interface MeTableViewCell : UITableViewCell

@property (nonatomic, strong)PersonalModel *model;
/** 头像*/
@property (nonatomic, strong)UIImageView *avatarImageView;
/** 昵称*/
@property (nonatomic, strong)UILabel *nickNameLabel;
/** 微信号*/
@property (nonatomic, strong)UILabel *weChatNumLabel;
/** 二维码*/
@property (nonatomic, strong)UIImageView *dimentionCodeImageView;

+(instancetype)cellWithTableView:(UITableView *)tableView;


@end
