//
//  Version.m
//  HandCraft
//
//  Created by Mac on 16/8/2.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import "Version.h"

@implementation Version
+ (UIViewController *)chooseRootVC{
    UIViewController *vc = nil;
    NSDictionary *dic = [[NSBundle mainBundle]infoDictionary];
    NSString *curversion = dic[@"CFBundleShortVersionString"];
    NSString *oldversion = [[NSUserDefaults standardUserDefaults]objectForKey:@"curVersion"];
    if ([curversion isEqualToString:oldversion]) {
        vc = [[ExcessiveViewController alloc]init];
        
    }else{
        [[NSUserDefaults standardUserDefaults]setObject:curversion forKey:@"curVersion"];
        vc = [[ADVersionCollectionViewController alloc]init];
        
    }
    return vc;

}
@end
