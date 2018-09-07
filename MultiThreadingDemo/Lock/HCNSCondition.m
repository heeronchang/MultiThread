//
//  HCNSCondition.m
//  MultiThreadingDemo
//
//  Created by Heeron on 2018/9/3.
//  Copyright © 2018年 HeeronChang. All rights reserved.
//

#import "HCNSCondition.h"

@implementation HCNSCondition

- (void)test {
    
    /// 生产消费
    NSMutableArray *products = [NSMutableArray array];
    
    NSCondition *lock = [NSCondition new];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [lock lock];
        NSLog(@"product+1.：加锁");
        sleep(5);
        NSLog(@"product+2.：生产产品中（随眠5秒）");
        [products addObject:@"product"];
        NSLog(@"product+3.：生产产品完成");
        NSLog(@"product+4.：发送生产信号");
        [lock signal];
        NSLog(@"product+5.：发送生产信号完毕");
        [lock unlock];
        NSLog(@"product+6.：解锁");
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        [lock lock];NSLog(@"consume-1.：加锁");
        NSLog(@"consume-2.：准备消费产品");
        if (products.count == 0) {
            NSLog(@"consume-3.：无产品，休眠等待");
            [lock wait];
        }
        
        [products removeObjectAtIndex:0];NSLog(@"consume-4.：消费产品");
        
        [lock unlock];NSLog(@"consume-5.：解锁");
    });
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        [lock lock];NSLog(@"2consume-1.：加锁");
        NSLog(@"2consume-2.：准备消费产品");
        if (products.count == 0) {
            NSLog(@"2consume-3.：无产品，休眠等待");
            [lock wait];
        }
        
        [products removeObjectAtIndex:0];NSLog(@"2consume-4.：消费产品");
        
        [lock unlock];NSLog(@"2consume-5.：解锁");
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [lock lock];
        NSLog(@"product+1.：加锁");
        sleep(5);
        NSLog(@"product+2.：生产产品中（随眠5秒）");
        [products addObject:@"product"];
        NSLog(@"product+3.：生产产品完成");
        NSLog(@"product+4.：发送生产信号");
        [lock signal];
        NSLog(@"product+5.：发送生产信号完毕");
        [lock unlock];
        NSLog(@"product+6.：解锁");
    });
}

@end
