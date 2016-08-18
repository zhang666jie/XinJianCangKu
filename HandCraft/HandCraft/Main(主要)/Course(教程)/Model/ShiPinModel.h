//
//  ShiPinModel.h
//  HandCraft
//
//  Created by Mac on 16/8/6.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShiPinModel : NSObject
@property (nonatomic, assign) NSInteger uid;

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, copy) NSString *price;

@property (nonatomic, copy) NSString *host_pic; // 主图片

@property (nonatomic, copy) NSString *subject; // 主标题

@property (nonatomic, assign) NSInteger deadline;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, assign) NSInteger suggest;

@property (nonatomic, assign) NSInteger is_free;
- (id)initWithBuXiangXie:(NSDictionary *)dic;
+ (id)createWithBuXiangXie:(NSDictionary *)dic;


@end
