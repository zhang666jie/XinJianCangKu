//
//  ForgetViewController.m
//  HandCraft
//
//  Created by Mac on 16/8/9.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import "ForgetViewController.h"

@interface ForgetViewController ()
@property (weak, nonatomic) IBOutlet UITextField *numTf;
@property (weak, nonatomic) IBOutlet UITextField *yanZhengMaTf;

@end

@implementation ForgetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"忘记密码";
}
- (IBAction)nextBtn:(UIButton *)sender {
}
- (IBAction)yanZhengMaBtn:(UIButton *)sender {
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
