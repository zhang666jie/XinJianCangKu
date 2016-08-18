//
//  ExcessiveViewController.m
//  HandCraft
//
//  Created by Mac on 16/8/2.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import "ExcessiveViewController.h"

@interface ExcessiveViewController ()
@property (nonatomic,strong)UIImageView *imageView;
@end

@implementation ExcessiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _imageView = [[UIImageView alloc]initWithFrame:kMianB];
    _imageView.image = [UIImage imageNamed:@"ad.jpg"];
    [self.view addSubview:_imageView];
    
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(IntoTabBarViewController) userInfo:nil repeats:NO];
    
}
- (void)IntoTabBarViewController{
    [UIView animateWithDuration:0.5f animations:^{
        _imageView.transform = CGAffineTransformMakeScale(1.5f, 1.5f);
        _imageView.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [UIApplication sharedApplication].keyWindow.rootViewController = [TabBarViewController new];
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
