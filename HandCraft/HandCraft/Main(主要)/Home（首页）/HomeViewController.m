//
//  HomeViewController.m
//  HandCraft
//
//  Created by Mac on 16/8/3.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupView];
    [self addAllChildVc];
}
- (void)setupView
{
    // 设置标题栏样式
    [self setUpTitleEffect:^(UIColor *__autoreleasing *titleScrollViewColor, UIColor *__autoreleasing *norColor, UIColor *__autoreleasing *selColor, UIFont *__autoreleasing *titleFont, CGFloat *titleHeight) {
        *titleScrollViewColor = [UIColor whiteColor];
        *norColor = [UIColor darkGrayColor];
        *selColor = [UIColor redColor];
        *titleHeight = 40;
    }];
    // 设置下标
    [self setUpUnderLineEffect:^(BOOL *isShowUnderLine, BOOL *isDelayScroll, CGFloat *underLineH, UIColor *__autoreleasing *underLineColor) {
        
        *isShowUnderLine = YES;
        *underLineColor = [UIColor redColor];
    }];
}
- (void)addAllChildVc
{
    FeaturedCollectionViewController *featureVc = [[FeaturedCollectionViewController alloc]init];
    featureVc.title = @"精选";
    [self addChildViewController:featureVc];
    
    FocusCollectionViewController *focusVc = [[FocusCollectionViewController alloc]init];
    focusVc.title = @"关注";
    [self addChildViewController:focusVc];
    
    DaRenCollectionViewController *daRenVc = [[DaRenCollectionViewController alloc]init];
    daRenVc.title = @"达人";
    [self addChildViewController:daRenVc];
    
    EventCollectionViewController *eventVc = [[EventCollectionViewController alloc]init];
    eventVc.title = @"活动";
    [self addChildViewController:eventVc];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
