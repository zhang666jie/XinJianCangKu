//
//  JiaoChengHTTPManager.m
//  HandCraft
//
//  Created by Mac on 16/8/6.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import "JiaoChengHTTPManager.h"

@implementation JiaoChengHTTPManager
+ (void)createJiaoChengHTTP:(void(^)(NSArray *array))myBlock{
    
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"c"] = @"Course";
    params[@"a"] = @"newCourseList";
    params[@"gcate"] =@"allcate";
    params[@"order"] = @"hot";
    params[@"vid"] = @"18";
    
    [manager GET:@"http://m.shougongke.com/index.php" parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
           
            
            NSArray *arr = responseObject[@"data"];
            
            
            NSMutableArray *a = [NSMutableArray array];
            
            for (NSDictionary *dic in arr) {
                JiaoChengModel *model = [JiaoChengModel createWithBuXiangXie:dic];
                
                [a addObject:model];
            }
            if (myBlock) {
                myBlock(a);
            }
            
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"error-----%@",error.localizedDescription);
        }];
        
    }
+ (void)createShiPinHTTP:(void(^)(NSArray *array))myBlock{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"c"] = @"Handclass";
    params[@"a"] = @"videoList";
    params[@"cate"] = @"0";
    params[@"page"] = @"1";
    params[@"vid"] = @"18";
    params[@"sort"] = @"1";
    params[@"price"] = @"0";
    [manager GET:@"http://m.shougongke.com/index.php" parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
        NSArray *arr = responseObject[@"data"];
        
        
        NSMutableArray *a = [NSMutableArray array];
        
        for (NSDictionary *dic in arr) {
            ShiPinModel *model = [ShiPinModel createWithBuXiangXie:dic];
            
            [a addObject:model];
        }
        if (myBlock) {
            myBlock(a);
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error-----%@",error.localizedDescription);
    }];
    
}
+ (void)createBoFangQiHTTP:(void(^)(NSArray *array))myBlock withInteger:(NSInteger)num{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    NSString *str = [NSString stringWithFormat:@"http://m.shougongke.com/index.php?c=Handclass&a=onlineVideo&id=%ld&vid=19",(long)num];
    [manager GET:str parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"responseObject-----%@",responseObject);
        NSArray *arr = responseObject[@"data"][@"video"];
//        for (NSDictionary *d in arr) {
//            
//        }
        
        
        
        NSLog(@"arr-------%@",arr);
        NSMutableArray *a = [NSMutableArray array];
        
        for (NSDictionary *dic in arr) {
            BoFangQiModel *model = [BoFangQiModel createWithBoFangQi:dic];
            
            [a addObject:model];
        }
        if (myBlock) {
            myBlock(a);
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error-----%@",error.localizedDescription);
    }];

}




@end
