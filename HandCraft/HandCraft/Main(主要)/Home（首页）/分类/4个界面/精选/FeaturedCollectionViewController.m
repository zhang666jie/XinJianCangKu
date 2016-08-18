//
//  FeaturedCollectionViewController.m
//  HandCraft
//
//  Created by Mac on 16/8/3.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import "FeaturedCollectionViewController.h"

@interface FeaturedCollectionViewController ()<UICollectionViewDelegateFlowLayout,SDCycleScrollViewDelegate>{
    
}
@property (nonatomic,strong)NSMutableArray *dataArr;
@property (nonatomic,strong)NSMutableArray *xiaDataArr;

@end
static NSString * const OneHeader = @"OneSectionCell";
static NSString * const TwoHeader = @"TwoSectionCell";
static NSString * const ThreeHeader = @"ThreeSectionCell";
@implementation FeaturedCollectionViewController

static NSString * const reuseIdentifier = @"Cell";
- (instancetype)init
{
    // 流水布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    return [self initWithCollectionViewLayout:layout];
}
- (NSMutableArray *)dataArr{
    if (_dataArr == nil) {
        _dataArr = [[NSMutableArray alloc]init];
    }
    return _dataArr;
}
- (NSMutableArray *)xiaDataArr{
    if (_xiaDataArr == nil) {
        _xiaDataArr = [[NSMutableArray alloc]init];
    }
    return _xiaDataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
        self.automaticallyAdjustsScrollViewInsets = NO;
    self.collectionView.backgroundColor = [UIColor whiteColor];
         [HTTPManager HTTPFeatured:^(NSArray *array) {
        
        [self.dataArr addObjectsFromArray:array];
         [self.collectionView reloadData];
       
    }];
    [HTTPManager HTTPFeaturedTopPic:^(NSArray *array) {
        [self.xiaDataArr addObjectsFromArray:array];

        [self.collectionView reloadData];
    }];
    [self.collectionView registerNib:[UINib nibWithNibName:@"FeaturedCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    [self.collectionView registerNib:[UINib nibWithNibName:@"XiaCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cellID"];
    
    [self.collectionView registerClass:[OneCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:OneHeader];
    
    [self.collectionView registerClass:[TwoCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:TwoHeader];
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 2;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return self.dataArr.count;
    }else{
    return self.xiaDataArr.count;
    }
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return CGSizeMake(kMainW, 300);
    }else{
        return CGSizeMake(kMainW, 50);
    }
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return CGSizeMake(200, 200);
    }else{
        return CGSizeMake(kMainW, 150);
    }
    
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        FeaturedCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
       if (self.dataArr.count != 0) {
            FeatureModel *model = self.dataArr[indexPath.row];
           [FMDBData insertIntoDatabasewithadvance_pic:model.pic];
           
            [cell.featureImage sd_setImageWithURL:[NSURL URLWithString:model.pic]];
        }
       
        return cell;
        

    }else{
       
        XiaCollectionViewCell *xiaCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
        if (self.xiaDataArr.count != 0) {
            FeatureTwoModel *obj = self.xiaDataArr[indexPath.row];
            [FMDBData insertIntoDatabasewithhotTopic_pic:obj.pic];
           
            [xiaCell.xiaImage sd_setImageWithURL:[NSURL URLWithString:obj.pic]];
        }
        return xiaCell;
    }
   
    
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionReusableView *reusableView = nil;
    
    
     if (indexPath.section == 0) {
         if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
             OneCollectionReusableView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:(UICollectionElementKindSectionHeader) withReuseIdentifier:OneHeader forIndexPath:indexPath];
             reusableView = headView;

         }
       return reusableView;
    }
    else  {
        if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
            TwoCollectionReusableView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:(UICollectionElementKindSectionHeader) withReuseIdentifier:TwoHeader forIndexPath:indexPath];
            reusableView = headView;
        }
        return reusableView;
    }
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        
        CellViewController *cvc = [[CellViewController alloc]init];
        FeatureModel *model = self.xiaDataArr[indexPath.row];
        cvc.url = model.mob_h5_url;
        cvc.fenXiangUrl = model.pic;
        [self.navigationController pushViewController:cvc animated:YES];
    }else{
        if (indexPath.row == 0) {
            OneCellViewController *ovc = [[OneCellViewController alloc]init];
            [self.navigationController pushViewController:ovc animated:YES];
            
        }else{
            CourseViewController *cvc = [[CourseViewController alloc]init];
            [self.navigationController pushViewController:cvc animated:YES];
        }
    }
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    CATransform3D rotation;//3D旋转
    //    rotation = CATransform3DMakeTranslation(0 ,50 ,20);
    rotation = CATransform3DMakeRotation( M_PI_4 , 0.0, 0.7, 0.4);
    //逆时针旋转
    
    rotation = CATransform3DScale(rotation, 0.8, 0.8, 1);
    
    rotation.m34 = 1.0/ 1000;
    
    cell.layer.shadowColor = [[UIColor redColor]CGColor];
    cell.layer.shadowOffset = CGSizeMake(10, 10);
    cell.alpha = 0;
    
    cell.layer.transform = rotation;
    
    [UIView beginAnimations:@"rotation" context:NULL];
    //旋转时间
    [UIView setAnimationDuration:0.6];
    
    cell.layer.transform = CATransform3DIdentity;
    cell.alpha = 1;
    cell.layer.shadowOffset = CGSizeMake(0, 0);
    [UIView commitAnimations];
    
}


  @end
