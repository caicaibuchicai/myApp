//
//  XZChatViewController.h
//  XZ_WeChat
//
//  Created by 郭现壮 on 16/9/27.
//  Copyright © 2016年 gxz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XZChatViewController : UIViewController

@property (nonatomic, strong) XZGroup *group;
@property (nonatomic, strong) NSInputStream *inputStream;//对应输入流
@property (nonatomic, strong) NSOutputStream *outputStream;//对应输出流
@end
