//
//  BaseModel.h
//  HandCraft
//
//  Created by Mac on 16/8/8.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject
@property (nonatomic,copy) NSString *num_iid;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *picurl;
@property (nonatomic,copy) NSString *price;
@property (nonatomic,copy) NSString *yh_price;
@property (nonatomic,copy) NSString *shop_type;
@property (nonatomic,copy) NSString *sum;
@property (nonatomic,copy) NSString *open_iid;
@property (nonatomic,copy) NSString *cover_pic;

@end
