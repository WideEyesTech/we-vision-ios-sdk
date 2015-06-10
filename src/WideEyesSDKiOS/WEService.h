//
//  WEService.h
//  WideEyesSDKiOS
//
//  Created by Guillem  on 21/05/15.
//  Copyright (c) 2015 WideEyes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface WEService : NSObject

+ (void)performRequestWithParameters:(NSDictionary *)parameters
                         searchRoute:(NSString *)route
                      withCompletion:(void(^const)(NSDictionary *response, NSError *error))completionBlock;

@end
