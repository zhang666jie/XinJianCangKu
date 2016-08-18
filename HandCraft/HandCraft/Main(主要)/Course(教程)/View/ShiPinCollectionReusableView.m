//
//  ShiPinCollectionReusableView.m
//  HandCraft
//
//  Created by Mac on 16/8/10.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import "ShiPinCollectionReusableView.h"
#import "VideoView.h"
@interface ShiPinCollectionReusableView (){
    UIImageView *imageView;
    
    UISlider *_slide;
    AVPlayerItem *_playerItem;
    AVPlayer *_player;
    UIButton *playBtn;
    
}

@property (nonatomic,strong)NSMutableArray *dataArr;

@end


@implementation ShiPinCollectionReusableView
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
       self.array =  [NSMutableArray array];
        [self createVideo];
    }
    return self;
}

- (void)createVideo{
       
    CGRect rect = CGRectMake(10, 10,kMainW-20, 300);
    imageView = [[UIImageView alloc]initWithFrame:rect];
    [self addSubview:imageView];
      VideoView *videoView = [[VideoView alloc]initWithFrame:rect];
       videoView.tag = 1000;
       [self addSubview:videoView];
       
    playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    playBtn.frame = CGRectMake(10, 64, 100, 44);
    playBtn.backgroundColor = [UIColor lightGrayColor];
    [playBtn setTitle:@"开始" forState:UIControlStateNormal];
    [playBtn addTarget:self action:@selector(playMovie:) forControlEvents:UIControlEventTouchUpInside];
    [videoView addSubview:playBtn];
    
    
    
    _slide = [[UISlider alloc]initWithFrame:CGRectMake(10, 280, 300, 5)];
    [_slide addTarget:self action:@selector(playerProgressChange:) forControlEvents:UIControlEventValueChanged];
    [self addSubview:_slide];
    
    
}
- (void)playerProgressChange:(UISlider *)sender{
    float v = sender.value;
    CMTime time = [[_player currentItem]duration];
    NSLog(@"cmtime duration is %f",time.value/time.timescale/60.0f);
    CMTime newTime = CMTimeMultiplyByFloat64(time, v);
    [_player pause];
    [_player seekToTime: newTime completionHandler:^(BOOL finished) {
        NSLog(@"finish is %d",finished);
        [_player play];
    }];
    
}
- (void)playMovie:(UIButton *)sender{
   
    BoFangQiModel *model = self.array[0];
    NSURL *url = [NSURL URLWithString:model.url];
    [self playerMovieRemote:url];
    playBtn.frame = CGRectZero;
    
}
- (void)playerMovieRemote:(NSURL *)url{
    AVURLAsset *asset = [AVURLAsset URLAssetWithURL:url options:nil];
    NSString *tracksKey = @"trackes";
    NSArray *keyArr = [NSArray arrayWithObjects:tracksKey, nil];
    [asset loadValuesAsynchronouslyForKeys:keyArr completionHandler:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            NSError *error = nil;
            AVKeyValueStatus status = [asset statusOfValueForKey:tracksKey error:&error];
            NSLog(@"status is %ld", status);
            if (status == AVKeyValueStatusLoaded) {
                _playerItem = [AVPlayerItem playerItemWithAsset:asset];
                [_playerItem addObserver:self forKeyPath:@"status" options:0 context:nil];
                [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playItemDidReachEnd:) name:AVPlayerItemDidPlayToEndTimeNotification object:_playerItem];
                _player = [AVPlayer playerWithPlayerItem:_playerItem];
                VideoView *video = [self viewWithTag:1000];
                [video setPlayer:_player];
            } else {
                NSLog(@"Error status is %@", error.localizedDescription);
            }
            
        });
    }];
    
    
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    NSLog(@"123");
    NSLog(@"status is keyPath is %@",keyPath);
    if ([keyPath isEqualToString:@"status"]) {
        [_player play];
        CMTime time = [[_player currentItem]duration];
        float seconds = time.value*1.0f/time.timescale;
        NSLog(@"time is %lld,%d time:%f",time.value,time.timescale,seconds/60);
        NSLog(@"timedMetadata is %@",_player.currentItem.asset.commonMetadata);
        NSLog(@"tracks is %@",_player.currentItem.tracks);
        
        CMTime periodctimeIntervale = CMTimeMake(1, 1);
        
         AVPlayer *tempVideo = _player;
         UISlider *slider = _slide;
        [_player addPeriodicTimeObserverForInterval:periodctimeIntervale queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
            CMTime duration = [[tempVideo currentItem]duration];
            CMTime currTime = [[tempVideo currentItem]currentTime];
            float v = CMTimeGetSeconds(currTime)/CMTimeGetSeconds(duration);
            NSLog(@"v is %f",v);
            //            NSLog(@"loadedTimeRanges is %@",[[tempVideo current   `+Time] loadedTimerRanges]);
            NSLog(@"seekTimeRange is %@",[[tempVideo currentItem]seekableTimeRanges]);
            
            [slider setValue:v];
            
        }];
    }else{
        
    }
}
- (void)playItemDidReachEnd:(NSNotification *)noti{
    NSLog(@"reach end");
    [_player seekToTime:kCMTimeZero];
    [_player seekToTime:kCMTimeZero completionHandler:^(BOOL finished) {
        NSLog(@"定位完成");
    }];
    
}

@end
