//
//  MatchSetTableViewCell.h
//  Match
//
//  Created by leonardo on 2018/2/7.
//  Copyright © 2018年 leonardo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MatchSetTableViewCell : UITableViewCell
@property(strong,nonatomic)UILabel* firstLab ;
@property(strong,nonatomic)UILabel* secondLab ;

-(void)modelIndex:(NSInteger)index section:(NSInteger)section sytle:(NSInteger)type;
@end
