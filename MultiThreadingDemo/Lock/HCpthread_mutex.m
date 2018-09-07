//
//  HCpthread_mutex.m
//  MultiThreadingDemo
//
//  Created by Heeron on 2018/9/3.
//  Copyright © 2018年 HeeronChang. All rights reserved.
//

#import "HCpthread_mutex.h"
#import <pthread.h>

@implementation HCpthread_mutex

/**
 */


/// 动态
- (void)test {
    pthread_mutexattr_t attr;
    pthread_mutexattr_init(&attr);
    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_NORMAL);
    
    pthread_mutex_t lock;
    // 设置属性
    pthread_mutex_init(&lock, &attr);
    
    // 上锁
    pthread_mutex_lock(&lock);
    
    // 需要执行的代码
    
    // 解锁
    pthread_mutex_unlock(&lock);
}

/// 静态
- (void)testStatic {
    pthread_mutex_t lock = PTHREAD_MUTEX_INITIALIZER;
    pthread_mutex_lock(&lock);
    // do sth
    pthread_mutex_unlock(&lock);
}

/// 信号量
- (void)testSignal {
    __block pthread_mutex_t mutext = PTHREAD_MUTEX_INITIALIZER;
    __block pthread_cond_t cond = PTHREAD_COND_INITIALIZER;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        pthread_mutex_lock(&mutext);
        NSLog(@"线程 0：加锁");
        pthread_cond_wait(&cond, &mutext);
        NSLog(@"线程 0：wait");
        pthread_mutex_unlock(&mutext);
        NSLog(@"线程 0：解锁");
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        sleep(3);
        pthread_mutex_lock(&mutext);
        NSLog(@"线程 1：加锁");
        pthread_cond_signal(&cond);
        NSLog(@"线程 1：signal");
        pthread_mutex_unlock(&mutext);
        NSLog(@"线程 1：解锁");
    });
}

/// 递归锁
- (void)testRecursive {
    pthread_mutexattr_t attr;
    pthread_mutexattr_init(&attr);
    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);
    
    pthread_mutex_t lock;
    pthread_mutex_init(&lock, &attr);
    
    // 加锁
    pthread_mutex_lock(&lock);
    
    // do something
    
    // 解锁
    pthread_mutex_unlock(&lock);
}

@end
