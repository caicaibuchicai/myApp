//
//  CropViewController.m
//  MyApp
//
//  Created by TWTD on 2017/6/20.
//  Copyright © 2017年 TWTD. All rights reserved.
//

#import "CropViewController.h"
#import "TOCropViewController.h"

@interface CropViewController ()<TOCropViewControllerDelegate>

@property (strong,nonatomic)UIImageView * cropView;

@end

@implementation CropViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    self.cropView = [[UIImageView alloc]initWithFrame:CGRectZero];
    _cropView.userInteractionEnabled = YES;
    _cropView.backgroundColor = [UIColor blueColor];
    _cropView.image = [UIImage imageNamed:@"222.JPG"];
    [_cropView setContentScaleFactor:[[UIScreen mainScreen] scale]];
    _cropView.contentMode =  UIViewContentModeScaleAspectFit;
    _cropView.autoresizingMask = UIViewAutoresizingNone;
    _cropView.autoresizesSubviews = NO;
    _cropView.clipsToBounds  = YES;
   
    
    CGAffineTransform rotate = CGAffineTransformMakeRotation( 1.0 / 180.0 * 3.14*10 );
    [_cropView setTransform:rotate];
    [self.view addSubview:self.cropView];
    [_cropView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.view).offset(10);
        make.top.equalTo(self.view).offset(100);
        make.size.mas_equalTo(CGSizeMake(78.241762333119468, 88.449606554170714));
        
    }];
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(selectImage)];
    
    [_cropView addGestureRecognizer:tapGestureRecognizer];
    
}


- (void)selectImage{
    TOCropViewController *cropController = [[TOCropViewController alloc] initWithCroppingStyle:TOCropViewCroppingStyleDefault image: [UIImage imageNamed:@"222.JPG"]];
    cropController.delegate = self;
    
    // 自定义裁切比例
    cropController.aspectRatioPreset = TOCropViewControllerAspectRatioPresetCustom;
    cropController.customAspectRatio =     self.cropView.frame.size;
    
    // 裁切比例锁定
    cropController.aspectRatioLockEnabled = YES;
    cropController.resetAspectRatioEnabled = NO;
    
    // 隐藏比例选择按钮
    cropController.aspectRatioPickerButtonHidden= YES;
    
    // 隐藏旋转按钮
    cropController.rotateButtonsHidden = YES;
    
    [self presentViewController:cropController animated:YES completion:^{
        
    }];
}
#pragma mark - Cropper Delegate -
- (void)cropViewController:(TOCropViewController *)cropViewController didCropToImage:(UIImage *)image withRect:(CGRect)cropRect angle:(NSInteger)angle
{
    self.cropView.image =image;
    
    [cropViewController dismissViewControllerAnimated:YES completion:^{
    }];
}



@end
