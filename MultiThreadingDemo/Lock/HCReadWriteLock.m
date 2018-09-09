//
//  HCReadWriteLock.m
//  MultiThreadingDemo
//
//  Created by Heeron on 2018/9/6.
//  Copyright © 2018年 HeeronChang. All rights reserved.
//

#import "HCReadWriteLock.h"

@interface HCReadWriteLock()

@property (nonatomic, copy) NSString *testStr;
@property (nonatomic, strong) dispatch_queue_t syncQueue;

@end
@implementation HCReadWriteLock {
    NSString *_testStr;
}

@synthesize testStr = _testStr;

- (NSString *)testStr {
    __block NSString *str;
    dispatch_sync(self.syncQueue, ^{
        str = self->_testStr;
    });
    
    return str;
}

@end
