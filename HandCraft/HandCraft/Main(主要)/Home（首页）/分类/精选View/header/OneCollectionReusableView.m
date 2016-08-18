//
//  OneCollectionReusableView.m
//  HandCraft
//
//  Created by Mac on 16/8/3.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import "OneCollectionReusableView.h"
#import "UIButton+WebCache.h"


@interface OneCollectionReusableView ()<SDCycleScrollViewDelegate>{
    NSMutableArray *arr;
    NSMutableArray *slideArr;
    NSMutableArray *btnArr;
    NSMutableArray *titleArr;
}


@end




@implementation OneCollectionReusableView
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        arr = [NSMutableArray array];
        slideArr = [NSMutableArray array];
        btnArr = [NSMutableArray array];
        titleArr = [NSMutableArray array];
        [self createScroll];
        [self HTTP];
    }
    return self;
}
- (void)HTTP{
    [HTTPManager HTTPFeaturedBtn:^(NSArray *array) {
        
        
        for (FeatureModel *model in array) {
            
            [btnArr addObject:model.pic];
            [titleArr addObject:model.name];
            [FMDBData insertIntoDatabasewithnavigation_name:model.name withnavigation_pic:model.pic];
        }
        [self itemsCustom];
       
    }];
    
}
- (void)itemsCustom{
    
    
   
    
    for (NSInteger i = 0; i<3; i++) {
          UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(32+95*i, 215, 50, 50);
        [button addTarget:self action:@selector(goRunNext:) forControlEvents:UIControlEventTouchUpInside];
        [button sd_setBackgroundImageWithURL:[NSURL URLWithString:btnArr[i]] forState:UIControlStateNormal];
        
     
         
        [self addSubview:button];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(32+100*i, 265, 60, 30)];
        label.text = titleArr[i];
                [self addSubview:label];
        
        
    }
    UIButton *button01 = [UIButton buttonWithType:UIButtonTypeCustom];
    button01.frame = CGRectMake(32+290, 215, 50, 50);
    [button01 addTarget:self action:@selector(goRunNextFour:) forControlEvents:UIControlEventTouchUpInside];
    [button01 setBackgroundImage:[UIImage imageNamed:@"qiandao@3x"] forState:UIControlStateNormal];
    
    [self addSubview:button01];
    
    [self addSubview:button01];
    
    UILabel *label01 = [[UILabel alloc]initWithFrame:CGRectMake(32+300, 265, 60, 30)];
    label01.text = @"签到";
    [self addSubview:label01];
    

    
}
- (void)createScroll{
    
    [HTTPManager HTTPFeaturedLunFanTu:^(NSArray *array) {
        [slideArr addObjectsFromArray:array];
        
        for (FeatureModel *model in slideArr) {
            
            [arr addObject:model.host_pic];
            [FMDBData insertIntoDatabaseSlide_host_pic:model.host_pic];
            
        }
        [self wuYuZhong];
        
        }];
}
- (void)wuYuZhong{
    SDCycleScrollView *sdScroll = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, kMainW, 200) delegate:self placeholderImage:[UIImage imageNamed:@"hohlknh"]];
    
    
    
    sdScroll.backgroundColor = [UIColor cyanColor];
    sdScroll.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    sdScroll.currentPageDotColor = [UIColor whiteColor];
    
        sdScroll.imageURLStringsGroup = arr;
    
    
    [self addSubview:sdScroll];

    
}
- (void)goRunNextFour:(UIButton *)sender{
    
    
    
}
- (void)goRunNext:(UIButton *)sender{
    
}

@end
