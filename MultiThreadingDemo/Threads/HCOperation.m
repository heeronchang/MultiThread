//
//  HCOperation.m
//  MultiThreadingDemo
//
//  Created by Heeron on 2018/10/8.
//  Copyright © 2018 HeeronChang. All rights reserved.
//

#import "HCOperation.h"
#import "HCSubOperation.h"

@implementation HCOperation

- (void)testInvocation {
    NSInvocationOperation *invocationOpt = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(task1) object:nil];
    [invocationOpt start];
}

- (void)testInvocationInOther {
    [NSThread detachNewThreadSelector:@selector(testInvocation) toTarget:self withObject:nil];
}

- (void)testBlockOperation {
    NSBlockOperation *opt = [NSBlockOperation blockOperationWithBlock:^{
        for (int i = 0; i < 2; i ++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"1---%@", [NSThread currentThread]);
        }
    }];
    
    // 添加额外的操作
    [opt addExecutionBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"2---%@", [NSThread currentThread]); // 打印当前线程
        }
    }];
    [opt addExecutionBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"3---%@", [NSThread currentThread]); // 打印当前线程
        }
    }];
    [opt addExecutionBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"4---%@", [NSThread currentThread]); // 打印当前线程
        }
    }];
    [opt addExecutionBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"5---%@", [NSThread currentThread]); // 打印当前线程
        }
    }];
    [opt addExecutionBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"6---%@", [NSThread currentThread]); // 打印当前线程
        }
    }];
    [opt addExecutionBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"7---%@", [NSThread currentThread]); // 打印当前线程
        }
    }];
    [opt addExecutionBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"8---%@", [NSThread currentThread]); // 打印当前线程
        }
    }];
    
    [opt start];
}

- (void)testCustomerOperation {
    HCSubOperation *subOpt = [HCSubOperation new];
    [subOpt start];
}

- (void)task1 {
    for (int i = 0; i < 2; i++) {
        [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
        NSLog(@"1---%@", [NSThread currentThread]); // 打印当前线程
    }
}

@end
