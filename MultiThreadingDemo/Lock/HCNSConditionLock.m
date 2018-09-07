//
//  HCNSConditionLock.m
//  MultiThreadingDemo
//
//  Created by Heeron on 2018/9/6.
//  Copyright © 2018年 HeeronChang. All rights reserved.
//

#import "HCNSConditionLock.h"

@implementation HCNSConditionLock

/**
    lock 不分条件，如果锁没被申请直接执行代码
    unlock 不会清空条件，之后满足条件的锁还会执行
    unlockWithCondition: 设置解锁条件
    lockWhenCondition: 满足条件执行代码
 */

- (void)test {
//    NSConditionLock *lock = [NSConditionLock new];
//
//    // 加锁
//    [lock lock];
//
//    // 需要执行的代码
//
//    // 解锁
//    [lock unlock];
    NSConditionLock *conditionLock = [[NSConditionLock alloc] initWithCondition:0];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (int i = 0; i < 3; i++) {
            [conditionLock lock];
            NSLog(@"线程 0:%d",i);
            sleep(1);
            [conditionLock unlockWithCondition:i];
        }
    });
    
    sleep(1);
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [conditionLock lock];
         NSLog(@"线程 1");
        [conditionLock unlock];
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [conditionLock lockWhenCondition:1];
        NSLog(@"线程 3");
        [conditionLock unlockWithCondition:2];
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [conditionLock lockWhenCondition:0];
        NSLog(@"线程 4");
        [conditionLock unlockWithCondition:1];
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [conditionLock lockWhenCondition:2];
        NSLog(@"线程 2");
        [conditionLock unlockWithCondition:0];
    });
    
}

@end
