//
//  HCDispatch_semaphore.m
//  MultiThreadingDemo
//
//  Created by Heeron on 2018/9/3.
//  Copyright © 2018年 HeeronChang. All rights reserved.
//

#import "HCDispatch_semaphore.h"

@implementation HCDispatch_semaphore
/**
 
 */

- (void)overview {
    // 传入的参数必须大于1 否则返沪null
    dispatch_semaphore_t lock = dispatch_semaphore_create(1);
    
    // wait = 0 表示不需要等待直接执行后续代码，wait ！= 0 需要等待信号或者超时，才能继续执行后续代码；
    // lock 信号量减一，判断是否大于0，如果大于0则继续执行后续代码，如果小于等于0，则等待信号量或者超时。
    long wait = dispatch_semaphore_wait(lock, DISPATCH_TIME_FOREVER);
    
    // 需要执行的代码
    
    // signal = 0 表示没有需要唤醒的线程，否则表示有一个或多个线程需要唤醒（依据线程优先级）
    long signal = dispatch_semaphore_signal(lock);
}

- (void)test {
    // https://stackoverflow.com/questions/23573114/objective-c-crash-on-destroy-helper-block
    NSMutableArray *products = [NSMutableArray arrayWithObjects:@"1",@"2",@"3", nil];
    NSLog(@"0-%@",products);
    
    __block dispatch_semaphore_t semaphore = dispatch_semaphore_create(products.count);
    NSLog(@"semaphore:%@",semaphore);
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        sleep(3);
        NSLog(@"1");
        
        if (products.count > 0) {
            NSLog(@"consume-1:消费了一个商品");
            [products removeLastObject];NSLog(@"1-%@",products);
            
//            dispatch_semaphore_signal(semaphore);
        } else {
            NSLog(@"consume-1:没有商品消费了");
        }
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        sleep(3);
        NSLog(@"2");
        
        if (products.count > 0) {
            NSLog(@"consume-2:消费了一个商品");
            [products removeLastObject];NSLog(@"2-%@",products);
//            dispatch_semaphore_signal(semaphore);
        } else {
            NSLog(@"consume-2:没有商品消费了");
        }
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        sleep(3);
        NSLog(@"3");
        
        if (products.count > 0) {
            NSLog(@"consume-3:消费了一个商品");
            [products removeLastObject];NSLog(@"3-%@",products);
//            dispatch_semaphore_signal(semaphore);
        } else {
            NSLog(@"consume-3:没有商品消费了");
        }
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        sleep(3);
        NSLog(@"4");
        
        if (products.count > 0) {
            NSLog(@"consume-4:消费了一个商品");
            [products removeLastObject];NSLog(@"4-%@",products);
//            dispatch_semaphore_signal(semaphore);
        } else {
            NSLog(@"consume-4:没有商品消费了");
        }
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        sleep(3);
        NSLog(@"5");
        
        if (products.count > 0) {
            NSLog(@"consume-5:消费了一个商品");
            [products removeLastObject];NSLog(@"5-%@",products);
//            dispatch_semaphore_signal(semaphore);
        } else {
            NSLog(@"consume-5:没有商品消费了");
        }
    });
    
    /// 生产
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"开始生产商品");
        sleep(5);
        [products addObject:@"4"];
        dispatch_semaphore_signal(semaphore);
        [products addObject:@"5"];
        dispatch_semaphore_signal(semaphore);
        NSLog(@"结束生产商品");
        NSLog(@"生产了两个商品");
    });
}

@end
