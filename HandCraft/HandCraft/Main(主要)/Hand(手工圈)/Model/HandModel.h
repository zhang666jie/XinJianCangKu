//
//  HandModel.h
//  HandCraft
//
//  Created by Mac on 16/8/11.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HandModel : NSObject
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *pws;
- (HandModel *)initWithResult:(FMResultSet *)set;

+ (HandModel *)ModelWithResult:(FMResultSet *)set;

@end
