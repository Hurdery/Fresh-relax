//
//  MatchRightVC.m
//  Match
//
//  Created by leonardo on 2018/2/7.
//  Copyright © 2018年 leonardo. All rights reserved.
//

#import "MatchCollectViewController.h"
#import "LLKeyValueStore.h"
#import "MatchSetTableViewCell.h"
#import "MatchColllectTableViewCell.h"
#import "User.h"
#define JZYMScreenHeight [UIScreen mainScreen].bounds.size.height
#define JZYMScreenWidth [UIScreen mainScreen].bounds.size.width

@interface MatchCollectViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView * commontTab;
    NSMutableArray * dataAry;
    NSMutableArray * timeAry;

}
@end

@implementation MatchCollectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem * leftBar=  [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back-B"] style:UIBarButtonItemStylePlain target:self action:@selector(leftClick:)];
    self.navigationItem.leftBarButtonItem = leftBar;
    
    [self creatTab];
    
    dataAry = [NSMutableArray array];
    timeAry = [NSMutableArray array];

 NSArray * myData=  [User findAll];
    
    [myData enumerateObjectsUsingBlock:^(User * user, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [dataAry addObject:user.user_name];
        [timeAry addObject:user.user_account];
    }];
    
    
//    dataAry  = [[LLKeyValueStore shareStore]getObjectById:@"collect" fromTable:@"match"];
//    timeAry  = [[LLKeyValueStore shareStore]getObjectById:@"collectTime" fromTable:@"match"];

    [commontTab reloadData];
}

-(void)creatTab
{
    commontTab = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, JZYMScreenWidth, JZYMScreenHeight-65) style:0];
    //    commontTab.backgroundColor = [UIColor blueColor];
    commontTab.delegate = self;
    commontTab.dataSource = self;
    //    commontTab.separatorStyle = UITableViewCellSeparatorStyleNone;
    commontTab.tableFooterView = [UIView new];
    [self.view addSubview:commontTab];
    
    commontTab.estimatedRowHeight = 0;
    
    commontTab.estimatedSectionHeaderHeight = 0;
    
    commontTab.estimatedSectionFooterHeight = 0;
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataAry.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * reuseIdentifier = @"MatchColllectTableViewCell";
    MatchColllectTableViewCell  * collectCell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!collectCell) {
        collectCell = [[MatchColllectTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }

    [collectCell configureText:dataAry[indexPath.row] time:timeAry[indexPath.row]];
    
    return collectCell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
}


-(void)leftClick:(UIBarButtonItem*)sender{
    [self.navigationController popViewControllerAnimated:YES];
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
