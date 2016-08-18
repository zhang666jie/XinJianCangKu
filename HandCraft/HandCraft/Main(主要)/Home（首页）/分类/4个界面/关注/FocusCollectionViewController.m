//
//  FocusCollectionViewController.m
//  HandCraft
//
//  Created by Mac on 16/8/3.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import "FocusCollectionViewController.h"

@interface FocusCollectionViewController ()<UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong)NSArray *topImageArr;
@property (nonatomic,strong)NSArray *tentImageArr;
@property (nonatomic,strong)NSArray *nameArr;
@property (nonatomic,strong)NSArray *textArr;
@end

@implementation FocusCollectionViewController

static NSString * const reuseIdentifier = @"Cell";
- (instancetype)init
{
    // 流水布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    return [self initWithCollectionViewLayout:layout];
}
//- (NSMutableArray *)topImageArr{
//    if (_topImageArr == nil) {
//        _topImageArr = [NSMutableArray array];
//    }
//    return _topImageArr;
//}
//- (NSMutableArray *)textArr{
//    if (_textArr == nil) {
//        _textArr = [NSMutableArray array];
//    }
//    return _topImageArr;
//}
//
//- (NSMutableArray *)nameArr{
//    if (_nameArr == nil) {
//        _nameArr = [NSMutableArray array];
//    }
//    return _nameArr;
//}
//- (NSMutableArray *)tentImageArr{
//    if (_tentImageArr == nil) {
//        _tentImageArr = [NSMutableArray array];
//    }
//    return _tentImageArr;
//}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    self.topImageArr = @[@"001.jpg",@"002.jpg",@"003.jpg",@"004.jpg",@"005.jpg"];
    
   self.tentImageArr = @[@"01.jpg",@"02.jpeg",@"03.jpg",@"04.jpg",@"05.jpg"];
    
   self.nameArr = @[@"我是小菜蛋对你点赞了",@"我是小菜蛋关注了你",@"我是小菜蛋求你赏个赞呗",@"我是小菜蛋求你给个关注呗",@"我是小菜蛋祝你发大财"];
   
   self.textArr = @[@"哈哈哈哈,下拉&点击有惊喜呀,要不要试一试呢",@"暗恋的女孩告诉我，如果我喜欢她就别说出来，因为愿望说出来就不灵了。这道理我懂!",@"你现在不喜欢我，我告诉你，过了这个村，我在下一个村等你!!",@"我姓黄，又在秋天出生，所以我叫黄天出",@"哈哈哈,上拉&点击也有惊喜"];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"FocusCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    [self.collectionView reloadData];
 }

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 5;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(kMainW, 240);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    FocusCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
        cell.topImage.layer.cornerRadius = 40;
    cell.topImage.clipsToBounds = YES;
    
    cell.topImage.image = [UIImage imageNamed:self.topImageArr[indexPath.row]];
    cell.textImage.image = [UIImage imageNamed:self.tentImageArr[indexPath.row]];
    cell.nameLabel.text = self.nameArr[indexPath.row];
    cell.textLabel.text = self.textArr[indexPath.row];
    
    
    
    
    return cell;
}


@end
