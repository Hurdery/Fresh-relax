//
//  MatchSuggestViewController.m
//  Match
//
//  Created by leonardo on 2018/2/7.
//  Copyright © 2018年 leonardo. All rights reserved.
//

#import "MatchSuggestViewController.h"
#import "UIView+Toast.h"
#import "JZYMPlaceHolderTV.h"
#define JZYMScreenHeight [UIScreen mainScreen].bounds.size.height
#define JZYMScreenWidth [UIScreen mainScreen].bounds.size.width
@interface MatchSuggestViewController ()<UITextViewDelegate>

@end

@implementation MatchSuggestViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden  = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem * leftBar=  [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back-B"] style:UIBarButtonItemStylePlain target:self action:@selector(leftClick:)];
    self.navigationItem.leftBarButtonItem = leftBar;
    
    UIBarButtonItem * rightBar=  [[UIBarButtonItem alloc]initWithTitle:@"Submit" style:UIBarButtonItemStylePlain target:self action:@selector(rightClick:)];
    self.navigationItem.rightBarButtonItem = rightBar;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
   JZYMPlaceHolderTV* bodyTF = [[JZYMPlaceHolderTV alloc]initWithFrame:CGRectMake(20, 65+15, JZYMScreenWidth-40, 168)];
    bodyTF.delegate = self;
    bodyTF.placeholder = @"What's wrong with that? Tell us all about it.";

    bodyTF.font = [UIFont fontWithName:@"PingFangSC-Light"size:12];
    bodyTF.textColor = [UIColor lightGrayColor];
    bodyTF.backgroundColor = [UIColor whiteColor];
    bodyTF.returnKeyType = UIReturnKeyDefault;
    bodyTF.layer.borderWidth =1;
    bodyTF.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [self.view addSubview:bodyTF];
    
    JZYMPlaceHolderTV*emailTF = [[JZYMPlaceHolderTV alloc]initWithFrame:CGRectMake(20, 65+15+178, JZYMScreenWidth-40, 41)];
    emailTF.delegate = self;
    emailTF.placeholder = @"Leave your email so that we can give you feedback faster.";
    emailTF.font = [UIFont fontWithName:@"PingFangSC-Light"size:12];
    emailTF.textColor = [UIColor lightGrayColor];
    emailTF.backgroundColor = [UIColor whiteColor];
    emailTF.returnKeyType = UIReturnKeyDefault;
    emailTF.layer.borderWidth =1;
    emailTF.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [self.view addSubview:emailTF];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
-(void)rightClick:(UIBarButtonItem*)sender{
    [self.view makeToast:@"Submitted successfully"];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.navigationController popViewControllerAnimated:YES];
    });

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
