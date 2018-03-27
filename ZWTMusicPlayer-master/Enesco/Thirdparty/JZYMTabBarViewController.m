//
//  JZYMTabBarViewController.m
//  YiMian
//  Created by jiezi on 17/7/3.
//  Copyright © 2017年 JieZi. All rights reserved.

#import "JZYMTabBarViewController.h"
#import "MatchCenterVC.h"
#import "MusicListViewController.h"
@interface JZYMTabBarViewController ()<UITabBarControllerDelegate>
@property (nonatomic, strong) MusicListViewController *musicListVC;

@end
@implementation JZYMTabBarViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
 
    [self setUpChildViewControllers];

}
-(void)setUpChildViewControllers{
   MatchCenterVC * cirlcleVC = [[MatchCenterVC alloc]init];
    MusicListViewController * musicVC = [[MusicListViewController alloc]init];
    
         [self addChileVcWithTitle:@"Pavilion" vc:cirlcleVC  imageName:@"收藏" selImageName:@"圈子-f-1"];
          [self addChileVcWithTitle:@"Enjoyment" vc:musicVC  imageName:@"收藏" selImageName:@"动态-f-2"];
    
  }

- (void)addChileVcWithTitle:(NSString *)title vc:(UIViewController *)vc imageName:(NSString *)imageName selImageName:(NSString *)selImageName {
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    [vc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    NSMutableDictionary *selectedTextAttrs = [NSMutableDictionary dictionary];
    selectedTextAttrs[NSForegroundColorAttributeName] =[UIColor brownColor];
    selectedTextAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    [vc.tabBarItem setTitleTextAttributes:selectedTextAttrs forState:UIControlStateSelected];
    [vc.tabBarItem setTitle:title];
    [vc.tabBarItem setImage: [[UIImage imageNamed:imageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [vc.tabBarItem setSelectedImage:[[UIImage imageNamed:selImageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    UINavigationController *navVc = [[UINavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:navVc];
}
@end
