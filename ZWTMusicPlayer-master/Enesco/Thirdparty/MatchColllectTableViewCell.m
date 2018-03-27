
//
//  MatchSetTableViewCell.m
//  Match
//
//  Created by leonardo on 2018/2/7.
//  Copyright © 2018年 leonardo. All rights reserved.
//

#import "MatchColllectTableViewCell.h"

#define JZYMScreenHeight [UIScreen mainScreen].bounds.size.height
#define JZYMScreenWidth [UIScreen mainScreen].bounds.size.width

@implementation MatchColllectTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self drawCell];
    }
    return self;
}
-(void)drawCell{
    
    UILabel  * headLab = [[UILabel alloc]initWithFrame:CGRectMake(20,10, JZYMScreenWidth-40, 60)];
    self.firstLab = headLab;
    headLab.numberOfLines =0;
    headLab.text= @"See the collection";
    headLab.font = [UIFont systemFontOfSize:14];
    [self addSubview:headLab];
    
    
    UILabel  * detailLab = [[UILabel alloc]initWithFrame:CGRectMake(JZYMScreenWidth-160,60, 150, 20)];
    detailLab.textAlignment= 2;
    self.secondLab =detailLab;
    detailLab.font = [UIFont systemFontOfSize:13];
    [self addSubview:detailLab];
    
}
-(void)configureText:(NSString *)mystr time:(NSString *)time{

    self.firstLab.text = mystr;
    self.secondLab.text = time;

}
   - (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
