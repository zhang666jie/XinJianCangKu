//
//  DataBaseTools.m
//  HandCraft
//
//  Created by Mac on 16/8/11.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import "DataBaseTools.h"
static FMDatabase *db;
@implementation DataBaseTools
+ (void)createDataBaseMessage{
    NSLog(@"%@",NSHomeDirectory());
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/messageData.sqlite"];
    db = [FMDatabase databaseWithPath:path];
    if ([db open]) {
        [db executeUpdate:@"create table if not exists message (ID integer primary key autoincrement,name text not null,pws text not null)"];
        [db close];
    }
}
+ (void)insertIntoDatabase:(NSString *)name with:(NSString *)pws{
    [db open];
    [db executeUpdate:[NSString stringWithFormat:@"insert into message (name,pws) values ('%@','%@')",name,pws]];
    [db close];
}
+ (NSMutableArray *)selectAllDatabaseTool{
    [db open];
    FMResultSet *set = [db executeQuery:@"select * from message"];
    NSMutableArray *arr = [NSMutableArray array];
    while ([set next]) {
        HandModel *model = [HandModel ModelWithResult:set];
        [arr addObject:model];
    }
    [set close];
    [db close];
    return arr;
}
@end
