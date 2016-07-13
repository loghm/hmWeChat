//
//  MeViewController.m
//  hmWechat
//
//  Created by king_hm on 16/2/6.
//  Copyright © 2016年 king_hm. All rights reserved.
//

#import "MeViewController.h"
#import "UISize.h"
#import "MeTableViewCell.h"
#import "PersonalModel.h"

@interface MeViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation MeViewController {
    UITableView *MeTableView;
    
    NSArray *dataArr;
    NSArray *ImageArr;
    //模型
    PersonalModel *model;
}

-(instancetype)init {
    if (self = [super init]) {
        dataArr = @[@[@""], @[@"相册", @"收藏", @"钱包", @"卡包"], @[@"表情"], @[@"设置"]];
        ImageArr = @[@[@""], @[@"me_photo", @"me_collect", @"me_money", @"me_collect"], @[@"MoreExpressionShops"], @[@"me_setting"]];
        model = [[PersonalModel alloc] init];
        model.avatarStr = @"profession";
        model.nickName = @"小明";
        model.weChatNum = @"1234556";

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self UIInit];
}

- (void)UIInit {
    MeTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)style:UITableViewStyleGrouped];
    MeTableView.backgroundColor = [UIColor colorWithRed:240.0/255 green:239.0/255 blue:245.0/255 alpha:1];
    MeTableView.delegate = self;
    MeTableView.dataSource = self;
    //调整下分割线的位置。
    //    FoundTableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    [self.view addSubview:MeTableView];
    
}


#pragma mark - tableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return dataArr.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *arr = dataArr[section];
    return arr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        MeTableViewCell *cell = [MeTableViewCell cellWithTableView:tableView];
        //模型调用方法
        [cell setModel:model];
        return cell;
    }else {
    static NSString *identity = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identity];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identity];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    NSLog(@"cellForRow调用了");
    
    return cell;
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.imageView.image = [UIImage imageNamed:ImageArr[indexPath.section][indexPath.row]];
    cell.textLabel.text = dataArr[indexPath.section][indexPath.row];
    NSLog(@"willDisplayCell调用了");
    /** 更改cell的颜色*/
    //    cell.backgroundColor = indexPath.row % 2 ? [UIColor colorWithRed:234/255.0f green: 235/255.0f blue:239/255.0f alpha: 1.0] : [UIColor colorWithRed:226/255.0f green: 226/255.0f blue:232/255.0f alpha: 1.0];
    //    cell.textLabel.backgroundColor = [UIColor clearColor];
    //    cell.detailTextLabel.backgroundColor = [UIColor clearColor];
}


//设置row高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return UIRateHeight(177);
    } else {
    return 43;
    }
}

//设置头视图高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 15;
    }
    return 10;
}

//设置脚视图高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
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
