//
//  AddressBookViewController.m
//  hmWechat
//
//  Created by king_hm on 16/2/6.
//  Copyright © 2016年 king_hm. All rights reserved.
//

#import "AddressBookViewController.h"
#import "NSString+PinYin.h"
#import "UISize.h"

/**
 *  通讯录类
 *  需要实现的效果难点：排序以及搜索功能
 *  UI设计，界面布局包括一个tableview，和一个搜索框。tableview使用分组样式，上面四个cell为一个section，下面是多个section。
 *  排序功能：需要一个取得汉字首字母的类（三方）,需要区别的是，根据首字母分多个section，每个section需要一个组名，和这个组对应cell数据数组。我们需要从数据中分离出这两部分来。
 */


@interface AddressBookViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation AddressBookViewController {
    
    UITableView *addressBookTableView;
    /** 第一个section的数据数组*/
    NSArray *bookArr;
    /** 用户数据源数组*/
    NSArray *nameImageArr;
    /** 排列之后的数组*/
    NSMutableArray *dataArr;
    
}

-(instancetype)init {
    if (self = [super init]) {
        bookArr = @[@{@"title" : @"新的朋友", @"image" : @"plugins_FriendNotify"}, @{@"title" : @"群聊", @"image" : @"add_friend_icon_addgroup"}, @{@"title" : @"标签", @"image" : @"Contact_icon_ContactTag"}, @{@"title" : @"公众号", @"image" : @"add_friend_icon_offical"}];
        nameImageArr =  @[@{@"name" : @"阿三", @"imageName" : @"profession"}, @{@"name" : @"李四", @"imageName" : @"profession"}, @{@"name" : @"王五", @"imageName" : @"profession"}, @{@"name" : @"张五", @"imageName" : @"profession"}, @{@"name" : @"李明", @"imageName" :  @"profession"}, @{@"name" : @"小红", @"imageName" : @"profession"}, @{@"name" : @"范进", @"imageName" : @"profession"}, @{@"name" : @"曾三", @"imageName" : @"profession"}, @{@"name" : @"李一", @"imageName" : @"profession"}];
        dataArr = [[NSMutableArray alloc] init];
        
        
    }
    return self;
}


-(void)UIInit {
    addressBookTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    addressBookTableView.delegate = self;
    addressBookTableView.dataSource = self;
    [self.view addSubview:addressBookTableView];
    [self UINavigationInit];
}

-(void)UINavigationInit {
    [self addRightNavigationItemWithImageName:@"chat_addfriend" andSelector:@selector(clickBtn)];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self sorting];
    [self UIInit];
}



#pragma mark - tableviewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return dataArr.count+1;
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return bookArr.count;
    } else {
        NSDictionary *dic = dataArr[section-1];
        NSArray *arr = dic[@"arr"];
        return arr.count;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identity = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identity];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identity];
    }
    
    if (indexPath.section == 0) {
        NSDictionary *dictionary = [[NSDictionary alloc] init];
        dictionary = bookArr[indexPath.row];
        cell.imageView.image = [UIImage imageNamed:dictionary[@"image"]];
        cell.textLabel.text = dictionary[@"title"];
    } else {
       UIImage *image = [UIImage imageNamed:dataArr[indexPath.section-1][@"arr"][indexPath.row][@"imageName"]];
        //修改icon尺寸
        CGSize itemSize = CGSizeMake(UIRateWidth(36), UIRateWidth(36));
        UIGraphicsBeginImageContextWithOptions(itemSize, NO,0.0);
        CGRect imageRect = CGRectMake(0.0, 0.0, itemSize.width, itemSize.height);
        [image drawInRect:imageRect];
        cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
         cell.textLabel.text = dataArr[indexPath.section-1][@"arr"][indexPath.row][@"name"];
    }
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *sectionName = [[NSString alloc] init];
    if (section == 0) {
        return @"";
    } else {
        sectionName = dataArr[section-1][@"title"];
        return sectionName;
    }
}


