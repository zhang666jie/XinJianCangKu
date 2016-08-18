//
//  HotCollectionViewCell.m
//  HandCraft
//
//  Created by Mac on 16/8/8.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import "HotCollectionViewCell.h"

@interface HotCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *contentPic;

@end



@implementation HotCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setHotData:(HotModel *)hotData
{
    _hotData = hotData;
    
    NSURL *picUrl = [NSURL URLWithString:hotData.pic];
    [self.contentPic sd_setImageWithURL:picUrl placeholderImage:[UIImage imageNamed:@"004"]];
    self.contentLabel.text = hotData.name;
}


@end
