//
//  ShiJiHTTPManager.m
//  HandCraft
//
//  Created by Mac on 16/8/7.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import "ShiJiHTTPManager.h"

@implementation ShiJiHTTPManager
+(void)fariDataWithParms:(KeyModel *)parmer success:(void(^)(ShuZuModel *fariData))success failuer:(void(^)(NSError *error))failuer
{
    [HTTPBase getWithUrl:@"http://m.shougongke.com/index.php" param:parmer resultClass:[ShuZuModel class] success:success failure:failuer];
}
+(void)fariMoreDataWithParms:(KeyModel *)parmer success:(void(^)(NSArray *topicDataS))success failuer:(void(^)(NSError *error))failuer
{
    [HTTPBase getMoreWithUrl:@"http://m.shougongke.com/index.php" param:parmer resultClass:[ShangModel class] success:success failure:failuer];
}



@end
