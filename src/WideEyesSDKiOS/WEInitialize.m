//
//  WEInitialize.m
//  WideEyesSDKiOS
//
//  Created by Guillem  on 21/05/15.
//  Copyright (c) 2015 WideEyes. All rights reserved.
//

#import "WEInitialize.h"
#import "WE.h"
@implementation WEInitialize

+ (void)setClientApiKey:(NSString *)apiKey {
    if(![WE sharedInstance].apiKey){
        [WE sharedInstance].apiKey = apiKey;
    }else{
        //Error
        NSLog(@"Key already added");
    }
}

@end
