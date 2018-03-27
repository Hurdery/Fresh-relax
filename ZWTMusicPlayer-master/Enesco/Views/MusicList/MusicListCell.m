//
//  MusicListCell.m
//  Enesco
//
//  Created by Aufree on 11/30/15.
//  Copyright © 2015 The EST Group. All rights reserved.
//

#import "MusicListCell.h"

@interface MusicListCell ()
@property (weak, nonatomic) IBOutlet UILabel *musicNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *musicTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *musicArtistLabel;
@property (weak, nonatomic) IBOutlet NAKPlaybackIndicatorView *musicIndicator;

#define JZYMScreenHeight [UIScreen mainScreen].bounds.size.height
#define JZYMScreenWidth [UIScreen mainScreen].bounds.size.width

@end

@implementation MusicListCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self drawCell];
    }
    return self;
}
-(void)drawCell{
    
    UILabel  * headLab = [[UILabel alloc]initWithFrame:CGRectMake(20,10, JZYMScreenWidth-40, 20)];
    self.firstLab = headLab;
    
    headLab.numberOfLines =0;
    headLab.text= @"See the collection";
    headLab.font = [UIFont systemFontOfSize:14];
    [self addSubview:headLab];
    
    
    UILabel  * detailLab = [[UILabel alloc]initWithFrame:CGRectMake(20,40, 150, 20)];
    detailLab.textAlignment= 0;
    self.secondLab =detailLab;
    detailLab.font = [UIFont systemFontOfSize:13];
    [self addSubview:detailLab];
    self.backgroundColor = [UIColor colorWithRed:125/255.0f green:117/255.0f blue:112/255.0f alpha:.1];
}

- (void)setMusicNumber:(NSInteger)musicNumber {
    _musicNumber = musicNumber;
    _musicNumberLabel.text = [NSString stringWithFormat:@"%ld", (long)musicNumber];
    if (musicNumber > 999) {
        _musicNumberLabel.font = [UIFont systemFontOfSize:13];
    }
}

- (void)setMusicEntity:(MusicEntity *)musicEntity {
    _musicEntity = musicEntity;
    self.firstLab.text = _musicEntity.name;
    self.secondLab.text = _musicEntity.artistName;
}

- (NAKPlaybackIndicatorViewState)state {
    return self.musicIndicator.state;
}

- (void)setState:(NAKPlaybackIndicatorViewState)state {
    self.musicIndicator.state = state;
    self.musicNumberLabel.hidden = (state != NAKPlaybackIndicatorViewStateStopped);
}

@end
