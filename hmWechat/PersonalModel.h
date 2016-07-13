//
//  PersonalModel.h
//  hmWechat
//
//  Created by 黄明族 on 16/7/6.
//  Copyright © 2016年 king_hm. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  “我”界面中第一个cell为自定义cell，需要从网络中获取数据，创建模型类。
 */
@interface PersonalModel : NSObject
/** 头像的url*/
@property (nonatomic, copy)NSString *avatarStr;
/** 昵称*/
@property (nonatomic, copy)NSString *nickName;
/** 微信号*/
@property (nonatomic, copy)NSString *weChatNum;

@end
