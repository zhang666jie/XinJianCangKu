//
//  BaseCollectionViewCell.m
//  HandCraft
//
//  Created by Mac on 16/8/8.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import "BaseCollectionViewCell.h"

@interface BaseCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *contentImageView;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;


@end


@implementation BaseCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setBestData:(BaseModel *)bestData
{
    _bestData = bestData;
    
    NSURL *picUrl = [NSURL URLWithString:bestData.picurl];
    [self.contentImageView sd_setImageWithURL:picUrl placeholderImage:[UIImage imageNamed:@"001"]];
    self.titleLabel.text = bestData.title;
    self.priceLabel.text = bestData.price;
}


@end
