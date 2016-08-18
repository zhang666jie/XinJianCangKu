//
//  FocusCollectionViewCell.h
//  HandCraft
//
//  Created by Mac on 16/8/4.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FocusCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *topImage;
@property (weak, nonatomic) IBOutlet UIImageView *textImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@end
