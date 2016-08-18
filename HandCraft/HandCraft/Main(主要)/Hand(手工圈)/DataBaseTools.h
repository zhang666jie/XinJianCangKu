//
//  DataBaseTools.h
//  HandCraft
//
//  Created by Mac on 16/8/11.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataBaseTools : NSObject
+ (void)createDataBaseMessage;
+ (void)insertIntoDatabase:(NSString *)name with:(NSString *)pws;
+ (NSMutableArray *)selectAllDatabaseTool;
@end
