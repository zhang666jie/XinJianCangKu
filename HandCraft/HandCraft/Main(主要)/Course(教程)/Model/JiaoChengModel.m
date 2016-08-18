//
//  JiaoChengModel.m
//  HandCraft
//
//  Created by Mac on 16/8/6.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import "JiaoChengModel.h"

@implementation JiaoChengModel

- (id)initWithBuXiangXie:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
+ (id)createWithBuXiangXie:(NSDictionary *)dic{
    return [[self alloc]initWithBuXiangXie:dic];
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

@end
