//
//  TopickCollectionViewCell.m
//  HandCraft
//
//  Created by Mac on 16/8/8.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import "TopickCollectionViewCell.h"

@interface TopickCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *contentImage;
@property (weak, nonatomic) IBOutlet UIButton *titleBtn;

@end



@implementation TopickCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setTopicData:(ShangModel *)topicData
{
    _topicData = topicData;
    NSURL *picUrl = [NSURL URLWithString:topicData.host_pic];
    [self.contentImage sd_setImageWithURL:picUrl];
    [self.titleBtn setTitle:topicData.topic_name forState:UIControlStateNormal];
    
}


@end
