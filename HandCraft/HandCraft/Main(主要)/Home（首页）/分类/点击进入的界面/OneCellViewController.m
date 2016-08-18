//
//  OneCellViewController.m
//  HandCraft
//
//  Created by Mac on 16/8/4.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import "OneCellViewController.h"

@interface OneCellViewController ()

@end

@implementation OneCellViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    self.title = @"市集专题";
    [self setUpView];
    [self addAllChildVc];
}
- (void)setUpView{
    
    self.titleScrollViewColor = [UIColor whiteColor];
    
    [self setUpTitleGradient:^(BOOL *isShowTitleGradient, YZTitleColorGradientStyle *titleColorGradientStyle, CGFloat *startR, CGFloat *startG, CGFloat *startB, CGFloat *endR, CGFloat *endG, CGFloat *endB) {
        *isShowTitleGradient = YES;
        *titleColorGradientStyle = YZTitleColorGradientStyleRGB;
        *endR = 1;
    }];
    [self setUpTitleScale:^(BOOL *isShowTitleScale, CGFloat *titleScale) {
        *isShowTitleScale = YES;
        *titleScale = 1.3;
    }];

}
- (void)addAllChildVc
{
    OneViewController *oneVc = [[OneViewController alloc]init];
    [self addChildVc:oneVc title:@"好店排行榜"];
    
    TwoViewController *twoVc = [[TwoViewController alloc]init];
    [self addChildVc:twoVc title: @"新手必买"];
    
    ThreeViewController *thrreVc = [[ThreeViewController alloc]init];
    [self addChildVc:thrreVc title: @"折扣专区"];
    
    FourViewController *foureVc = [[FourViewController alloc]init];
    [self addChildVc:foureVc title:@"手工客专享"];
    
    FiveViewController *fiveVc = [[FiveViewController alloc]init];
    [self addChildVc:fiveVc title:@"木艺"];
    
    SixViewController *sixVc = [[SixViewController alloc]init];
    [self addChildVc:sixVc title: @"皮艺"];
    
    SevenViewController *sevenVc = [[SevenViewController alloc]init];
    [self addChildVc:sevenVc title:@"编织"];
    
    EightViewController *eightVc = [[EightViewController alloc]init];
    [self addChildVc:eightVc title:@"绕线"];
    
    NineViewController *nineVc = [[NineViewController alloc]init];
    [self addChildVc:nineVc title:@"手工护肤"];
    
    TenViewController *tenVc = [[TenViewController alloc]init];
    [self addChildVc:tenVc title:@"厨艺多肉"];
    
    ElevenViewController *eleventVc = [[ ElevenViewController alloc]init];
    [self addChildVc:eleventVc title:@"布艺"];
    
    TeleveViewController *twelveVc = [[TeleveViewController alloc]init];
    [self addChildVc:twelveVc title:@"滴胶"];
    
    ThireenViewController *thirteenVc = [[ThireenViewController alloc]init];
    [self addChildVc:thirteenVc title:@"缝纫机"];
    
}
- (void)addChildVc:(UIViewController *)childVc title:(NSString *)titleStr
{
    childVc.title = titleStr;
    [self addChildViewController:childVc];
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
