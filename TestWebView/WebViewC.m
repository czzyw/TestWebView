//
//  WebViewC.m
//  TestWebView
//
//  Created by 程志志 on 15/11/26.
//  Copyright (c) 2015年 程志志. All rights reserved.
//

#import "WebViewC.h"

@implementation WebViewC

- (IBAction)backAction:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}


-(void)viewDidLoad
{
    NSURL *url = [[NSURL alloc]initWithString:@"http://www.vip119.com/column/7678d258-9c31-4816-ba11-938aee0178c5.html"];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];

    JSContext *context = [self.webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    context[@"collocation"] = ^() {
        NSLog(@"-------End Log-------");

    };


}



@end
