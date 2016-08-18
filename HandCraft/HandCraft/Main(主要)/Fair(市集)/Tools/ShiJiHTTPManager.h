//
//  ShiJiHTTPManager.h
//  HandCraft
//
//  Created by Mac on 16/8/7.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KeyModel.h"
#import "ShuZuModel.h"
@interface ShiJiHTTPManager : NSObject
+(void)fariDataWithParms:(KeyModel *)parmer success:(void(^)(ShuZuModel *fariData))success failuer:(void(^)(NSError *error))failuer;

+(void)fariMoreDataWithParms:(KeyModel *)parmer success:(void(^)(NSArray *topicDataS))success failuer:(void(^)(NSError *error))failuer;

@end
