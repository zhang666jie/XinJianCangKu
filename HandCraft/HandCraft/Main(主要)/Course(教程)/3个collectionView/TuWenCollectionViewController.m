//
//  TuWenCollectionViewController.m
//  HandCraft
//
//  Created by Mac on 16/8/5.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import "TuWenCollectionViewController.h"

@interface TuWenCollectionViewController ()<UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong)NSMutableArray *dataArr;
@end

@implementation TuWenCollectionViewController

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
    [JiaoChengHTTPManager createJiaoChengHTTP:^(NSArray *array) {
        [self.dataArr addObjectsFromArray:array];
        [self.collectionView reloadData];
        
    }];

    
    [self.collectionView registerNib:[UINib nibWithNibName:@"TuWenCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.dataArr.count;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(180, 260);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10, 15, 20, 15);
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TuWenCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    JiaoChengModel *model = self.dataArr[indexPath.row];
    
    [cell.topImage sd_setImageWithURL:[NSURL URLWithString:model.host_pic]];
    cell.shangLabel.text = model.subject;
    cell.zhongLabel.text = [NSString stringWithFormat:@"by %@",model.user_name];
    cell.backgroundColor = [UIColor colorWithHexString:model.host_pic_color];
    cell.xiaLabel.text = [NSString stringWithFormat:@"%@人气/%@收藏",model.view,model.collect];

    
    
    return cell;
}


@end
