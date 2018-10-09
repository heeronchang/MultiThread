//
//  HCOperation.h
//  MultiThreadingDemo
//
//  Created by Heeron on 2018/10/8.
//  Copyright © 2018 HeeronChang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HCOperation : NSObject

/// invocation
- (void)testInvocation;
- (void)testInvocationInOther;
/// block operation
- (void)testBlockOperation;
/// customer operation
- (void)testCustomerOperation;

@end

NS_ASSUME_NONNULL_END
