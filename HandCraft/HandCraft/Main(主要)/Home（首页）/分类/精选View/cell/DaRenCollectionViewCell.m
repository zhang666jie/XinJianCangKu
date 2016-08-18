//
//  DaRenCollectionViewCell.m
//  HandCraft
//
//  Created by Mac on 16/8/5.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import "DaRenCollectionViewCell.h"

@interface DaRenCollectionViewCell ()
@property (nonatomic,strong)NSArray *picArray;

@end

@implementation DaRenCollectionViewCell
- (IBAction)guanZhuBtn:(UIButton *)sender {
  
      
   
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.picArray = @[self.oneImage,self.twoImage,self.threeImage];
   
}
- (void)setModel:(DaRenModel *)model{
    
    self.topImage.layer.cornerRadius = 47;
    self.topImage.clipsToBounds = YES;
    [self.topImage sd_setImageWithURL:[NSURL URLWithString:model.avatar]];
    self.nameLabel.text = model.nick_name;
    self.textLabel.text = [NSString stringWithFormat:@"%@图文教程|%@视频教程|%@手工圈",model.course_count,model.video_count,model.opus_count];
    int i = 0;
    for (NSDictionary *dic in model.list) {
        [self addImage:dic[@"host_pic"] imageView:self.picArray[i] tag:dic[@"hand_id"]];
        [self addTapGestuer:self.picArray[i]];
        i++;
    }
}
- (void)addImage:(NSString *)picUrl imageView:(UIImageView *)imageView tag:(NSString *)tapStr

{  NSLog(@"33");
    [imageView sd_setImageWithURL:[NSURL URLWithString:picUrl] placeholderImage:[UIImage imageNamed:@"2"]];
    imageView.tag = [tapStr intValue];
}
#pragma mark - 添加手势
- (void)addTapGestuer:(UIImageView *)imageView
{  NSLog(@"999");
    UITapGestureRecognizer *tapGs = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageViewClick:)];
    [imageView addGestureRecognizer:tapGs];
}
- (void)imageViewClick:(UITapGestureRecognizer *)gestureRecognizer
{  NSLog(@"666");
    UIImageView *imageView = (UIImageView *)[gestureRecognizer view];
    if (self.imageClick) {
        self.imageClick(imageView.tag);
    }
}



@end
