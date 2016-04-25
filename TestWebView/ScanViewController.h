//
//  ScanViewController.h
//  CarWash
//
//  Created by 程志志 on 14/12/31.
//  Copyright (c) 2014年 程志志. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@protocol ScanViewControllerDelegate;

@interface ScanViewController : UIViewController<AVCaptureMetadataOutputObjectsDelegate>
{
    int num;
    BOOL upOrdown;
    NSTimer * timer;
}
@property(assign,nonatomic)id<ScanViewControllerDelegate> delegate;

@property (strong,nonatomic)AVCaptureDevice * device;
@property (strong,nonatomic)AVCaptureDeviceInput * input;
@property (strong,nonatomic)AVCaptureMetadataOutput * output;
@property (strong,nonatomic)AVCaptureSession * session;
@property (strong,nonatomic)AVCaptureVideoPreviewLayer * preview;
@property (nonatomic, retain) UIImageView * line;

@end

@protocol ScanViewControllerDelegate <NSObject>

-(void)scanViewControllerScanResult:(NSString *) result;

@end