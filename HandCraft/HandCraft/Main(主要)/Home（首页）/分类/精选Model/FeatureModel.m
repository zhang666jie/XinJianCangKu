//
//  FeatureModel.m
//  HandCraft
//
//  Created by Mac on 16/8/3.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import "FeatureModel.h"

@implementation FeatureModel
- (id)initWithFeatureModel:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
+ (id)createWithFeatureModel:(NSDictionary *)dic{
    return [[self alloc]initWithFeatureModel:dic];
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
@end
