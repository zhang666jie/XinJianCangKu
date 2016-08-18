//
//  FeatureModel.h
//  HandCraft
//
//  Created by Mac on 16/8/3.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FeatureModel : NSObject
@property (nonatomic,copy)NSString *pic;
@property (nonatomic,copy)NSString *host_pic;
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *mob_h5_url;
@property (nonatomic,copy)NSString *c_name;
@property (nonatomic,copy)NSString *c_status;
@property (nonatomic,copy)NSString *c_time;
@property (nonatomic,copy)NSString *m_logo;
@property (nonatomic,copy)NSString *id;
@property (nonatomic,copy)NSString *c_id;



- (id)initWithFeatureModel:(NSDictionary *)dic;
+ (id)createWithFeatureModel:(NSDictionary *)dic;
@end
