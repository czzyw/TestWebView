//
//  ViewController.m
//  TestWebView
//
//  Created by 程志志 on 15/9/14.
//  Copyright (c) 2015年 程志志. All rights reserved.
//

#import "ViewController.h"
#import "JSViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //self.webView=[[UIWebView alloc]initWithFrame:CGRectMake(0, 310, self.view.frame.size.width, 300)];
    
    NSArray <NSString *>* arrs = @[@"a"];
    
    self.webView.backgroundColor=[UIColor blackColor];
    NSString *htmlPath=[[NSBundle mainBundle] resourcePath];
    htmlPath=[htmlPath stringByAppendingPathComponent:@"index.html"];
    NSURL *localURL=[[NSURL alloc]initFileURLWithPath:htmlPath];
    [self.webView loadRequest:[NSURLRequest requestWithURL:localURL]];
//    [self addSubview:self.webview];
    
    JSContext *context = [self.webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    
    ///context 内的lll 是webview中调用oc的方法名
    
    context[@"lll"] = ^() {
        
        NSLog(@"+++++++Begin Log+++++++");
        NSArray *args = [JSContext currentArguments];
        
        for (JSValue *jsVal in args) {
            NSLog(@"%@", jsVal);
        }
        
//        dispatch_async(dispatch_get_main_queue(), ^{
        
//            ScanViewController * vc = [[ScanViewController alloc] init];
//            
//            JSViewController * vc  = [[JSViewController alloc] init];
//
//            
//            [self presentViewController:vc animated:YES completion:^{
//                
//            }];
            
            ///这是oc调用webview中带参数的js方法，str是js返回给oc的结果
            NSString * str= [self.webView stringByEvaluatingJavaScriptFromString:@"myFunction('成组组长','CEO')"];
            NSLog(@"str = %@",str);

//        });
        
        JSValue *this = [JSContext currentThis];
        NSLog(@"this: %@",this);
        NSLog(@"-------End Log-------");
        
        //这是webview调用oc，oc返回给webview的值
        return @"oc_return";
    };

    NSLog(@"-------End Log-------");
    
    context[@"directUi"] = ^() {
        
        NSArray *args = [JSContext currentArguments];

        for (JSValue *jsVal in args) {
            NSLog(@"%@", jsVal);
        }
        
    };


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
