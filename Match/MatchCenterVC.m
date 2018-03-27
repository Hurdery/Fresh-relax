//
//  MatchCenterVC.m
//  Match
//
//  Created by leonardo on 2018/2/7.
//  Copyright © 2018年 leonardo. All rights reserved.
//

#import "MatchCenterVC.h"
#import "MatchRightVC.h"
#import "LLKeyValueStore.h"
#import "User.h"
#define JZYMScreenHeight [UIScreen mainScreen].bounds.size.height
#define JZYMScreenWidth [UIScreen mainScreen].bounds.size.width

@interface MatchCenterVC ()
{
    UILabel * textLab;
    NSString *currentStr;
    NSString *insertTime;

}
@end

@implementation MatchCenterVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Pavilion";
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(judgeFont1) name:@"Large" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(judgeFont2) name:@"Medium" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(judgeFont3) name:@"Small" object:nil];

    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem * leftBar=  [[UIBarButtonItem alloc]initWithTitle:@"Set" style:UIBarButtonItemStylePlain target:self action:@selector(setClick:)];
    self.navigationItem.rightBarButtonItem = leftBar;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    [formatter setDateFormat:@"MM"];
    
    //现在时间,你可以输出来看下是什么格式
    
    
    NSDateFormatter *formatter1 = [[NSDateFormatter alloc] init];
    
    // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    [formatter1 setDateFormat:@"d"];

    
    NSDate *datenow = [NSDate date];
    
    //----------将nsdate按formatter格式转成nsstring
    
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    
    NSString *currentTimeString1 = [formatter1 stringFromDate:datenow];

    NSLog(@"currentTimeString =  %@--%@",currentTimeString,currentTimeString1);
    
    
    if ([currentTimeString isEqualToString:@"02"]) {
        currentTimeString = @"On February";
    } else if ([currentTimeString isEqualToString:@"03"]) {
        currentTimeString = @"On March";
    }else if ([currentTimeString isEqualToString:@"04"]) {
        currentTimeString = @"On April";
    }
    
    
    
    UILabel  * ymdLab = [[UILabel alloc]initWithFrame:CGRectMake((JZYMScreenWidth-100)/2, 80, 100, 20)];
    ymdLab.text=[NSString stringWithFormat:@"%@  %@",currentTimeString,currentTimeString1];
    insertTime =[NSString stringWithFormat:@"%@  %@",currentTimeString,currentTimeString1];
    ymdLab.textAlignment=1;
    ymdLab.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:ymdLab];
    
    NSArray * textAry = @[@"Men are like wine - some turn to vinegar, but the best improve with age. ",@"The supreme happiness of life is the conviction that we are loved.",@"People become attached to their burdens sometimes more than the burdens are attached to them.",@"Shoot for the moon. Even if you miss, you'll land among the stars.",@"What sculpture is to a block of marble, education is to the soul.",@"Spread love everywhere you go. Let no one ever come to you without leaving happier.",@"Everything negative-pressure,challenges-is all an opportunity for me to rise.",@"Men are nearly always willing to believe what they wish.",@"Man cannot discover new oceans unless he has courage to lose sight of the shore.",@"Towering genius disdains a beaten path. It seeks regions hitherto unexplored.",@"Life without love is like a tree without blossoms or fruit.",@"If I should meet you.After long years.How should I greet you? With silence and tears.",@"Procrastination is the thief of time."];
    
    NSString * myStr = textAry[ arc4random() % textAry.count];
    
    currentStr = myStr;
    
    textLab = [[UILabel alloc]initWithFrame:CGRectMake(10, 100, JZYMScreenWidth-20, 100)];
    textLab.numberOfLines = 0;
    
    NSMutableParagraphStyle *paraStyle01 = [[NSMutableParagraphStyle alloc] init];
    paraStyle01.alignment = NSTextAlignmentLeft;  //对齐
    paraStyle01.headIndent = 0.0f;//行首缩进
    //参数：（字体大小17号字乘以2，34f即首行空出两个字符）
    paraStyle01.firstLineHeadIndent = 20;//首行缩进
    paraStyle01.tailIndent = 0.0f;//行尾缩进
    paraStyle01.lineSpacing = 10.0f;//行间距
    
    NSAttributedString *attrText = [[NSAttributedString alloc] initWithString:myStr attributes:@{NSParagraphStyleAttributeName:paraStyle01}];
    
   textLab.attributedText = attrText;
    
//    textLab.text =textAry[ arc4random() % textAry.count];
    textLab.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:textLab];
    
    
    UIView * sepLine = [[UIView alloc]initWithFrame:CGRectMake(0, JZYMScreenHeight-230, JZYMScreenWidth, 1)];
    sepLine.backgroundColor = [UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:239.0/255.0 alpha:1];
    [self.view addSubview:sepLine];
    
    UIButton * collectBtn = [UIButton buttonWithType:0];
    collectBtn.frame = CGRectMake(JZYMScreenWidth-80, JZYMScreenHeight-200, 22, 22);
    [collectBtn setImage:[UIImage imageNamed:@"收藏"] forState:0];
    [collectBtn setImage:[UIImage imageNamed:@"收藏-F"] forState:1<<2];
    [collectBtn addTarget:self action:@selector(collectClick:) forControlEvents:1<<6];
    
    [self.view addSubview:collectBtn];
    
    
}
-(void)collectClick:(UIButton*)sender{
    sender.selected = !sender.selected;

    NSLog(@"currentStr==%@",currentStr);
    
    User * user = [[User alloc]init];
    user.user_name = currentStr;
    user.user_account = insertTime;
    [user save];
    
    
//    [[LLKeyValueStore  shareStore]putString:currentStr withId:@"collect" intoTable:@"match"];
//    [[LLKeyValueStore  shareStore]putString:insertTime withId:@"collectTime" intoTable:@"match"];

    
}

-(void)judgeFont1{

    textLab.font = [UIFont systemFontOfSize:23];

}
-(void)judgeFont2{
    textLab.font = [UIFont systemFontOfSize:20];

    
}-(void)judgeFont3{
    textLab.font = [UIFont systemFontOfSize:17];

    
}

-(void)setClick:(UIBarButtonItem*)sender{

    [self.navigationController pushViewController:[[MatchRightVC alloc ]init] animated:YES];
    
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
