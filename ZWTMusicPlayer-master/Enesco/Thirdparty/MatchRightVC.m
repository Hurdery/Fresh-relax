//
//  MatchRightVC.m
//  Match
//
//  Created by leonardo on 2018/2/7.
//  Copyright © 2018年 leonardo. All rights reserved.
//

#import "MatchRightVC.h"
#import "MatchSetTableViewCell.h"
#import "MatchSetFontViewController.h"
#import"MatchSuggestViewController.h"
#import "UIView+Toast.h"
#import<SVProgressHUD.h>
#import "MatchAboutViewController.h"
#import "MatchCollectViewController.h"
#define JZYMScreenHeight [UIScreen mainScreen].bounds.size.height
#define JZYMScreenWidth [UIScreen mainScreen].bounds.size.width

@interface MatchRightVC ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView * commontTab;
}
@end

@implementation MatchRightVC

-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    [commontTab reloadData];

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
    commontTab = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, JZYMScreenWidth, JZYMScreenHeight) style:1];
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



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    if (section==0) {
        return 1;
    }else if (section==1){
    
        return 2;
    }else{
        return 2;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0001;
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
    [collectCell modelIndex:indexPath.row section:indexPath.section sytle:0];
    return collectCell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section==0) {
        
        MatchCollectViewController *  pushVC = [[MatchCollectViewController alloc]init];
        [self.navigationController pushViewController:pushVC animated:YES];
        
    }else if (indexPath.section==1)
    {
        if (indexPath.row==0) {
            
            MatchSetFontViewController *  pushVC = [[MatchSetFontViewController alloc]init];
            [self.navigationController pushViewController:pushVC animated:YES];
            
        }
    else     if (indexPath.row==1) {
            
            MatchSuggestViewController *  pushVC = [[MatchSuggestViewController alloc]init];
            [self.navigationController pushViewController:pushVC animated:YES];
            
        }
        
    }else if (indexPath.section==2)
    {
        if (indexPath.row==0) {
            [SVProgressHUD showWithStatus:@"waitting..."];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                [SVProgressHUD showSuccessWithStatus:@"Clear success"];
                
                [SVProgressHUD dismiss];
                
            });

        }else{
        
            MatchAboutViewController *  pushVC = [[MatchAboutViewController alloc]init];
            [self.navigationController pushViewController:pushVC animated:YES];
        }
        
        
    }

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
