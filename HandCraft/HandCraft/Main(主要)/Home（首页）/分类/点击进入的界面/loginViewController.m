//
//  loginViewController.m
//  HandCraft
//
//  Created by Mac on 16/8/9.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import "loginViewController.h"

@interface loginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *accountTf;
@property (weak, nonatomic) IBOutlet UITextField *cipherTf;
@property (nonatomic,strong)NSMutableArray *dataArr;
@end

@implementation loginViewController
- (NSMutableArray *)dataArr{
    if (_dataArr == nil) {
        _dataArr = [DataBaseTools selectAllDatabaseTool];
    }
    return _dataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
}
- (IBAction)registrBtn:(UIButton *)sender {
    if (_accountTf.text.length>0&&_cipherTf.text.length>0) {
        for (HandModel *model in self.dataArr) {
            if (_accountTf.text == model.name && _cipherTf.text == model.pws) {
                LiuLiuLiuViewController *lvc = [[LiuLiuLiuViewController alloc]init];
                [self.navigationController pushViewController:lvc animated:YES];
            }else{
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"账号或密码不正确，请重新输入" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                    
                }];
                UIAlertAction *actionQD = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    
                }];
                [alert addAction:action];
                [alert addAction:actionQD];
                [self presentViewController:alert animated:YES completion:nil];

            }
        }

    }else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"账号或密码不能为空，请重新输入" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        UIAlertAction *actionQD = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alert addAction:action];
        [alert addAction:actionQD];
        [self presentViewController:alert animated:YES completion:nil];

    }
    
}
- (IBAction)enrollBtn:(UIButton *)sender {
    EnrollViewController *evc = [[EnrollViewController alloc]init];
    [self.navigationController pushViewController:evc animated:YES];
    
}
- (IBAction)forgetPasswordBtn:(UIButton *)sender {
    ForgetViewController *fvc = [[ForgetViewController alloc]init];
    [self.navigationController pushViewController:fvc animated:YES];
}


@end
