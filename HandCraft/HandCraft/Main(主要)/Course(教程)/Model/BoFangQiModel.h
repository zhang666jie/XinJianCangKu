//
//  BoFangQiModel.h
//  HandCraft
//
//  Created by Mac on 16/8/10.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BoFangQiModel : NSObject
@property (nonatomic,copy)NSString *subject;
@property (nonatomic,copy)NSString *content;
@property (nonatomic,copy)NSString *host_pic;
@property (nonatomic,copy)NSString *material;
@property (nonatomic,copy)NSString *tools;
@property (nonatomic,copy)NSString *uid;
@property (nonatomic,copy)NSString *url;
- (id)initWithBoFangQi:(NSDictionary *)dic;
+ (id)createWithBoFangQi:(NSDictionary *)dic;

@end
