//
//  BoFangQiCollectionViewController.m
//  HandCraft
//
//  Created by Mac on 16/8/11.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import "BoFangQiCollectionViewController.h"

@interface BoFangQiCollectionViewController ()<UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong)NSMutableArray *dataArr;
@end

@implementation BoFangQiCollectionViewController

static NSString * const reuseIdentifier = @"Cell";
static NSString * const headID = @"HeadID";

- (instancetype)init
{
    // 流水布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    return [self initWithCollectionViewLayout:layout];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setHidesBackButton:YES];
        self.dataArr = [NSMutableArray array];
    self.title = @"视频";
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    [self.collectionView registerClass:[ShiPinCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headID];
    [JiaoChengHTTPManager createBoFangQiHTTP:^(NSArray *array) {
       
        [self.dataArr addObjectsFromArray:array];
        [self.collectionView reloadData];
        
    } withInteger:_id];
    
    [self createToolBar];
    
}
- (void)createToolBar{
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, kMainH-60, kMainW, 60)];
    UIButton *btn = [UIButton buttonWithType: UIButtonTypeCustom];
    btn.frame = CGRectMake(10, 10, 50, 40);
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"🙅" forState:UIControlStateNormal];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:btn];
    toolBar.items = @[item];
    
    [self.view addSubview:toolBar];
    
}
- (void)btnClick:(UIButton *)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    
    
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(kMainW, 320);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
   
    UICollectionReusableView *reusableView = nil;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        ShiPinCollectionReusableView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headID forIndexPath:indexPath];
        headView.id = _id;
      
        headView.array = self.dataArr;
        
        reusableView = headView;
    }
    return reusableView;
}


@end
