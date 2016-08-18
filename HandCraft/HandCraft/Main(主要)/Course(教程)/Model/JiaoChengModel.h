//
//  JiaoChengModel.h
//  HandCraft
//
//  Created by Mac on 16/8/6.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JiaoChengModel : NSObject
@property (nonatomic, copy) NSString *hand_id;

@property (nonatomic, copy) NSString *host_pic_color;

@property (nonatomic, copy) NSString *bg_color; // 背景颜色

@property (nonatomic, copy) NSString *collect; // 收藏

@property (nonatomic, copy) NSString *subject; // 标题

@property (nonatomic, copy) NSString *view; // 人气

@property (nonatomic, copy) NSString *user_id;

@property (nonatomic, copy) NSString *host_pic; // 背景图片

@property (nonatomic, copy) NSString *user_name; // 昵称

@property (nonatomic, copy) NSString *last_id; // 下一页标记

- (id)initWithBuXiangXie:(NSDictionary *)dic;
+ (id)createWithBuXiangXie:(NSDictionary *)dic;






@end
