//
//  OpenFlashlightViewController.m
//  LLBaseKit
//
//  Created by LiLei on 5/9/18.
//

#import "OpenFlashlightViewController.h"
#import <ImageIO/ImageIO.h>
#import <AVFoundation/AVFoundation.h>
#import "LLBaseConfgurationSceneObject.h"
@interface OpenFlashlightViewController ()<AVCaptureVideoDataOutputSampleBufferDelegate>

@property (nonatomic, strong) AVCaptureSession *session;

@end

@implementation OpenFlashlightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"测试光感";
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self lightSensitive];
    });
}

- (void)lightSensitive{
    
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    AVCaptureDeviceInput *input = [[AVCaptureDeviceInput alloc]initWithDevice:device error:nil];
    AVCaptureVideoDataOutput *output =[[AVCaptureVideoDataOutput alloc]init];
    [output setSampleBufferDelegate:self queue:dispatch_get_main_queue()];
    
    self.session = [[AVCaptureSession alloc]init];
    [self.session setSessionPreset:AVCaptureSessionPresetHigh];
    
    if ([self.session canAddInput:input]) {
        [self.session addInput:input];
    }
    if ([self.session canAddOutput:output]) {
        [self.session addOutput:output];
    }
    [self.session startRunning];
    
    
}

- (void)captureOutput:(AVCaptureOutput *)output didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection{
    CFDictionaryRef metadataDict = CMCopyDictionaryOfAttachments(NULL,sampleBuffer, kCMAttachmentMode_ShouldPropagate);
    NSDictionary *metadata = [[NSMutableDictionary alloc] initWithDictionary:(__bridge NSDictionary*)metadataDict];
    CFRelease(metadataDict);
    NSDictionary *exifMetadata = [[metadata objectForKey:(NSString *)kCGImagePropertyExifDictionary] mutableCopy];
    float brightnessValue = [[exifMetadata objectForKey:(NSString *)kCGImagePropertyExifBrightnessValue] floatValue];
    
    NSLog(@"%f",brightnessValue);
    
    
    // 根据brightnessValue的值来打开和关闭闪光灯
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    BOOL result = [device hasTorch];// 判断设备是否有闪光灯
    if ((brightnessValue < 0) && result) {// 打开闪光灯
        
        [device lockForConfiguration:nil];
        
        [device setTorchMode: AVCaptureTorchModeOn];//开
        
        [device unlockForConfiguration];
        
    }else if((brightnessValue > 0) && result) {// 关闭闪光灯
        
        [device lockForConfiguration:nil];
        [device setTorchMode: AVCaptureTorchModeOff];//关
        [device unlockForConfiguration];
        
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
