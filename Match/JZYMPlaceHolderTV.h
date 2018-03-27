//
//  JZYMPlaceHolderTV.h
//  YiMian
//
//  Created by jiezi on 2017/7/7.
//  Copyright © 2017年 JieZi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JZYMPlaceHolderTV : UITextView
@property (nonatomic, strong) UILabel * placeHolderLabel;

@property (nonatomic, copy) NSString * placeholder;

@property (nonatomic, strong) UIColor * placeholderColor;

- (void)textChanged:(NSNotification * )notification;
@end
