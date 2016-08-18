//
//  TuWenCollectionViewCell.h
//  HandCraft
//
//  Created by Mac on 16/8/6.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TuWenCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *topImage;
@property (weak, nonatomic) IBOutlet UILabel *shangLabel;
@property (weak, nonatomic) IBOutlet UILabel *zhongLabel;
@property (weak, nonatomic) IBOutlet UILabel *xiaLabel;

@end
