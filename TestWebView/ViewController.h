//
//  ViewController.h
//  TestWebView
//
//  Created by 程志志 on 15/9/14.
//  Copyright (c) 2015年 程志志. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

#import "ScanViewController.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property(nonatomic,strong) NSArray <NSString *>* arrs;

@end

