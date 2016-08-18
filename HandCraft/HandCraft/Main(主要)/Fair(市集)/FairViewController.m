//
//  FairViewController.m
//  HandCraft
//
//  Created by Mac on 16/8/3.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import "FairViewController.h"

@interface FairViewController ()
@property (nonatomic,strong)GPSuperTiltleView *titleView;
@property (nonatomic,strong)NSArray *childVcArray;
@end

@implementation FairViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self addTitleView];
    [self addChildVc];
    [self addConterView];
    
}
- (void)addTitleView
{
    NSArray *titleS = @[@"材料",@"成品"];
    GPSuperTiltleView *titleView = [[GPSuperTiltleView alloc]initWithChildControllerS: titleS];
    self.titleView = titleView;
    self.navigationItem.titleView = titleView;
}
- (void)addChildVc
{
    CaiLiaoViewController *meturVc = [[CaiLiaoViewController alloc]init];
    ChengPinViewController *goodsVc = [[ChengPinViewController alloc]init];
    self.childVcArray = @[meturVc,goodsVc];
    [self addChildViewController:meturVc];
    [self addChildViewController:goodsVc];
}
- (void)addConterView
{
    __weak typeof(self) weakSelf = self;
    
    GPContainerView *conterView = [[GPContainerView alloc]initWithChildControllerS:self.childVcArray selectBlock:^(int index) {
        [weakSelf.titleView updateSelecterToolsIndex:index];
    }];
    [self.view addSubview:conterView];
    conterView.sd_layout.spaceToSuperView(UIEdgeInsetsZero);
}


@end
