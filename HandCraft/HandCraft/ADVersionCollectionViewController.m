//
//  ADVersionCollectionViewController.m
//  HandCraft
//
//  Created by Mac on 16/8/2.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import "ADVersionCollectionViewController.h"

@interface ADVersionCollectionViewController ()<UICollectionViewDelegateFlowLayout>

@end

@implementation ADVersionCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self collectionCustom];
}
- (void)collectionCustom{
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"ADVersionCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    self.collectionView.bounces = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.pagingEnabled = YES;
    
}
- (instancetype)init{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = kMianB.size;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    return [self initWithCollectionViewLayout:flowLayout];
    
}



#pragma mark <UICollectionViewDataSource>



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 5;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return kMianB.size;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ADVersionCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    NSString *imageName = [NSString stringWithFormat:@"newfeature_0%ld_736",indexPath.item+1];
    cell.cellImageView.image = [UIImage imageNamed:imageName];
    
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 4) {
        [UIApplication sharedApplication].keyWindow.rootViewController = [ExcessiveViewController new];
        CATransition *sision = [CATransition animation];
        sision.duration = 2;
        sision.type = @"rippleEffect";
        [[UIApplication sharedApplication].keyWindow.layer addAnimation:sision forKey:nil];
        
        
    }
}


@end
