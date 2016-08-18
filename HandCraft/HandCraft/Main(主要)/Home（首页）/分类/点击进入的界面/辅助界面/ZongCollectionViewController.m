//
//  ZongCollectionViewController.m
//  HandCraft
//
//  Created by Mac on 16/8/4.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import "ZongCollectionViewController.h"

@interface ZongCollectionViewController ()<UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong)NSMutableArray *dataArr;
@end

@implementation ZongCollectionViewController

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
    [HTTPManager HTTPFeaturedManager:^(NSArray *array) {
        [self.dataArr addObjectsFromArray:array];
        [self.collectionView reloadData];
    } with:self.ifonId];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"ManagerCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    
    }

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.dataArr.count;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(kMainW, 300);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ManagerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    FeatureTwoModel *model = self.dataArr[indexPath.row];
    [cell.bgImage sd_setImageWithURL:[NSURL URLWithString:model.pic]];
    cell.bgLabel.text = model.subject;
    
    
    return cell;
}


@end
