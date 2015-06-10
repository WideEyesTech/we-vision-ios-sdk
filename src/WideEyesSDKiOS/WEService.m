//
//  WEService.m
//  WideEyesSDKiOS
//
//  Created by Guillem  on 21/05/15.
//  Copyright (c) 2015 WideEyes. All rights reserved.
//

#import "WEService.h"
#import "WE_AFNetworking.h"
#import "WE.h"
#import "WEMockProvider.h"

NSString *API_BASE_URL = @"http://api.wide-eyes.it/v1/";

@implementation WEService

+ (void)performRequestWithParameters:(NSDictionary *)parameters
                         searchRoute:(NSString *)route
                      withCompletion:(void(^const)(NSDictionary *response, NSError *error))completionBlock {
#ifdef UNIT_TESTING
    completionBlock([WEMockProvider mockProducts],nil);
#else
    NSString *queryUrl = [API_BASE_URL stringByAppendingString:route];
    
    WE_AFHTTPRequestOperationManager *operationManager = [[WE_AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:API_BASE_URL]];
    [operationManager setRequestSerializer:[WE_AFJSONRequestSerializer serializer]];
    [operationManager setResponseSerializer:[WE_AFJSONResponseSerializer serializer]];
    [operationManager.requestSerializer setValue:[WE sharedInstance].apiKey forHTTPHeaderField:@"apikey"];
    
    
    [operationManager POST:queryUrl
                parameters:parameters
                   success:^(WE_AFHTTPRequestOperation *operation, id responseObject) {
                       completionBlock(responseObject,nil);
                   } failure:^(WE_AFHTTPRequestOperation *operation, NSError *error) {
                       completionBlock(nil,error);
                   }];
#endif
    
}


@end
