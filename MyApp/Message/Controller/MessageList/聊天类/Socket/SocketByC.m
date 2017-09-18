//
//  SocketByC.m
//  MyApp
//
//  Created by TWTD on 2017/5/25.
//  Copyright © 2017年 TWTD. All rights reserved.
//

#import "SocketByC.h"


@implementation SocketByC

+(SocketByC *) sharedInstance
{
    
    static SocketByC *SocketByC = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        SocketByC = [[self alloc] init];
    });
    
    return SocketByC;
}



@end
