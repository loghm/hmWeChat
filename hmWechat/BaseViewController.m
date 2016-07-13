//
//  BaseViewController.m
//  hmWechat
//
//  Created by king_hm on 16/2/6.
//  Copyright © 2016年 king_hm. All rights reserved.
//

#import "BaseViewController.h"
#import "UISize.h"


@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUISetting];
}

#pragma mark - 
-(void)addRightNavigationItemWithImageName:(NSString *)imageName andSelector:(SEL)sel {
    UIButton *rightButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, UIRateWidth(68), UIRateWidth(62))];
    [rightButton setImage:[UIImage imageNamed:@"chat_addfriend"]forState:UIControlStateNormal];
    [rightButton addTarget:self action:sel forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem= rightItem;
}

/**
 *  返回取消渲染的image,渲染指的是是否对图像进行处理，imageWithRenderingMode方法中的枚举值，automatic是自动根据上下文渲染，original是使用图片的原始状态，不使用Tint color，template：模板，就是根据tint color对图片进行处理，不管图片的原始颜色。
 */
- (UIImage *)removeRendering:(NSString *)imageName
{
    UIImage * image = [UIImage imageNamed:imageName];
    //
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}


- (void)setUISetting {
    [self preferredStatusBarStyle];
    
}

//* 设置控制器的状态栏的字体为白色
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
