//
//  WE.m
//  WideEyesSDKiOS
//
//  Created by Guillem  on 21/05/15.
//  Copyright (c) 2015 WideEyes. All rights reserved.
//

#import "WE.h"
static WE *sharedInstance;

@implementation WE
+ (WE *)sharedInstance {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[WE alloc] init];
    });
    
    return sharedInstance;
}

@end
