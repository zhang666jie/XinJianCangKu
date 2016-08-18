//
//  VideoView.m
//  HandCraft
//
//  Created by Mac on 16/8/10.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import "VideoView.h"

@implementation VideoView
+ (id)layerClass{
    return [AVPlayerLayer class];
}
- (void)setPlayer:(AVPlayer *)player{
    AVPlayerLayer *playerLayer = (AVPlayerLayer *)[self layer];
    [playerLayer setPlayer:player];
}


@end
