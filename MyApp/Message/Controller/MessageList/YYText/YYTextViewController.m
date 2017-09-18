//
//  YYTextViewController.m
//  MyApp
//
//  Created by TWTD on 2017/5/18.
//  Copyright © 2017年 TWTD. All rights reserved.
//

#import "YYTextViewController.h"

@interface YYTextViewController ()<UIGestureRecognizerDelegate>
{
    UILabel * label;
}
@property (weak, nonatomic) IBOutlet UIButton *bigbt;
@property (weak, nonatomic) IBOutlet UIButton *smallbt;

@property (nonatomic,assign) CGFloat totalScale;
@property (nonatomic,strong)UIImageView * image;
@end

@implementation YYTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 164, 200, 400)];
    _image.userInteractionEnabled = YES;
    _image.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:_image];
    self.totalScale = 1.0;
    
    
    
    UIPinchGestureRecognizer*  pinchRecognizer = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(bookModePageshow:)];
    [pinchRecognizer setDelegate:self];
    [_image addGestureRecognizer:pinchRecognizer];
    
    UIPanGestureRecognizer*panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panView:)];
    panGestureRecognizer.delegate = self;
    [_image addGestureRecognizer:panGestureRecognizer];
    
    for (int i=0; i<2; i++) {
        UIImageView* image = [[UIImageView alloc]initWithFrame:CGRectMake(0, (i*200), 200, 200)];
        image.userInteractionEnabled = YES;
        image.image = [UIImage imageNamed:@"back.jpg"];
        image.backgroundColor = [UIColor yellowColor];
        [_image addSubview:image];
        
        label = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 100, 80)];
        [image addSubview:label];
        
        label.backgroundColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:10];
        
        label.numberOfLines = 0;
        label.userInteractionEnabled = YES;
        label.text = @"这个很小，模糊么奥术大师多奥术大师多奥术大师阿萨德";
//        label.adjustsFontSizeToFitWidth = YES;
        label.textColor = [UIColor redColor];
        
    }
    
    
    
}
- (IBAction)bigbt:(id)sender {
    _image.frame = CGRectMake(_image.frame.origin.x, _image.frame.origin.y, _image.frame.size.width*2, _image.frame.size.height*2);
    
    label.frame = CGRectMake(10, 100, label.frame.size.width*2, label.frame.size.height*2);
    
    label.font = [UIFont systemFontOfSize:label.font.pointSize*2];
}
- (IBAction)smallbt:(id)sender {
    _image.frame = CGRectMake(_image.frame.origin.x, _image.frame.origin.y, _image.frame.size.width*0.5, _image.frame.size.height*0.5);
    label.frame = CGRectMake(10, 100, label.frame.size.width*0.5, label.frame.size.height*0.5);
    label.font = [UIFont systemFontOfSize:label.font.pointSize*0.5];
}

- (CGRect)getnewframe:(CGRect)frame withfloat:(float)scale{
    CGRect newframe = CGRectMake(frame.origin.x*scale, frame.origin.y*scale, frame.size.width*scale, frame.size.height*scale);
    return newframe;
}

// 处理拖拉手势
- (void) panView:(UIPanGestureRecognizer *)panGestureRecognizer1
{
    
    UIView *view = panGestureRecognizer1.view;
    
    if (panGestureRecognizer1.state == UIGestureRecognizerStateBegan ||panGestureRecognizer1.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [panGestureRecognizer1 translationInView:view.superview];
        
        [view setCenter:(CGPoint){view.center.x + translation.x, view.center.y + translation.y}];
        
        [panGestureRecognizer1 setTranslation:CGPointZero inView:view.superview];
        
    }
    
    
}


