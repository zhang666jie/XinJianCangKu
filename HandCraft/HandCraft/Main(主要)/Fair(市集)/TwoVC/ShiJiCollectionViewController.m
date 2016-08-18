//
//  ShiJiCollectionViewController.m
//  HandCraft
//
//  Created by Mac on 16/8/7.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import "ShiJiCollectionViewController.h"

@interface ShiJiCollectionViewController ()

@property (nonatomic, strong) NSMutableArray *hotArray;
@property (nonatomic, strong) NSMutableArray *bestArray;
@property (nonatomic, strong) NSMutableArray *topicBestArray;
@property (nonatomic, strong) NSMutableArray *topicArray;
@property (nonatomic, copy) NSString *lastId;
@end


@implementation ShiJiCollectionViewController

static NSString * const iId = @"FariCell";
static NSString * const bestId = @"FairBestCell";
static NSString * const topicBestId = @"FariTopicBestCell";
static NSString * const topicId = @"FariTopicCell";
static NSString * const headID = @"FairHeadView";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
       
    self.collectionView.contentInset = UIEdgeInsetsMake(0, 0, 80, 0);
    [self customCell];
    [self HTTP];
    }
- (instancetype)init
{
    // 流水布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    return [self initWithCollectionViewLayout:layout];
}
- (void)customCell{
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([HotCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:iId];
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([BaseCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:bestId];
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([TopikBaseCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:topicBestId];
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([TopickCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:topicId];
    [self.collectionView registerClass:[SectionHeaderCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headID];

}
- (void)HTTP{
    KeyModel *parmers = [[KeyModel alloc]init];
    parmers.c = @"Shiji";
    parmers.vid = @"18";
    parmers.a = self.product;
    __weak typeof(self) weakSelf = self;
    
    [ShiJiHTTPManager fariDataWithParms:parmers success:^(ShuZuModel *fariData) {
        

        weakSelf.hotArray = [NSMutableArray arrayWithArray:fariData.hot];
        weakSelf.bestArray = [NSMutableArray arrayWithArray:fariData.best];
        weakSelf.topicBestArray = [NSMutableArray arrayWithArray:fariData.topicBest];
        weakSelf.topicArray = [NSMutableArray arrayWithArray:fariData.topic];
        
        
        [weakSelf.collectionView reloadData];
        
    } failuer:^(NSError *error) {
        NSLog(@"error---%@",error.localizedDescription);
    }];

}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 4;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    
    if (section == 0) {
        return self.hotArray.count;
    }else if (section == 1){
        return self.bestArray.count;
    }else if (section == 2){
       return self.topicBestArray.count;
    }else{
       return self.topicArray.count;
    }
   

}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    CGSize size = CGSizeZero;
    if (section == 1) {
        size = CGSizeMake(kMainW, 50);
    }else if (section == 2){
        size = CGSizeMake(kMainW, 50);
    }
    return size;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize size = CGSizeZero;
    CGFloat W = 0;
    if (indexPath.section == 0) {
        W = kMainW * 0.2;
        size = CGSizeMake(W, W * 1.4);
    }else if (indexPath.section == 1){
        W = kMainW * 0.27;
        size = CGSizeMake(W, W * 2);
    }else if (indexPath.section == 2){
        W = kMainW * 0.27;
        size = CGSizeMake(W, W);
    }else{
        W = kMainW * 0.94;
        size = CGSizeMake(W, W * 0.6);
    }
    return size;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0){
        HotCollectionViewCell *hotCell = [collectionView dequeueReusableCellWithReuseIdentifier:iId forIndexPath:indexPath];
        hotCell.hotData = self.hotArray[indexPath.row];
        return hotCell;
    }
    else if (indexPath.section == 1){
        BaseCollectionViewCell *bestCell = [collectionView dequeueReusableCellWithReuseIdentifier:bestId forIndexPath:indexPath];
        bestCell.bestData = self.bestArray[indexPath.row];
        return bestCell;
    }
    else if (indexPath.section == 2){
        TopikBaseCollectionViewCell *topicBestCell = [collectionView dequeueReusableCellWithReuseIdentifier:topicBestId forIndexPath:indexPath];
        topicBestCell.picStr = self.topicBestArray[indexPath.row];
        return topicBestCell;
    }else{
        TopickCollectionViewCell *topicCell = [collectionView dequeueReusableCellWithReuseIdentifier:topicId forIndexPath:indexPath];
        topicCell.topicData = self.topicArray[indexPath.row];
        return topicCell;
    }
    
    return nil;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath

{
    UICollectionReusableView *reuView = nil;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        SectionHeaderCollectionReusableView *headView  = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headID forIndexPath:indexPath];
        
        if (indexPath.section == 1) {
            headView.titleStr = @"每日特价";
            headView.subtitleStr = @"每日10:00更新";
            reuView = headView;
            return reuView;
        }else if (indexPath.section == 2){
            headView.titleStr = @"精选专题";
            headView.subtitleStr = @"更多";
            reuView = headView;
            return reuView;
            
        }

    }
       return nil;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        XWCoolAnimator *animation = [XWCoolAnimator xw_animatorWithType:XWCoolTransitionAnimatorTypeFoldFromLeft];
        H5ViewController *hvc = [UIStoryboard storyboardWithName:NSStringFromClass([H5ViewController class]) bundle:nil].instantiateInitialViewController;
        hvc.bestData = self.bestArray[indexPath.row];
        [self xw_presentViewController:hvc withAnimator:animation];
    }else if (indexPath.section == 3){
        XWCoolAnimator *animationa = [XWCoolAnimator xw_animatorWithType:XWCoolTransitionAnimatorTypeExplode];
        H5ViewController *vc = [UIStoryboard storyboardWithName:NSStringFromClass([H5ViewController class]) bundle:nil].instantiateInitialViewController;
        vc.topicData = self.topicArray[indexPath.row];
        [self xw_presentViewController:vc withAnimator:animationa];
    }
}




@end
