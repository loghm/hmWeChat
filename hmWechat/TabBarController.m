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

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    ChatViewController *chat = [[ChatViewController alloc] init];
    chat.title = @"微信";
    AddressBookViewController *addressBook = [[AddressBookViewController alloc] init];
    addressBook.title = @"通讯录";
    FoundViewController *found = [[FoundViewController alloc] init];
    found.title = @"发现";
    MeViewController *me = [[MeViewController alloc] init];
    me.title = @"我";
    self.viewControllers = @[[self getController:chat image:@"tabbar_chat_no" andselectedimage:@"tabbar_chat_yes"][self getController:addressBook image:@"tabbar_book_no" andselectedimage:@"tabbar_book_yes"][self getController:found image:@"tabbar_found_no" andselectedimage:@"tabbar_found_yes"][self getController:me image:@"tabbar_me_no" andselectedimage:@"tabbar_me_yes"]];
    
}

-(UITabBarController *)getController:(UIViewController *)controller image:(NSString *)imageName andselectedimage:(NSString *)selectImageName{
    
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
