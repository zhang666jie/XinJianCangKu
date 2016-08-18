//
//  DaRenCollectionViewController.m
//  HandCraft
//
//  Created by Mac on 16/8/3.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import "DaRenCollectionViewController.h"

@interface DaRenCollectionViewController ()<UICollectionViewDelegateFlowLayout>
//@property (nonatomic,strong)NSMutableArray *dataArr;
@property (nonatomic,strong)NSMutableArray *threeArr;
//@property (nonatomic,strong)NSMutableArray *picArr;
//@property (nonatomic,strong)NSMutableArray *taoArr;

@end

@implementation DaRenCollectionViewController


- (instancetype)init
{
    // 流水布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    return [self initWithCollectionViewLayout:layout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.dataArr = [NSMutableArray array];
    self.threeArr = [NSMutableArray array];
   // self.picArr = [NSMutableArray array];
   // self.taoArr = [NSMutableArray array];
    self.collectionView.backgroundColor = [UIColor whiteColor];
//    [DaRenHTTPManager HTTPDaRenModel:^(NSArray *array) {
//        [self.dataArr addObjectsFromArray:array];
//        [self.collectionView reloadData];
//    }];
    [DaRenHTTPManager HTTPDaRenTwoModel:^(NSArray *array) {
        [self.threeArr addObjectsFromArray:array];
        [self.collectionView reloadData];
        
        
    }];
      [self.collectionView registerNib:[UINib nibWithNibName:@"DaRenCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"darenID"];
    
  }

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.threeArr.count;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(kMainW, 260);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DaRenCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"darenID" forIndexPath:indexPath];
    cell.model = self.threeArr[indexPath.row];
    cell.imageClick = ^(NSInteger tagCount){
        NSLog(@"456");
        [self imageViewClick:tagCount];
    };
    
    
    
    return cell;
}
- (void)imageViewClick:(NSInteger)tagCount
{   NSLog(@"123");
    XWCoolAnimator *animator = [XWCoolAnimator xw_animatorWithType:XWCoolTransitionAnimatorTypeScanningFromLeft];
    BuZouCollectionViewController *bvc = [[BuZouCollectionViewController alloc]init];
    bvc.tagCpunt = [NSString stringWithFormat:@"%ld",tagCount];
    //    [self.navigationController pushViewController:picVc animated:YES];
    [self xw_presentViewController:bvc withAnimator:animator];
    //    [self presentViewController:picVc animated:YES completion:nil];
}


@end
