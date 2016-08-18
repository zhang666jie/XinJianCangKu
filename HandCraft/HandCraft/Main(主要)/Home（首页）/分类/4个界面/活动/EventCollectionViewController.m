//
//  EventCollectionViewController.m
//  HandCraft
//
//  Created by Mac on 16/8/3.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import "EventCollectionViewController.h"

@interface EventCollectionViewController ()<UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong)NSMutableArray *dataArr;
@end

@implementation EventCollectionViewController

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
    [self.collectionView registerNib:[UINib nibWithNibName:@"EventCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    [HTTPManager HTTPFeaturedEvent:^(NSArray *array) {
        [self.dataArr addObjectsFromArray:array];
        [self.collectionView reloadData];
    }with:@"0"];
    [self refresh];
    
}
- (void)refresh{
    
    self.collectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(zouqi)];
}
 - (void)zouqi{
     FeatureModel *model = [self.dataArr lastObject];
     
     
    [HTTPManager HTTPFeaturedEvent:^(NSArray *array) {
        [self.dataArr addObjectsFromArray:array];
        [self.collectionView reloadData];
    }with:model.id];
     [self.collectionView.mj_footer endRefreshing];

 }
    


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArr.count;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(kMainW, 230);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
   EventCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    FeatureModel *model = self.dataArr[indexPath.row];
    [cell.eventCellImage sd_setImageWithURL:[NSURL URLWithString:model.m_logo]];
    cell.nameLabel.text = model.c_name;
    cell.timeLabel.text = [NSString stringWithFormat:@"征集作品时间:%@",model.c_time];
    if ([model.c_status isEqualToString:@"1"]) {
        cell.huoDongLabel.text = @"进行中";
    }else{
        cell.huoDongLabel.text = @"已结束";
    }
    
    
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    FeatureModel *model = self.dataArr[indexPath.row];
    EventTopViewController *evc = [[EventTopViewController alloc]init];
    evc.cid = model.c_id;
    [self.navigationController pushViewController:evc animated:YES];
    
}

@end
