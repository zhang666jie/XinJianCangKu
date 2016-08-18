//
//  SectionHeaderCollectionReusableView.m
//  HandCraft
//
//  Created by Mac on 16/8/8.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import "SectionHeaderCollectionReusableView.h"

@implementation SectionHeaderCollectionReusableView
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 50, 30)];
        label.text = _titleStr;
        
        [self addSubview:label];
        
        UILabel*ziLabel = [[UILabel alloc]initWithFrame:CGRectMake(kMainW-60, 10, 50, 30)];
        ziLabel.text = _subtitleStr;
       
          [self addSubview:ziLabel];
    }
    return self;
}

@end
