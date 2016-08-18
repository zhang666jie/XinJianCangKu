//
//  H5ViewController.m
//  HandCraft
//
//  Created by Mac on 16/8/10.
//  Copyright © 2016年 ZYJ. All rights reserved.
//

#import "H5ViewController.h"

@interface H5ViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;
- (IBAction)btnClick:(UIBarButtonItem *)sender;

@end

@implementation H5ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (void)setTopicData:(ShangModel *)topicData{
    _topicData = topicData;
    NSString *str = [NSString stringWithFormat:@"http://www.shougongke.com/index.php?m=Topic&a=topicDetail&topic_id=%@&topic_type=shiji",topicData.topic_id];
    [self loadSlidDataType:str title:@"专题详情"];
}
 //购买
- (void)setBestData:(BaseModel *)bestData
{
    _bestData = bestData;
    NSString *str = [NSString stringWithFormat:@"http://market.shougongke.com//index.php?c=index&a=shop&open_iid=%@",bestData.open_iid];
    [self loadSlidDataType:str title:nil];
}

 //热帖
- (void)setHotData:(GPHotMoel *)hotData
{
    _hotData = hotData;
    if (hotData.mob_h5_url.length) {
        [self loadSlidDataType:hotData.mob_h5_url title:@"专题详情"];
    }
}
- (void)loadSlidDataType:(NSString *)urlString title:(NSString *)title
{
    NSURL *url = [NSURL URLWithString:urlString];
    [self.view addSubview:self.webView];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    self.navigationItem.title = title;
}



- (IBAction)btnClick:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
