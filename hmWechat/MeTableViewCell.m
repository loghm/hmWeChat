//
//  MeTableViewCell.m
//  hmWechat
//
//  Created by 黄明族 on 16/7/6.
//  Copyright © 2016年 king_hm. All rights reserved.
//

#import "MeTableViewCell.h"
#import "UISize.h"
#import "Masonry.h"


@implementation MeTableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *identity = @"MeCell";
    MeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identity];
    if (cell == nil) {
        cell = [[MeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identity];
    }
    return cell;
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.nickNameLabel = [[UILabel alloc] init];
        self.weChatNumLabel = [[UILabel alloc] init];
        self.avatarImageView = [[UIImageView alloc] init];
        self.dimentionCodeImageView = [[UIImageView alloc] init];
        
        [self.contentView addSubview:self.avatarImageView];
        [self.contentView addSubview:self.dimentionCodeImageView];
        [self.contentView addSubview:self.nickNameLabel];
        [self.contentView addSubview:self.weChatNumLabel];
        
        self.avatarImageView.frame = CGRectMake(10, 15, 0.2*SCREEN_WIDTH, UIRateHeight(133));
     
        [self.nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).offset(20);
            make.left.equalTo(self.avatarImageView.mas_right).offset(10);
            make.width.mas_equalTo(0.5*SCREEN_WIDTH);
            make.height.mas_equalTo(20);
        }];
        [self.weChatNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.nickNameLabel.mas_bottom).offset(UIRateHeight(28));
            make.left.equalTo(self.avatarImageView.mas_right).offset(10);
            make.width.mas_equalTo(0.5*SCREEN_WIDTH);
            make.height.mas_equalTo(20);
        }];
        [self.dimentionCodeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.avatarImageView);
            make.right.equalTo(self.contentView).offset(-20);
            make.width.mas_equalTo(UIRateWidth(38));
            make.height.mas_equalTo(UIRateHeight(38));
        }];
        
       
        
    }
    return self;
}

-(void)setModel:(PersonalModel *)model {
    _model = model;
    self.avatarImageView.image = [UIImage imageNamed:model.avatarStr];
    self.nickNameLabel.text = model.nickName;
    self.weChatNumLabel.text = [NSString stringWithFormat:@"微信号：%@", model.weChatNum];
    self.dimentionCodeImageView.image = [UIImage imageNamed:@"setting_myQR"];
}




- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
