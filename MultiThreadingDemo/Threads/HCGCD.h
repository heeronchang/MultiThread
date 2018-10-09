//
//  HCGCD.h
//  MultiThreadingDemo
//
//  Created by Heeron on 2018/9/30.
//  Copyright © 2018 HeeronChang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HCGCD : NSObject

/// 同步+串行
- (void)test_Sync_Serial;
/// 异步任务+串行队列
- (void)test_async_serial;
/// 同步任务+并发队列
- (void)test_sync_concurrent;
/// 异步任务+并发队列
- (void)test_async_concurrent;
/// 同步任务+主队列
- (void)test_sync_main;

@end

NS_ASSUME_NONNULL_END
