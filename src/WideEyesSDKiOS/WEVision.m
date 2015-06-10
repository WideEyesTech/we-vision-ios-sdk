//
//  WEVision.m
//  WideEyesSDKiOS
//
//  Created by Guillem  on 19/05/15.
//  Copyright (c) 2015 WideEyes. All rights reserved.
//

#import "WEVision.h"
#import "WEService.h"

@interface WEVision()

@end

@implementation WEVision

+ (void)searchByIdWithGender:(WEVisionGender)gender
                    category:(NSString *)category
                 subcategory:(NSString *)subcategory
                   productId:(NSString *)productId
               maxNumResults:(NSNumber *)maxNumResults
               minNumResults:(NSNumber *)minNumResults
                     success:(void(^const)(WEResult *result))successBlock
                     failure:(void(^const)(NSError *error))errorBlock {
    
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]init];
    
    if ([category isKindOfClass:NSString.class]) {
        [parameters setObject:category forKey:@"Category"];
    } else {
        [self throwException:@"Category"];
    }
    
    if ([subcategory isKindOfClass:NSString.class]) {
        [parameters setObject:subcategory forKey:@"Subcategory"];
    } else {
        [self throwException:@"Subcategory"];
    }
    
    if ([productId isKindOfClass:NSString.class]) {
        [parameters setObject:productId forKey:@"ProductId"];
    } else {
        [self throwException:@"ProductId"];
    }
    
    NSString *genderValue = [self getGender:gender];
    if (genderValue) {
        [parameters setObject:genderValue forKey:@"Gender"];
    }else{
        [self throwException:@"Gender"];
    }
    
    
    //Query server with parameters
    [WEService performRequestWithParameters:parameters searchRoute:@"SearchById" withCompletion:^(NSDictionary *response, NSError *error) {
        if (!error) {
            if ([[response objectForKey:@"success"] isEqual:@1]) {
                WEResult *result = [WEResult resultWithContent:response];
                successBlock(result);
            }else{
                //No results
                errorBlock([self noResultsError]);
            }
        }else{
            //Error
            errorBlock(error);
        }
    }];
}


+ (void)searchByIdWithGender:(WEVisionGender)gender
                    category:(NSString *)category
                 subcategory:(NSString *)subcategory
                   productId:(NSString *)productId
                     success:(void(^const)(WEResult *result))successBlock
                     failure:(void(^const)(NSError *error))errorBlock {
    
    [self searchByIdWithGender:gender
                      category:category
                   subcategory:subcategory
                     productId:productId
                 maxNumResults:@100
                 minNumResults:@5
                       success:successBlock
                       failure:errorBlock];
}


+ (void)searchByImageWithGender:(WEVisionGender)gender
                       category:(NSString *)category
                    subcategory:(NSString *)subcategory
         imageDataStandaridized:(WEImageDataStandaridized *)imageDataStandaridized
                        success:(void (^const)(WEResult *result))successBlock
                        failure:(void (^const)(NSError *error))errorBlock {
    
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]init];
    
    if ([category isKindOfClass:NSString.class]) {
        [parameters setObject:category forKey:@"Category"];
    } else {
        [self throwException:@"Category"];
    }
    
    if ([subcategory isKindOfClass:NSString.class]) {
        [parameters setObject:subcategory forKey:@"Subcategory"];
    } else {
        [self throwException:@"Subcategory"];
    }
    
    NSString *genderValue = [self getGender:gender];
    if (genderValue) {
        [parameters setObject:genderValue forKey:@"Gender"];
    } else {
        [self throwException:@"Gender"];
    }
    
    if ([imageDataStandaridized.contourPoints isKindOfClass:NSArray.class]) {
        [parameters setObject:imageDataStandaridized.contourPoints forKey:@"Contour"];
    } else {
        [self throwException:@"Contour"];
    }
    
    
    if ([imageDataStandaridized.image isKindOfClass:UIImage.class]) {
        NSData *dataData = UIImageJPEGRepresentation(imageDataStandaridized.image,1.0f);
        NSString *data =[dataData base64EncodedStringWithOptions:0];
        [parameters setObject:data forKey:@"Image"];
    } else {
        [self throwException:@"Image"];
    }
    
    
    [WEService performRequestWithParameters:parameters searchRoute:@"SearchByImage" withCompletion:^(NSDictionary *response, NSError *error) {
        if (!error) {
            if ([[response objectForKey:@"success"] isEqual:@1]) {
                WEResult *result = [WEResult resultWithContent:response];
                successBlock(result);
            }else{
                //No results
                errorBlock([self noResultsError]);
            }
        }else{
            //Error
            errorBlock(error);
        }
    }];
}




+ (void)crossSearchByIdWithGender:(WEVisionGender)gender
                         category:(NSString *)category
                      subcategory:(NSString *)subcategory
                        productId:(NSString *)productId
                          success:(void(^const)(WEResult *result))successBlock
                          failure:(void(^const)(NSError *error))errorBlock {
    
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]init];
    
    if ([category isKindOfClass:NSString.class]) {
        [parameters setObject:category forKey:@"Category"];
    } else {
        [self throwException:@"Category"];
    }
    
    if ([subcategory isKindOfClass:NSString.class]) {
        [parameters setObject:subcategory forKey:@"Subcategory"];
    } else {
        [self throwException:@"Subcategory"];
    }
    
    if ([productId isKindOfClass:NSString.class]) {
        [parameters setObject:productId forKey:@"ProductId"];
    } else {
        [self throwException:@"ProductId"];
    }
    
    NSString *genderValue = [self getGender:gender];
    if (genderValue) {
        [parameters setObject:genderValue forKey:@"Gender"];
    }else{
        [self throwException:@"Gender"];
    }
    
    [WEService performRequestWithParameters:parameters
                                searchRoute:@"CrossSearchById"
                             withCompletion:^(NSDictionary *response, NSError *error) {
                                 if (!error) {
                                     if ([[response objectForKey:@"success"] isEqual:@1]) {
                                         WEResult *result = [WEResult resultWithContent:response];
                                         successBlock(result);
                                     }else{
                                         //No results
                                         errorBlock([self noResultsError]);
                                     }
                                 }else{
                                     //Error
                                     errorBlock(error);
                                 }
                             }];
    
}


+ (void)throwException:(NSString *)parameter {
    [NSException raise:@"Parameter error" format:@"%@ parameter has an error",parameter,nil];
}

+ (NSError*)noResultsError {
    return [NSError errorWithDomain:@"com.wideeyes.error.response" code:200 userInfo:@{@"NSLocalizedDescription":@"No results found"}];
}
+ (NSString *)getGender:(WEVisionGender)gender {
    switch (gender) {
        case WEVisionGenderMale:
            return @"male";
            break;
        case WEVisionGenderFemale:
            return @"female";
            break;
        case WEVisionGenderKidBoy:
            return @"kid_boy";
            break;
        case WEVisionGenderKidGirl:
            return @"kid_girl";
            break;
        default:
            // Error
            return nil;
            break;
    }
}


@end
