//
//  DaRenHTTPManager.h
//  HandCraft
//
//  Created by Mac on 16/8/5.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DaRenHTTPManager : NSObject

+ (void)HTTPDaRenTwoModel:(void(^)(NSArray *array))myBlock;
@end
