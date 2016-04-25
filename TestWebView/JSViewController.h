//
//  JSViewController.h
//  TestWebView
//
//  Created by 程志志 on 16/2/18.
//  Copyright © 2016年 程志志. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSViewController : UIViewController<UIWebViewDelegate>

@property(strong,nonatomic)UIActivityIndicatorView * loadingView;

@end
