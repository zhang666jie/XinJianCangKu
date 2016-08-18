//
//  TabBarViewController.m
//  HandCraft
//
//  Created by Mac on 16/8/2.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import "TabBarViewController.h"

@interface TabBarViewController ()
@property (nonatomic,strong)UIViewController *vc;
@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addArrTabBar];
}
- (void)addArrTabBar{
    NSArray *tabBarArr = @[@{@"rootVCClass":@"HomeViewController",@"title":@"首页",@"imageName":@"icon_jiaocheng_",@"selectedImageName":@"icon_jiaocheng_s"},@{@"rootVCClass":@"CourseViewController",@"title":@"教程",@"imageName":@"icon_ketang_",@"selectedImageName":@"icon_ketang_s"},@{@"rootVCClass":@"loginViewController",@"title":@"手工圈",@"imageName":@"icon_shougongquan_",@"selectedImageName":@"icon_shougongquan_s"},@{@"rootVCClass":@"FairViewController",@"title":@"市集",@"imageName":@"icon_shiji_",@"selectedImageName":@"icon_shiji_s"},@{@"rootVCClass":@"MyOwnTableViewController",@"title":@"我的",@"imageName":@"icon_wode_",@"selectedImageName":@"icon_wode_s"}];
    [tabBarArr enumerateObjectsUsingBlock:^(NSDictionary *dic, NSUInteger idx, BOOL * _Nonnull stop) {
        self.vc = [[NSClassFromString(dic[@"rootVCClass"]) alloc]init];
        self.vc.title = dic[@"title"];
        GPNavgationController *nvc = [[GPNavgationController alloc]initWithRootViewController:self.vc];
        nvc.navigationBar.barTintColor = [UIColor whiteColor];
        UITabBarItem *item = nvc.tabBarItem;
        item.title = dic[@"title"];
        item.image = [UIImage imageNamed:dic[@"imageName"]];
        item.selectedImage = [[UIImage imageNamed:dic[@"selectedImageName"]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateSelected];
        [self addChildViewController:nvc];
        
        
    }];
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
