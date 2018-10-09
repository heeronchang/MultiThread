//
//  HCNSThread.m
//  MultiThreadingDemo
//
//  Created by Heeron on 2018/10/9.
//  Copyright © 2018 HeeronChang. All rights reserved.
//

#import "HCNSThread.h"

@implementation HCNSThread

- (void)test {
    // 创建线程
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(dosth) object:nil];
    // 启动线程
    [thread start];
}

- (void)test2 {
    // 创建并启动线程
    [NSThread detachNewThreadSelector:@selector(dosth) toTarget:self withObject:nil];
}

- (void)test3 {
    // 隐式创建线程并启动
    [NSThread performSelectorInBackground:@selector(dosth) withObject:nil];
}

- (void)dosth {
    NSLog(@"%@", [NSThread currentThread]);
}

@end
