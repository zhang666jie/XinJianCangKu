//
//  HTTPManager.h
//  HandCraft
//
//  Created by Mac on 16/8/3.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTTPManager : NSObject
+ (void)HTTPFeatured:(void(^)(NSArray *array))myBlock;
+ (void)HTTPFeaturedTopPic:(void(^)(NSArray *array))myBlock;
+ (void)HTTPFeaturedLunFanTu:(void(^)(NSArray *array))myBlock;
+ (void)HTTPFeaturedBtn:(void(^)(NSArray *array))myBlock;
+ (void)HTTPFeaturedEvent:(void(^)(NSArray *array))myBlock with:(NSString *)num;
+ (void)HTTPFeaturedManager:(void(^)(NSArray *array))myBlock with:(NSString *)num;

@end
