//
//  ShiPinCollectionViewController.m
//  HandCraft
//
//  Created by Mac on 16/8/5.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import "ShiPinCollectionViewController.h"

@interface ShiPinCollectionViewController ()<UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong)NSMutableArray *dataArr;

@end

@implementation ShiPinCollectionViewController

static NSString * const reuseIdentifier = @"Cell";
- (instancetype)init
{
    // 流水布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    return [self initWithCollectionViewLayout:layout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArr = [NSMutableArray array];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [JiaoChengHTTPManager createShiPinHTTP:^(NSArray *array) {
        [self.dataArr addObjectsFromArray:array];
        [self.collectionView reloadData];
        
    }];
        
    [self.collectionView registerNib:[UINib nibWithNibName:@"ShiPinCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    
    
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.dataArr.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(kMainW, 300);
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ShiPinCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    ShiPinModel *model = self.dataArr[indexPath.row];
    [cell.imageV sd_setImageWithURL:[NSURL URLWithString:model.host_pic]];
    cell.xiaLabel.text = model.subject;
   
    
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    BoFangQiCollectionViewController *bvc = [[BoFangQiCollectionViewController alloc]init];
    ShiPinModel *model = self.dataArr[indexPath.row];
    bvc.id = model.id;
    [self.navigationController pushViewController:bvc animated:YES];
}


@end
