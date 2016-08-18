//
//  TwoCollectionReusableView.m
//  HandCraft
//
//  Created by Mac on 16/8/3.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import "TwoCollectionReusableView.h"

@implementation TwoCollectionReusableView
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self label];
    }
    return self;
}
- (void)label{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, kMainW, 50)];
    label.text = @"----------------------热门专题-----------------------";
    [self addSubview:label];
}
@end
