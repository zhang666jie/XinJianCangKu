//
//  EnrollViewController.m
//  HandCraft
//
//  Created by Mac on 16/8/9.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import "EnrollViewController.h"

@interface EnrollViewController ()
@property (weak, nonatomic) IBOutlet UITextField *numTF;
@property (weak, nonatomic) IBOutlet UITextField *yanZhengMaTf;
@property (weak, nonatomic) IBOutlet UITextField *passWord;


@end

@implementation EnrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"注册";
}
- (IBAction)yanZhengMaBtn:(UIButton *)sender {
   
}
- (IBAction)enrollBtn:(UIButton *)sender {
    if (_numTF.text.length>0&&_passWord.text.length>0) {
        [DataBaseTools insertIntoDatabase:_numTF.text with:_passWord.text];
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"注册成功！是否回到登录界面？" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        UIAlertAction *actionQD = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self.navigationController popViewControllerAnimated:YES];
        }];
        [alert addAction:action];
        [alert addAction:actionQD];
        [self presentViewController:alert animated:YES completion:nil];
        
    }else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"输入的内容不能为空" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        UIAlertAction *actionQD = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alert addAction:action];
        [alert addAction:actionQD];
        [self presentViewController:alert animated:YES completion:nil];

        
        
    }
}
- (IBAction)loginBtn:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
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

- (IBAction)passWord:(UITextField *)sender {
}
@end
