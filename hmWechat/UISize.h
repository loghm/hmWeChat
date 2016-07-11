//
//  UISize.h
//  hmWechat
//
//  Created by 黄明族 on 16/7/6.
//  Copyright © 2016年 king_hm. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
#define UIRateWidth(WIDTH) WIDTH / 750.0 * [[UIScreen mainScreen] bounds].size.width
#define UIRateHeight(HEIGHT) HEIGHT / 1334.0 * [[UIScreen mainScreen] bounds].size.height


@interface UISize : NSObject

@end
