//
//  RootTableViewController.m
//  MultiThreadingDemo
//
//  Created by Heeron on 2018/8/30.
//  Copyright © 2018年 HeeronChang. All rights reserved.
//

#import "RootTableViewController.h"
#import "HCNSCondition.h"
#import "HCNSConditionLock.h"
#import "HCDispatch_semaphore.h"
#import "HCpthread_mutex.h"


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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
