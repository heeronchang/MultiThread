//
//  HCNSLock.m
//  MultiThreadingDemo
//
//  Created by Heeron on 2018/9/3.
//  Copyright © 2018年 HeeronChang. All rights reserved.
//

#import "HCNSLock.h"

@implementation HCNSLock
/**
*/

- (void)test {
    NSLock *lock = [NSLock new];
    
    // 加锁
    [lock lock];
    
    // 待执行的代码
    
    // 解锁
    [lock unlock];
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [lock lock];
        NSLog(@"do sth");
        sleep(1);
        [lock unlock];
    });
}

/// 递归锁
- (void)testRecursive {
    NSRecursiveLock *lock = [NSRecursiveLock new];
    
    // 加锁
    [lock lock];
    // do sth
    
    // 解锁
    [lock unlock];
}

@end
