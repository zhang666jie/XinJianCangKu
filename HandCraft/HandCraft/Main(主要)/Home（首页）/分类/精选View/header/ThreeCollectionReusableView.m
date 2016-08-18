//
//  ThreeCollectionReusableView.m
//  HandCraft
//
//  Created by Mac on 16/8/4.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import "ThreeCollectionReusableView.h"

@implementation ThreeCollectionReusableView
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self itemsCustom];
    }
    return self;
}
- (void)itemsCustom{
    for (NSInteger i = 0; i<4; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(32+100*i, 15, 50, 50);
        [button addTarget:self action:@selector(goRunNext:) forControlEvents:UIControlEventTouchUpInside];
        [button setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor yellowColor]];
        [self addSubview:button];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(32+100*i, 65, 50, 20)];
        label.text = @"";
        label.backgroundColor = [UIColor redColor];
        [self addSubview:label];
        

    }
    
}
- (void)goRunNext:(UIButton *)sender{
    
}
@end
