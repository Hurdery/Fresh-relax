
//
//  MatchSetTableViewCell.m
//  Match
//
//  Created by leonardo on 2018/2/7.
//  Copyright © 2018年 leonardo. All rights reserved.
//

#import "MatchSetTableViewCell.h"

#define JZYMScreenHeight [UIScreen mainScreen].bounds.size.height
#define JZYMScreenWidth [UIScreen mainScreen].bounds.size.width

@implementation MatchSetTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self drawCell];
    }
    return self;
}
-(void)drawCell{

    UILabel  * headLab = [[UILabel alloc]initWithFrame:CGRectMake(20,10, 180, 30)];
    self.firstLab = headLab;
    headLab.text= @"See the collection";
    headLab.font = [UIFont systemFontOfSize:16];
    [self addSubview:headLab];
    
    
    UIImageView * rightImg = [[UIImageView alloc]initWithFrame:CGRectMake(JZYMScreenWidth-30, 20, 8, 10)];
    rightImg.image = [UIImage imageNamed:@"右箭头"];
    [self addSubview:rightImg];
    
    
    UILabel  * detailLab = [[UILabel alloc]initWithFrame:CGRectMake(JZYMScreenWidth-90,10, 60, 30)];
    detailLab.text= @"Small";
    detailLab.textAlignment= 2;
    self.secondLab =detailLab;
    detailLab.font = [UIFont systemFontOfSize:13];
    [self addSubview:detailLab];
    
}
-(void)modelIndex:(NSInteger)index section:(NSInteger)section sytle:(NSInteger)type{
    
    if (type==0)
    {
        if (index==0&&section==0) {
        self.secondLab.hidden = YES;
    }else if(index==0&&section==1){
        
        self.secondLab.hidden = NO;
        self.firstLab.text  = @"Set the font";
        
        NSString *fontSize = [[NSUserDefaults standardUserDefaults]objectForKey:@"fontSize"];
        if ([fontSize isEqualToString:@"1"]) {
            self.secondLab.text = @"Large";
        }else if ([fontSize isEqualToString:@"2"]){
            self.secondLab.text = @"Medium";
        }else{
            self.secondLab.text = @"Small";
        }
        
    }else if(index==1&&section==1){
        self.secondLab.hidden = YES;
        self.firstLab.text  = @"User feedback";
    }else if(index==0&&section==2){
        
        self.secondLab.hidden = YES;
        self.firstLab.text  = @"Clear the cache";
    }else if(index==1&&section==2){
        
        self.secondLab.hidden = YES;
        self.firstLab.text  = @"About Pavilion";
    }

    }
    else
    {
        self.secondLab.hidden = YES;
        self.firstLab.text = @[@"Large",@"Medium",@"Small"][index];
    
    }
    
    
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
