//
//  User.m
//  FMDB封装
//
//  Created by Yang on 16/3/26.
//  Copyright © 2016年 Yang. All rights reserved.
//

#import "User.h"

@interface User ()
@property (nonatomic, copy) NSString *duty;

@end

@implementation User
+(NSArray *)transients
{
    return [NSArray arrayWithObjects:@"duty",nil];
}
@end
