//
//  BaseViewController.h
//  hmWechat
//
//  Created by king_hm on 16/2/6.
//  Copyright © 2016年 king_hm. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  这个控制器用于设计多个子类控制器都需要实现的方法，封装起来，方便利用。
 */
@interface BaseViewController : UIViewController

/**
 *  设置两个设置navigation rightitem的图片以及文字的方法。
 */
-(void)addRightNavigationItemWithImageName:(NSString *)imageName andSelector:(SEL)sel;

@end
