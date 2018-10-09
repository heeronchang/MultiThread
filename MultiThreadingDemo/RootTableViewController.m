//
//  RootTableViewController.m
//  MultiThreadingDemo
//
//  Created by Heeron on 2018/8/30.
//  Copyright © 2018年 HeeronChang. All rights reserved.
//

#import "RootTableViewController.h"

// MARK: 锁
#import "HCNSCondition.h"
#import "HCNSConditionLock.h"
#import "HCDispatch_semaphore.h"
#import "HCpthread_mutex.h"

// MARK: 多线程
#import "HCGCD.h"
#import "HCOperation.h"
#import "HCOperationQueue.h"
#import "HCPthread.h"


@interface RootTableViewController ()

@end

@implementation RootTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)OSSpinLockAction:(UIButton *)sender {
}

- (IBAction)NSConditionAction:(UIButton *)sender {
    HCNSCondition *conditionObj = [HCNSCondition new];
    [conditionObj test];
}
- (IBAction)dispatch_semaphoreAction:(UIButton *)sender {
    HCDispatch_semaphore *dispatch_semaphoreObj = [HCDispatch_semaphore new];
    [dispatch_semaphoreObj test];
}
- (IBAction)pthread_mutexAction:(UIButton *)sender {
    HCpthread_mutex *pthread_mutexObj = [HCpthread_mutex new];
    [pthread_mutexObj testSignal];
}
- (IBAction)NSConditionLockAction:(UIButton *)sender {
    HCNSConditionLock *conditionLockObj = [HCNSConditionLock new];
    [conditionLockObj test];
}

// MARK: GCD
- (IBAction)sync_serial:(id)sender {
    HCGCD *obj = [HCGCD new];
    [obj test_Sync_Serial];
}
- (IBAction)async_serial:(id)sender {
    HCGCD *obj = [HCGCD new];
    [obj test_async_serial];
}
- (IBAction)sync_concurrent:(id)sender {
    HCGCD *obj = [HCGCD new];
    [obj test_sync_concurrent];
}
- (IBAction)async_concurrent:(id)sender {
    HCGCD *obj = [HCGCD new];
    [obj test_async_concurrent];
}
- (IBAction)sync_main_main:(id)sender {
    HCGCD *obj = [HCGCD new];
    [obj test_sync_main];
}
- (IBAction)sync_main_other:(id)sender {
    HCGCD *obj = [HCGCD new];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [obj test_sync_main];
    });
}
- (IBAction)NSInvocationOperation:(id)sender {
    HCOperation *opt = [HCOperation new];
    [opt testInvocation];
}
- (IBAction)NSInvocationOperationInOther:(id)sender {
    HCOperation *opt = [HCOperation new];
    [opt testInvocationInOther];
}
- (IBAction)NSBlockOperation:(id)sender {
    HCOperation *opt = [HCOperation new];
    [opt testBlockOperation];
}
- (IBAction)customerOperation:(id)sender {
    HCOperation *opt = [HCOperation new];
    [opt testCustomerOperation];
}
- (IBAction)NSOperationQueue:(id)sender {
    HCOperationQueue *queueOpt = [HCOperationQueue new];
    [queueOpt testOperationQueue];
}
- (IBAction)pthread_test:(id)sender {
    HCPthread *pthread = [HCPthread new];
    [pthread test];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
