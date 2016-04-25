//
//  JSViewController.m
//  TestWebView
//
//  Created by 程志志 on 16/2/18.
//  Copyright © 2016年 程志志. All rights reserved.
//

#import "JSViewController.h"

@interface JSViewController ()

@end

@implementation JSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 1.webView
    UIWebView *webView = [[UIWebView alloc] init];
    webView.frame = self.view.bounds;
    webView.delegate = self;
    // 伸缩页面至填充整个webView
    webView.scalesPageToFit = YES;
    // 隐藏scrollView
    webView.scrollView.hidden = YES;
    [self.view addSubview:webView];
    
    // 2.加载网页
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.dianping.com/tuan/deal/5501525"]];
    [webView loadRequest:request];
    
    // 3.创建
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [loadingView startAnimating];
    loadingView.center = CGPointMake(160, 240);
    [self.view addSubview:loadingView];
    self.loadingView = loadingView;
}
// 在OC中调用JS
#pragma mark - UIWebViewDelegate
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSMutableString *js1 = [NSMutableString string];
    // 0.删除顶部的导航条
    [js1 appendString:@"var header = document.getElementsByTagName('header')[0];"];
    [js1 appendString:@"header.parentNode.removeChild(header);"];
    
    // 1.删除底部的链接
    [js1 appendString:@"var footer = document.getElementsByTagName('footer')[0];"];
    [js1 appendString:@"footer.parentNode.removeChild(footer);"];
    [webView stringByEvaluatingJavaScriptFromString:js1];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSMutableString *js2 = [NSMutableString string];
        // 2.删除浮动的广告
        [js2 appendString:@"var list = document.body.childNodes;"];
        [js2 appendString:@"var len = list.length;"];
        [js2 appendString:@"var banner = list[len - 1];"];
        [js2 appendString:@"banner.parentNode.removeChild(banner);"];
        [webView stringByEvaluatingJavaScriptFromString:js2];
        
        // 显示scrollView
        webView.scrollView.hidden = NO;
        
        // 删除圈圈
        [self.loadingView removeFromSuperview];
    });
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
