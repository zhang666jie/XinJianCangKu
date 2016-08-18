//
//  HTTPTools.h
//  HandCraft
//
//  Created by Mac on 16/8/8.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTTPTools : NSObject
+ (void)get:(NSString *)url params:(NSDictionary *)params success:(void(^)(id))success failure: (void(^)(NSError *error))failure;
+ (void)post:(NSString *)url params:(NSDictionary *)params success:(void(^)(id))success
     failure: (void(^)(NSError *error))failure;

@end
