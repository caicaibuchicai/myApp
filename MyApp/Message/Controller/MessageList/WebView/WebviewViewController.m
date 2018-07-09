//
//  WebviewViewController.m
//  MyApp
//
//  Created by TWTD on 2017/8/2.
//  Copyright © 2017年 TWTD. All rights reserved.
//

#import "WebviewViewController.h"

#import <WebKit/WebKit.h>
@interface WebviewViewController ()<WKNavigationDelegate,WKScriptMessageHandler>


@property (nonatomic,weak) WKWebView  *webView;
@property (nonatomic,weak) UIProgressView *progressView;

@end

@implementation WebviewViewController



- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSString *  str = @"http://127.0.0.1/html/js.html";
    NSURL  *url =     [NSURL URLWithString:str];;
   
    
    
    
    NSURL *fileUrl =[[NSBundle mainBundle] URLForResource:@"js.html" withExtension:nil];
    
     NSURLRequest  *request = [NSURLRequest  requestWithURL:fileUrl];
    [self.webView  loadRequest:request];
    
    UIButton * bt = [UIButton buttonWithType:(UIButtonTypeSystem)];
    bt.frame =CGRectMake(200, 64, 200, 50);
    bt.backgroundColor = [UIColor redColor];
    [bt setTitle:@"点击调用web方法：appclick" forState:(UIControlStateNormal)];
    [bt addTarget:self action:@selector(btTap) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:bt];
    [self.view bringSubviewToFront:bt];
}

- (void)btTap{
    NSString * str =@"我调用了js方法";
//    [str dataUsingEncoding:NSUTF8StringEncoding]
     NSString *jsmethod = [NSString stringWithFormat:@"appclick(\"%@\")",str];
//            oc 调用  js
            [_webView  evaluateJavaScript:jsmethod completionHandler:^(id _Nullable result, NSError * _Nullable error) {
                NSLog(@"%@",result);
    
            }];
}






-(void)buttonBackView{
    
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)dealloc{
    if (_webView) {
        [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
        [self.progressView removeFromSuperview];
    }
}

-(UIProgressView*)progressView{
    
    if (_progressView == nil) {
        UIProgressView  *progressView = [[UIProgressView alloc ] initWithFrame:CGRectMake(0, 42, 100, 2)];
      
        progressView.transform = CGAffineTransformMakeScale(0, 1.5f);
        
        [self.navigationController.navigationBar  addSubview:progressView];
        
        _progressView = progressView;
    }
    
    return _progressView;
}



- (WKWebView*)webView{
    
    if (_webView == nil) {
        
        // fix: WKWebView显示 字体偏小问题
        // http://www.jianshu.com/p/92cac63efa07
        
        NSString *jScript = @"var meta = document.createElement('meta'); meta.setAttribute('name', 'viewport'); meta.setAttribute('content', 'width=device-width'); document.getElementsByTagName('head')[0].appendChild(meta);";
        
        WKUserScript *wkUScript = [[WKUserScript alloc] initWithSource:jScript injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
        
        WKUserContentController *wkUController = [[WKUserContentController alloc] init];
        [wkUController addUserScript:wkUScript];
        [wkUController addScriptMessageHandler:self name:@"share"];
        
        
        WKWebViewConfiguration *webviewConfig = [[WKWebViewConfiguration alloc] init];
        webviewConfig.userContentController = wkUController;
        
        
        
        WKWebView  *webView = [[WKWebView alloc ] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 64) configuration:webviewConfig];
        webView.backgroundColor = [UIColor clearColor];
        webView.navigationDelegate = self;
        
        [webView  addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];

        [self.view  addSubview:webView];
        _webView = webView;
        
    }
    
    return _webView;
}

#pragma mark -- WKScriptMessageHandler
-(void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message
{
    //JS调用OC方法
    //message.boby就是JS里传过来的参数
    NSLog(@"body:%@",message.body);
    
    if ([message.name isEqualToString:@"callByReward"]) {
        NSLog(@"body:%@",message.body);
        
    }
}




-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    if ([keyPath  isEqualToString:@"estimatedProgress"]) {
        
        self.progressView.progress = self.webView.estimatedProgress;
        
        if (self.progressView.progress == 1) {
            
            __weak typeof (self)weakSelf = self;
            [UIView animateWithDuration:0.25f delay:0.3f options:UIViewAnimationOptionCurveEaseOut animations:^{
                weakSelf.progressView.transform = CGAffineTransformMakeScale(0.0f, 1.4f);
            } completion:^(BOOL finished) {
                weakSelf.progressView.hidden = YES;
                
            }];
            
        }
        
    }else{
        
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
    
}



#pragma mark
#pragma mark  UIWebViewDelegate

-(void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    
    self.progressView.hidden = NO;
    //开始加载网页的时候将progressView的Height恢复为1.5倍
    self.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.5f);
    //防止progressView被网页挡住
    [self.navigationController.navigationBar bringSubviewToFront:self.progressView];
    
}


-(void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    
}

-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    //修改字体大小 105%
    [ webView evaluateJavaScript:@"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '105%'" completionHandler:nil];
    
    self.progressView.hidden = YES;
}

-(void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    self.progressView.hidden = YES;
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
