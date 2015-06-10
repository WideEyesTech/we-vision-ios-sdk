//
//  WE.h
//  WideEyesSDKiOS
//
//  Created by Guillem  on 21/05/15.
//  Copyright (c) 2015 WideEyes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WE : NSObject
+ (WE *)sharedInstance;

@property (nonatomic, strong) NSString *apiKey;

@end
