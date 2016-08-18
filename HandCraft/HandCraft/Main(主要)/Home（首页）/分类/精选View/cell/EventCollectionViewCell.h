//
//  EventCollectionViewCell.h
//  HandCraft
//
//  Created by Mac on 16/8/4.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *eventCellImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *huoDongLabel;

@end
