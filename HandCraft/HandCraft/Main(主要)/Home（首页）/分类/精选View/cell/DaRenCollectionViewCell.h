//
//  DaRenCollectionViewCell.h
//  HandCraft
//
//  Created by Mac on 16/8/5.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DaRenModel;
@interface DaRenCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *threeImage;
@property (weak, nonatomic) IBOutlet UIImageView *twoImage;
@property (weak, nonatomic) IBOutlet UIImageView *oneImage;
@property (weak, nonatomic) IBOutlet UIImageView *topImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UIButton *guanZguBtn;

@property (nonatomic,strong)DaRenModel *model;
@property (nonatomic, copy)void(^imageClick)(NSInteger tagImageView);
@end
