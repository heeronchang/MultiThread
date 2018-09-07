//
//  HCOSSpinLock.h
//  MultiThreadingDemo
//
//  Created by Heeron on 2018/8/30.
//  Copyright © 2018年 HeeronChang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HCOSSpinLock : NSObject

@property (atomic, strong) NSMutableArray *array;

@end
