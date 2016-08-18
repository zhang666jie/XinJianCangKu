//
//  FeatureTwoModel.h
//  HandCraft
//
//  Created by Mac on 16/8/3.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FeatureTwoModel : NSObject

@property (nonatomic, copy) NSString *mob_h5_url; // 链接

@property (nonatomic, copy) NSString *subject; // 标题

@property (nonatomic, copy) NSString *pic; // 图片

@property (nonatomic, copy) NSString *last_id; // 标记

@property (nonatomic, copy) NSString *template;

@property (nonatomic, copy) NSString *topic_id;
- (id)initWithFeatureModel:(NSDictionary *)dic;
+ (id)createWithFeatureModel:(NSDictionary *)dic;
@end
