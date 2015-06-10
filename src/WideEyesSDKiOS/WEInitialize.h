//
//  WEInitialize.h
//  WideEyesSDKiOS
//
//  Created by Guillem  on 21/05/15.
//  Copyright (c) 2015 WideEyes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WEInitialize : NSObject


///--------------------------------------
/// @name Connecting to the api
///--------------------------------------

/*!
 @abstract Sets the apikey of your application.
 
 @param apiKey The api key of WideEyes.
 */

+ (void)setClientApiKey:(NSString *)apiKey;

@end
