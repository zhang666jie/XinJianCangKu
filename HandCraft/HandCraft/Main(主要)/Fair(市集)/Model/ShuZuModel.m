//
//  ShuZuModel.m
//  HandCraft
//
//  Created by Mac on 16/8/8.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import "ShuZuModel.h"

@implementation ShuZuModel
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"hot" : [HotModel class],
             @"best" : [BaseModel class],
             @"topic" : [ShangModel class],
             };
}

@end
