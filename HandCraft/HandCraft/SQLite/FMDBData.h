//
//  FMDBData.h
//  HandCraft
//
//  Created by Mac on 16/8/9.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FMDBData : NSObject
+ (void)createFMDBDataSlide;
+ (void)createFMDBDataFour;
+ (void)createFMDBDataTwoCell;
+ (void)createFMDBDataCell;
+ (void)insertIntoDatabaseSlide_host_pic:(NSString *)slide_host_pic;
+ (void)insertIntoDatabasewithnavigation_name:(NSString *)navigation_name withnavigation_pic:(NSString *)navigation_pic;
+ (void)insertIntoDatabasewithadvance_pic:(NSString *)advance_pic;
+ (void)insertIntoDatabasewithhotTopic_pic:(NSString *)hotTopic_pic;
@end
