//
//  HCSubOperation.m
//  MultiThreadingDemo
//
//  Created by Heeron on 2018/10/8.
//  Copyright © 2018 HeeronChang. All rights reserved.
//

#import "HCSubOperation.h"

@implementation HCSubOperation

- (void)main {
    if (!self.isCancelled) {
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"1---%@", [NSThread currentThread]);
        }
    }
}

@end