//设置row高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UIRateHeight(112);
}



//设置头视图高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
//        return UIRateHeight(84);
        return 0;
    }
    return UIRateHeight(40);
}

//设置脚视图高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return UIRateHeight(0.01);
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section != 0)
    {
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, UIRateWidth(60), UIRateHeight(40))];
        
        NSDictionary * dic = dataArr[section - 1];
        
        label.text = [NSString stringWithFormat:@"   %@",dic[@"title"]];
        
        label.textAlignment = NSTextAlignmentLeft;
        
        label.font = [UIFont systemFontOfSize:10];
        
        label.textColor = [UIColor colorWithRed:141/255.0 green:141/255.0 blue:146/255.0 alpha:1];
        label.backgroundColor = [UIColor colorWithRed:241.0/255 green:240.0/255 blue:246.0/255 alpha:1];
        
        return label;
    }
    //搜索框， 将搜索框独立出来。不做为headerview
    else
    {
        
    }
    return nil;

}

-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    //索引背景颜色
    tableView.sectionIndexBackgroundColor = [UIColor clearColor];
    
    //索引颜色
    tableView.sectionIndexColor = [UIColor colorWithRed:82/255.0 green:82/255.0 blue:82/255.0 alpha:1];
    
    NSMutableArray * arr = [[NSMutableArray alloc]init];
    
    //加放大镜
    [arr addObject:UITableViewIndexSearch];
    //加入组名
    for (NSDictionary * dic in dataArr)
    {
        [arr addObject:dic[@"title"]];
    }
    return arr;
}
/*
设置headerview不移动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat sectionHeaderHeight = 50;
    if (scrollView.contentOffset.y <= sectionHeaderHeight && scrollView.contentOffset.y > 0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    } else {
        if (scrollView.contentOffset.y >= sectionHeaderHeight) {
            scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
        }
    }
}
*/


#pragma mark - 添加好友
-(void)clickBtn {
    NSLog(@"添加好友");
}


#pragma mark - 对数据进行排序
/**
 *  这里的逻辑是，将数据数组中的数据按照名字的首字母的大小进行排序，最终进入dataArr的形态是需要有两个信息，cell的数据以及当前的组名，属于哪一个的首字母组，使用一个个的dictionary，一个存储title，一个存储一个数组，数组中是该section中的数据，里面是一个个dictionary，存放着name，image。
 *
 *这里逻辑有些混乱
 *注意点：多个层级嵌套的时候，每个字典和数组的定义位置需要很多的讲究，否则容易造成多次嵌套多次计算。
 *
 */
-(void)sorting {
    for (char i = 'A'; i <= 'Z'; i++)
    {
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        NSMutableArray *arr = [[NSMutableArray alloc] init];
        NSString *sectionName = [NSString stringWithFormat:@"%c", i];
        for (int j = 0; j < nameImageArr.count; j++) {
            NSString *name = nameImageArr[j][@"name"];
            NSString *imageStr = nameImageArr[j][@"imageName"];
            //判断首字母
            if ([[self getFirstCharacter:name] isEqualToString:sectionName]) {
                NSDictionary *nameDic = @{@"name" : name, @"imageName" : imageStr};
                [arr addObject:nameDic];
            }
        }
        if (arr.count > 0 ) {
            [dic setObject:sectionName forKey:@"title"];
            [dic setObject:arr forKey:@"arr"];
            [dataArr addObject:dic];
        }
    }
    NSLog(@"dataArr:..%@",dataArr);
}
/** 获得首字母*/
-(NSString *)getFirstCharacter:(NSString *)astr {
    //转成了可变字符串
    NSMutableString *str = [NSMutableString stringWithString:astr];
    //先转换为带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformMandarinLatin,NO);
    //再转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformStripDiacritics,NO);
    //转化为大写拼音
    NSString *pinYin = [str capitalizedString];
    //获取并返回首字母
    return [pinYin substringToIndex:1];
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
