//
//  MatchColllectTableViewCell.h
//  Match
//
//  Created by leonardo on 2018/2/8.
//  Copyright © 2018年 leonardo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MatchColllectTableViewCell : UITableViewCell
@property(strong,nonatomic)UILabel* firstLab ;
@property(strong,nonatomic)UILabel* secondLab ;
-(void)configureText:(NSString *)mystr time:(NSString *)time;
@end
