//
//  HTTPManager.m
//  HandCraft
//
//  Created by Mac on 16/8/3.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import "HTTPManager.h"

@implementation HTTPManager
//第一个区上的两个cell
+ (void)HTTPFeatured:(void(^)(NSArray *array))myBlock{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"c"] = @"index";
    params[@"a"] = @"indexNewest";
    params[@"vid"] = @"18";
    [manager GET:@"http://m.shougongke.com/index.php" parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        NSArray *arr = responseObject[@"data"][@"advance"];
        
        
        NSMutableArray *a = [NSMutableArray array];
        
        for (NSDictionary *dic in arr) {
            FeatureModel *model = [FeatureModel createWithFeatureModel:dic];
            
            [a addObject:model];
        }
        if (myBlock) {
            myBlock(a);
        }

        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error-----%@",error.localizedDescription);
    }];
   
}
//第二个区上的cell
+ (void)HTTPFeaturedTopPic:(void(^)(NSArray *array))myBlock{
  
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"c"] = @"index";
    params[@"a"] = @"indexNewest";
    params[@"vid"] = @"18";
    [manager GET:@"http://m.shougongke.com/index.php" parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
       // NSLog(@"%@",responseObject);
        NSArray *arr = responseObject[@"data"][@"hotTopic"];
        
        
        NSMutableArray *a = [NSMutableArray array];
        
        for (NSDictionary *dic in arr) {
            FeatureTwoModel *obj = [FeatureModel createWithFeatureModel:dic];
            
            [a addObject:obj];
        }
        if (myBlock) {
            myBlock(a);
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error-----%@",error.localizedDescription);
    }];
    
}
//轮番图上的
+ (void)HTTPFeaturedLunFanTu:(void(^)(NSArray *array))myBlock{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"c"] = @"index";
    params[@"a"] = @"indexNewest";
    params[@"vid"] = @"18";
    [manager GET:@"http://m.shougongke.com/index.php" parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
       
        
        NSArray *arr = responseObject[@"data"][@"slide"];
        
        
        NSMutableArray *a = [NSMutableArray array];
        
        for (NSDictionary *dic in arr) {
            FeatureTwoModel *obj = [FeatureModel createWithFeatureModel:dic];
            
            [a addObject:obj];
        }
        if (myBlock) {
            myBlock(a);
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error-----%@",error.localizedDescription);
    }];
    
}
//第一个区头上的请求
+ (void)HTTPFeaturedBtn:(void(^)(NSArray *array))myBlock{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"c"] = @"index";
    params[@"a"] = @"indexNewest";
    params[@"vid"] = @"18";
    [manager GET:@"http://m.shougongke.com/index.php" parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        NSArray *arr = responseObject[@"data"][@"navigation"];
        
        
        NSMutableArray *a = [NSMutableArray array];
        
        for (NSDictionary *dic in arr) {
            FeatureTwoModel *obj = [FeatureModel createWithFeatureModel:dic];
            
            [a addObject:obj];
        }
        if (myBlock) {
            myBlock(a);
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error-----%@",error.localizedDescription);
    }];
    
}
//活动界面的请求
+ (void)HTTPFeaturedEvent:(void(^)(NSArray *array))myBlock with:(NSString *)num{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"c"] = @"Course";
    params[@"a"] = @"activityList";
    params[@"vid"] = @"18";
    params[@"id"] = num;
    [manager GET:@"http://m.shougongke.com/index.php" parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
       // NSLog(@"%@",responseObject);
        
        NSArray *arr = responseObject[@"data"];
        
        
        NSMutableArray *a = [NSMutableArray array];
        
        for (NSDictionary *dic in arr) {
            FeatureModel *obj = [FeatureModel createWithFeatureModel:dic];
            
            [a addObject:obj];
        }
        if (myBlock) {
            myBlock(a);
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error-----%@",error.localizedDescription);
    }];
    
}
//很多个界面的那个请求
+ (void)HTTPFeaturedManager:(void(^)(NSArray *array))myBlock with:(NSString *)num{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"c"] = @"Shiji";
    params[@"a"] = @"topicListS";
    params[@"vid"] = @"18";
    params[@"page"] = @"material";
    params[@"tag_id"] = num;
    [manager GET:@"http://m.shougongke.com/index.php" parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
         NSLog(@"%@",responseObject);
        
        NSArray *arr = responseObject[@"data"];
        
        
        NSMutableArray *a = [NSMutableArray array];
        
        for (NSDictionary *dic in arr) {
            FeatureTwoModel *obj = [FeatureTwoModel createWithFeatureModel:dic];
            
            [a addObject:obj];
        }
        if (myBlock) {
            myBlock(a);
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error-----%@",error.localizedDescription);
    }];
    
}




@end
