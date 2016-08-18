//
//  HandModel.m
//  HandCraft
//
//  Created by Mac on 16/8/11.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import "HandModel.h"

@implementation HandModel
- (HandModel *)initWithResult:(FMResultSet *)set{
    self = [super init];
    if (self) {
        self.name = [set stringForColumn:@"name"];
        self.pws = [set stringForColumn:@"pws"];
    }
    return self;
    }

+ (HandModel *)ModelWithResult:(FMResultSet *)set{
    return [[self alloc]initWithResult:set];
}
@end
