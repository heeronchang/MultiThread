//
//  HCPthread.m
//  MultiThreadingDemo
//
//  Created by Heeron on 2018/10/9.
//  Copyright © 2018 HeeronChang. All rights reserved.
//

#import "HCPthread.h"
#import <pthread.h>

@implementation HCPthread

void * run (void *param) {
    NSLog(@"%@",[NSThread currentThread]);
    NSString *parameters = (__bridge NSString *)(param);
    NSLog(@"%@",parameters);
    return NULL;
}

- (void)test {
    // 创建线程
    pthread_t thread;
    // 开启线程，执行任务
    NSString *str = @"10";
    pthread_create(&thread, NULL, run, (__bridge void *)(str));
    // 子线程的状态设置为 detached
    pthread_detach(thread);

}

@end
