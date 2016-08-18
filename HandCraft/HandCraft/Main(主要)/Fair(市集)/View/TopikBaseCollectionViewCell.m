//
//  TopikBaseCollectionViewCell.m
//  HandCraft
//
//  Created by Mac on 16/8/8.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import "TopikBaseCollectionViewCell.h"

@interface TopikBaseCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *contentImageView;

@end


@implementation TopikBaseCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setPicStr:(NSString *)picStr
{
    _picStr = picStr;
    [self.contentImageView sd_setImageWithURL:[NSURL URLWithString:picStr] placeholderImage:[UIImage imageNamed:@"001"]];
}


@end
