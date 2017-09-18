//
//  CoreTextViewController.m
//  MyApp
//
//  Created by TWTD on 2017/7/3.
//  Copyright © 2017年 TWTD. All rights reserved.
//

#import "CoreTextViewController.h"
#import <CoreText/CoreText.h>

@interface CoreTextViewController ()
{
    UILabel * labe;
    NSString * labestr;
    UILabel * textView;
}

@end

@implementation CoreTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    labe = [[UILabel alloc]initWithFrame:CGRectMake(10, 104, 100, 200)];
    labestr  = @"啊实打实的奥术大师大所多大奥多所大所大所大手\n动阿萨德暗示的😒 ☹️☹️ ☹️🙁☹️啊打的啊手动暗示的暗示的暗示 asd asd a sdas";
//    NSString * str = @"NSNumbericSearch = 64//按照字符串里的数字为依据，算出顺序。例如";
//
//    [str substringWithRange:NSMakeRange(0, 10)];
    labe.backgroundColor = [UIColor grayColor];
    labe.font = [UIFont systemFontOfSize:14];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paragraphStyle.alignment = NSTextAlignmentLeft;
    paragraphStyle.lineSpacing = 5;
    paragraphStyle.hyphenationFactor = 1.0;
    paragraphStyle.firstLineHeadIndent = 0.0;
    paragraphStyle.paragraphSpacingBefore = 0.0;
    paragraphStyle.headIndent = 0;
    paragraphStyle.tailIndent = 0;
    
    NSDictionary *attributes = @{NSParagraphStyleAttributeName:paragraphStyle};
    labe.attributedText = [[NSAttributedString alloc]initWithString:labestr attributes:attributes];
    labe.numberOfLines = 0;
    
    [self.view addSubview:labe];
    
    UIButton * bt = [UIButton buttonWithType:(UIButtonTypeSystem)];
    bt.frame = CGRectMake(110, 64, 60, 40);
    bt.backgroundColor = [UIColor redColor];
    [bt addTarget:self action:@selector(getlineText) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:bt];
    
   
    
}

- (void)getlineText{
    NSString * text = labestr;
    UIFont * font = [labe font];
    CGRect rect = [labe frame];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paragraphStyle.alignment = NSTextAlignmentLeft;
    paragraphStyle.lineSpacing = 5;
    paragraphStyle.hyphenationFactor = 1.0;
    paragraphStyle.firstLineHeadIndent = 0.0;
    paragraphStyle.paragraphSpacingBefore = 0.0;
    paragraphStyle.headIndent = 0;
    paragraphStyle.tailIndent = 0;
    
    CTFontRef myFont = CTFontCreateWithName((__bridge CFStringRef)([font fontName]), [font pointSize], NULL);
    
    
    NSDictionary *attributes = @{(NSString *)kCTParagraphStyleAttributeName:paragraphStyle,(NSString *)kCTFontAttributeName:(__bridge id)myFont};
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:text];
 
//    [attStr addAttribute:(NSString *)kCTFontAttributeName value:(__bridge id)myFont range:NSMakeRange(0, attStr.length)];
    [attStr addAttributes:attributes range:NSMakeRange(0, attStr.length)];
    
    CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)attStr);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(0,0,rect.size.width,100000));
    
    CTFrameRef frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, 0), path, NULL);
    
    NSArray *lines = (__bridge NSArray *)CTFrameGetLines(frame);
    NSMutableArray *linesArray = [[NSMutableArray alloc]init];
    NSString * mutablestr = @"";
    for (id line in lines)
    {
        CTLineRef lineRef = (__bridge CTLineRef )line;
        CFRange lineRange = CTLineGetStringRange(lineRef);
        NSRange range = NSMakeRange(lineRange.location, lineRange.length);
        
        NSString *lineString = [text substringWithRange:range];
        
      
        
        
        NSLog(@"%@",lineString);
       mutablestr =  [mutablestr stringByAppendingString:lineString];
        if (![lineString containsString:@"\n"]) {
              mutablestr=[mutablestr stringByAppendingString:@"\n"];
        }
      
          NSLog(@"%@",mutablestr);
        [linesArray addObject:lineString];
    }
    
    
    NSLog(@"%@",mutablestr);
    
    textView = [[UILabel alloc] initWithFrame:CGRectMake(160, 104, 100, 200) ];
    textView.backgroundColor = [UIColor grayColor];
    textView.numberOfLines = 0;
    textView.font = [UIFont systemFontOfSize:14];
    textView.attributedText = [[NSAttributedString alloc]initWithString:mutablestr attributes:attributes];
    [self.view addSubview:textView];
  
    
    
}







@end