// 处理缩放手势
- (void) bookModePageshow:(UIPinchGestureRecognizer *)pinchGestureRecognizer
{
    
    
    
    
    UIView *view = pinchGestureRecognizer.view;
    CGFloat scale = pinchGestureRecognizer.scale;
    
    //放大情况
    if(scale > 1.0){
        
        if(self.totalScale > 2.0)
            return;
        else
        {
            CGPoint cnterpoint = view.center;
            view.frame = CGRectMake(0, 100, view.frame.size.width*scale, view.frame.size.height*scale);
            view.center = cnterpoint;
            
               [self dealpanView:view byscale:scale];
            //                view.transform = CGAffineTransformScale(view.transform, scale, scale);
//            for (UIView * subview  in view.subviews) {
//                if ([subview isKindOfClass:[UIImageView class]]) {
//                    UIImageView * somelable = (UIImageView*)subview;
//                    somelable.frame = [self getframe:somelable.frame withScale:scale];
//                    for (UIView * subview  in somelable.subviews) {
//                        if ([subview isKindOfClass:[UILabel class]]) {
//                            UILabel * somelable = (UILabel*)subview;
//                            somelable.font = [self getfont:somelable.font withScale:scale];
//                            somelable.frame = [self getframe:somelable.frame withScale:scale];
//                        }
//                        if ([subview isKindOfClass:[UIImageView class]]) {
//                            UIImageView * somelable = (UIImageView*)subview;
//                            somelable.frame = [self getframe:somelable.frame withScale:scale];
//                        }
//                    }
//                }
//                
//            }
            
            
            // 移动手势
            
        }
    }
    //缩小情况
    if (scale < 1.0) {
        
        if (self.totalScale < 0.5) return;
        else{
            //               view.transform = CGAffineTransformScale(view.transform, scale, scale);
            CGPoint cnterpoint = view.center;
            view.frame = CGRectMake(0, 100, view.frame.size.width*scale, view.frame.size.height*scale);
            view.center = cnterpoint;
            [self dealpanView:view byscale:scale];
//            for (UIView * subview  in view.subviews) {
//                if ([subview isKindOfClass:[UIImageView class]]) {
//                    UIImageView * somelable = (UIImageView*)subview;
//                    
//                    somelable.frame = [self getframe:somelable.frame withScale:scale];
//                    
//                    for (UIView * subview  in somelable.subviews) {
//                        if ([subview isKindOfClass:[UILabel class]]) {
//                            UILabel * somelable = (UILabel*)subview;
//                            somelable.font = [self getfont:somelable.font withScale:scale];
//                            somelable.frame = [self getframe:somelable.frame withScale:scale];
//                        }
//                        if ([subview isKindOfClass:[UIImageView class]]) {
//                            UIImageView * somelable = (UIImageView*)subview;
//                            somelable.frame = [self getframe:somelable.frame withScale:scale];
//                        }
//                    }
//                    
//                }
//                
//            }
            //                view.transform = CGAffineTransformScale(view.transform, scale, scale);
        }
    }
    self.totalScale =scale;
    
    pinchGestureRecognizer.scale = 1.0;
    //    }
}


- (BOOL)dealpanView:(UIView*)view byscale:(float)scale{
    if (view.subviews.count>0) {
//        scale++;
        NSLog(@"------- %lu ---",(unsigned long)view.subviews.count);
        for (UIView * subview  in view.subviews) {
            NSLog(@" %f ===---%@",scale,subview.class);
            
            if ([subview isKindOfClass:[UILabel class]]) {
                UILabel * somelable = (UILabel*)subview;
                somelable.font = [self getfont:somelable.font withScale:scale];
                somelable.frame = [self getframe:somelable.frame withScale:scale];
                [self dealpanView:somelable byscale:scale];
            }
            if ([subview isKindOfClass:[UIImageView class]]) {
                UIImageView * somelable = (UIImageView*)subview;
                somelable.frame = [self getframe:somelable.frame withScale:scale];
                [self dealpanView:somelable byscale:scale];
            }
          
            
        }
    }
    
    
    
    return YES;
}

- (CGRect)getframe:(CGRect)frame withScale:(float)scale{
    return CGRectMake(frame.origin.x*scale, frame.origin.y*scale, frame.size.width*scale, frame.size.height*scale);
}

- (UIFont*)getfont:(UIFont*)font withScale:(float)scale{
    return [UIFont systemFontOfSize:font.pointSize*scale];
}



@end
