//
//  JiaoChengHTTPManager.h
//  HandCraft
//
//  Created by Mac on 16/8/6.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JiaoChengHTTPManager : NSObject
+ (void)createJiaoChengHTTP:(void(^)(NSArray *array))myBlock;
+ (void)createShiPinHTTP:(void(^)(NSArray *array))myBlock;

+ (void)createBoFangQiHTTP:(void(^)(NSArray *array))myBlock withInteger:(NSInteger)num;
@end
