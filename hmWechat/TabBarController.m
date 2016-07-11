//
//  TabBarController.m
//  hmWechat
//
//  Created by king_hm on 16/2/6.
//  Copyright © 2016年 king_hm. All rights reserved.
//

#import "TabBarController.h"
#import "AddressBookViewController.h"
#import "ChatViewController.h"
#import "FoundViewController.h"
#import "MeViewController.h"
#import "UISize.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [NSThread sleepForTimeInterval:3];
    
    ChatViewController *chat = [[ChatViewController alloc] init];
    chat.title = @"微信";
    AddressBookViewController *addressBook = [[AddressBookViewController alloc] init];
    addressBook.title = @"通讯录";
    FoundViewController *found = [[FoundViewController alloc] init];
    found.title = @"发现";
    MeViewController *me = [[MeViewController alloc] init];
    me.title = @"我";
    self.viewControllers = @[[self getController:chat image:@"tabbar_chat_no" andselectedimage:@"tabbar_chat_yes"],[self getController:addressBook image:@"tabbar_book_no" andselectedimage:@"tabbar_book_yes"], [self getController:found image:@"tabbar_found_no" andselectedimage:@"tabbar_found_yes"], [self getController:me image:@"tabbar_me_no" andselectedimage:@"tabbar_me_yes"]];
    self.tabBar.tintColor = [UIColor colorWithRed:9/255.0 green:187/255.0 blue:7/255.0 alpha:1];

}

//批量设置导航栏。
-(UINavigationController *)getController:(UIViewController *)controller image:(NSString *)imageName andselectedimage:(NSString *)selectImageName{

    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:controller];
    nav.tabBarItem = [[UITabBarItem alloc]initWithTitle:controller.title image:[self removeRendering:imageName] selectedImage:[self removeRendering:selectImageName]];
    
    return nav;
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
