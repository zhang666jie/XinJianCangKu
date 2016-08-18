//
//  FMDBData.m
//  HandCraft
//
//  Created by Mac on 16/8/9.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import "FMDBData.h"
static FMDatabase *db;
@implementation FMDBData
+ (void)createFMDBDataSlide{
    //NSLog(@"%@",NSHomeDirectory());
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/handCraftData.sqlite"];
    db = [FMDatabase databaseWithPath:path];
    if ([db open]) {
        [db executeUpdate:@"create table if not exists featuredSlide (ID integer primary key autoincrement,slide_host_pic text not null)"];
        [db close];
    }
    
}
+ (void)createFMDBDataFour{
    //NSLog(@"%@",NSHomeDirectory());
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/handCraftData.sqlite"];
    db = [FMDatabase databaseWithPath:path];
    if ([db open]) {
        [db executeUpdate:@"create table if not exists featuredFour (ID integer primary key autoincrement,navigation_name text not null,navigation_pic text not null)"];
        [db close];
    }
    
}
+ (void)createFMDBDataTwoCell{
    //NSLog(@"%@",NSHomeDirectory());
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/handCraftData.sqlite"];
    db = [FMDatabase databaseWithPath:path];
    if ([db open]) {
        [db executeUpdate:@"create table if not exists featuredTwoCell (ID integer primary key autoincrement,advance_pic text not null)"];
        [db close];
    }
    
}
+ (void)createFMDBDataCell{
    //NSLog(@"%@",NSHomeDirectory());
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/handCraftData.sqlite"];
    db = [FMDatabase databaseWithPath:path];
    if ([db open]) {
        [db executeUpdate:@"create table if not exists featuredCell (ID integer primary key autoincrement,hotTopic_pic text not null)"];
        [db close];
    }
    
}
+ (void)insertIntoDatabaseSlide_host_pic:(NSString *)slide_host_pic{
    [db open];
    [db executeUpdate:[NSString stringWithFormat:@"insert into featuredSlide (slide_host_pic) values ('%@')",slide_host_pic]];
    [db close];

}
+ (void)insertIntoDatabasewithnavigation_name:(NSString *)navigation_name withnavigation_pic:(NSString *)navigation_pic{
    [db open];
    [db executeUpdate:[NSString stringWithFormat:@"insert into featuredFour (navigation_name,navigation_pic) values ('%@','%@')",navigation_name,navigation_pic]];
    [db close];

    
}
+ (void)insertIntoDatabasewithadvance_pic:(NSString *)advance_pic{
    [db open];
    [db executeUpdate:[NSString stringWithFormat:@"insert into featuredTwoCell (advance_pic) values ('%@')",advance_pic]];
    [db close];

}
+ (void)insertIntoDatabasewithhotTopic_pic:(NSString *)hotTopic_pic{
    [db open];
    [db executeUpdate:[NSString stringWithFormat:@"insert into featuredCell (hotTopic_pic) values ('%@')",hotTopic_pic]];
    [db close];

}


@end
