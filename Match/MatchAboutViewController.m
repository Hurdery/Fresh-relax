
//
//  MatchAboutViewController.m
//  Match
//
//  Created by leonardo on 2018/2/7.
//  Copyright © 2018年 leonardo. All rights reserved.
//

#import "MatchAboutViewController.h"

#define JZYMScreenHeight [UIScreen mainScreen].bounds.size.height
#define JZYMScreenWidth [UIScreen mainScreen].bounds.size.width

@interface MatchAboutViewController ()

@end

@implementation MatchAboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem * leftBar=  [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back-B"] style:UIBarButtonItemStylePlain target:self action:@selector(leftClick:)];
    self.navigationItem.leftBarButtonItem = leftBar;

    
    UIImageView * commanimage = [[UIImageView alloc]initWithFrame:CGRectMake((JZYMScreenWidth-64)/2, 65+24, 64, 64)];
    commanimage.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:commanimage];
    
    UILabel * ymLab = [[UILabel alloc]initWithFrame:CGRectMake((JZYMScreenWidth-100)/2, CGRectGetMaxY(commanimage.frame)+15, 100 ,17)];
    ymLab.textAlignment =1;
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_build = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    ymLab.text =[NSString stringWithFormat:@"Pavilion V%@",app_build] ;
    ymLab.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:ymLab];

    
    
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
