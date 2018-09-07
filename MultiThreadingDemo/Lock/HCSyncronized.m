//
//  HCSyncronized.m
//  MultiThreadingDemo
//
//  Created by Heeron on 2018/9/3.
//  Copyright © 2018年 HeeronChang. All rights reserved.
//

#import "HCSyncronized.h"

@implementation HCSyncronized

- (void)test {
    NSObject *obj = [NSObject new];
    
    @synchronized(obj) {
        // do sth
    }
}

@end
