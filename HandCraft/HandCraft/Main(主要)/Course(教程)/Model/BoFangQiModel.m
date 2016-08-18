//
//  BoFangQiModel.m
//  HandCraft
//
//  Created by Mac on 16/8/10.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import "BoFangQiModel.h"

@implementation BoFangQiModel
- (id)initWithBoFangQi:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
+ (id)createWithBoFangQi:(NSDictionary *)dic{
    return [[self alloc]initWithBoFangQi:dic];
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

@end
