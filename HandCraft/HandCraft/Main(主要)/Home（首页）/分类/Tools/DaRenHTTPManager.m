//
//  DaRenHTTPManager.m
//  HandCraft
//
//  Created by Mac on 16/8/5.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import "DaRenHTTPManager.h"

@implementation DaRenHTTPManager
//达人界面请求
+ (void)HTTPDaRenTwoModel:(void(^)(NSArray *array))myBlock{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"act"] = @"up";
    params[@"vid"] = @"18";
    
    [manager POST:@"http://m.shougongke.com/index.php?&c=Index&a=daren" parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSMutableArray *arr = [NSMutableArray array];
        arr = [DaRenModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"]];
        
        if (myBlock) {
            myBlock(arr);
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error-----%@",error.localizedDescription);
    }];
    
}


@end
