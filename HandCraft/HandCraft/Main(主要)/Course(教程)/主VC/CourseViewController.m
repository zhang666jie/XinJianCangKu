//
//  CourseViewController.m
//  HandCraft
//
//  Created by Mac on 16/8/3.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import "CourseViewController.h"

@interface CourseViewController ()
@property (nonatomic, weak) GPNavTitleView *titleView;
@property (nonatomic,strong)TuWenCollectionViewController *tuWenVC;
@property (nonatomic,strong)ShiPinCollectionViewController *shiPinVC;
@property (nonatomic,strong)OneCellViewController *zongVC;
@property (nonatomic, strong) NSArray *chidVcArray;
@end

@implementation CourseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
       self.navigationController.navigationBar.barTintColor = [UIColor redColor];

    GPNavTitleView *titleView = [[GPNavTitleView alloc]initWithFrame:CGRectMake(0, 0, kMainW*0.6, 44) block:^(UIButton *button) {
        
    }];
    self.titleView = titleView;
    self.navigationItem.titleView = titleView;
    self.tuWenVC = [[TuWenCollectionViewController alloc]init];
    self.shiPinVC = [[ShiPinCollectionViewController alloc]init];
    self.zongVC = [[OneCellViewController alloc]init];
    self.chidVcArray = @[self.tuWenVC,self.shiPinVC,self.zongVC];
    [self addChildViewController:self.tuWenVC];
    [self addChildViewController:self.shiPinVC];
    [self addChildViewController:self.zongVC];
    [self addConterView];
}
- (void)addConterView
{
       self.containView = [[GPContainerView alloc]initWithChildControllerS:self.chidVcArray selectBlock:^(int index) {
        [self.titleView updateSelecterToolsIndex:index];
    }];
    [self.view addSubview:self.containView];
    self.containView.sd_layout.spaceToSuperView(UIEdgeInsetsZero);
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
