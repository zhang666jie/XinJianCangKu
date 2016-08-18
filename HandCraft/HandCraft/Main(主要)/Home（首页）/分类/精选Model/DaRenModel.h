//
//  DaRenModel.h
//  HandCraft
//
//  Created by Mac on 16/8/5.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DaRenModel : NSObject
@property (nonatomic,copy)NSString *avatar;
@property (nonatomic,copy)NSString *course_count;
@property (nonatomic,copy)NSString *course_time;
@property (nonatomic,strong)NSArray *list;
@property (nonatomic,copy)NSString *hand_id;
@property (nonatomic,copy)NSString *nick_name;
@property (nonatomic,copy)NSString *opus_count;
@property (nonatomic,copy)NSString *tb_url;
@property (nonatomic,copy)NSString *user_id;
@property (nonatomic,copy)NSString *video_count;

//- (id)initWithDaRenModel:(NSDictionary *)dic;
//+ (id)createWithDaRenModel:(NSDictionary *)dic;
@end
