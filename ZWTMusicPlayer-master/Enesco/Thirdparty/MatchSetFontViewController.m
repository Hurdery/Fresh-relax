//
//  MatchRightVC.m
//  Match
//
//  Created by leonardo on 2018/2/7.
//  Copyright © 2018年 leonardo. All rights reserved.
//

#import "MatchSetFontViewController.h"
#import "MatchSetTableViewCell.h"
#define JZYMScreenHeight [UIScreen mainScreen].bounds.size.height
#define JZYMScreenWidth [UIScreen mainScreen].bounds.size.width

@interface MatchSetFontViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView * commontTab;
}
@end

@implementation MatchSetFontViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden  = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem * leftBar=  [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back-B"] style:UIBarButtonItemStylePlain target:self action:@selector(leftClick:)];
    self.navigationItem.leftBarButtonItem = leftBar;
    
    
    [self creatTab];
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
            return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * reuseIdentifier = @"MatchSetTableViewCell";
    MatchSetTableViewCell  * collectCell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!collectCell) {
        collectCell = [[MatchSetTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    [collectCell modelIndex:indexPath.row section:indexPath.section sytle:1];
    return collectCell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row==0) {
        
        [[NSNotificationCenter defaultCenter]postNotificationName:@"Large" object:nil];
        
        [[NSUserDefaults standardUserDefaults ]setObject:@"1" forKey:@"fontSize"];
        
    }else if (indexPath.row==1){
        [[NSNotificationCenter defaultCenter]postNotificationName:@"Medium" object:nil];
        [[NSUserDefaults standardUserDefaults ]setObject:@"2" forKey:@"fontSize"];


    }else{
        [[NSNotificationCenter defaultCenter]postNotificationName:@"Small" object:nil];
        [[NSUserDefaults standardUserDefaults ]setObject:@"3" forKey:@"fontSize"];

    }
    
    [self.navigationController popViewControllerAnimated:YES];
    
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
