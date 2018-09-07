//
//  HCOSSpinLock.m
//  MultiThreadingDemo
//
//  Created by Heeron on 2018/8/30.
//  Copyright © 2018年 HeeronChang. All rights reserved.
//

#import "HCOSSpinLock.h"
#import <libkern/OSAtomic.h>

@implementation HCOSSpinLock

/**
 自旋锁，
 */

- (void)test {
    __block OSSpinLock lock = OS_SPINLOCK_INIT;
    OSSpinLockLock(&lock);
    
    // do something
    
    OSSpinLockUnlock(&lock);
}

- (void)insetObj:(id)obj {
    
}

@end
