//
//  WEVision.h
//  WideEyesSDKiOS
//
//  Created by Guillem  on 19/05/15.
//  Copyright (c) 2015 WideEyes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "WEResult.h"
#import "WEImageDataStandardized.h"

typedef enum WEVisionGender : NSUInteger{
    WEVisionGenderMale,
    WEVisionGenderFemale,
    WEVisionGenderKidBoy,
    WEVisionGenderKidGirl
} WEVisionGender;

@interface WEVision : NSObject

///--------------------------------------
/// @name Search by product id
///--------------------------------------

/*!
 @abstract This endpoint retrieves the similar products to the product whose id you have entered. The results are returned in three sets, taking into account the color & the shape, only the color and only the shape.
 
 @param gender The gender of the category.
 @param category The name of the category.
 @param subcategory The name of the subcategory.
 @param productId The id of the product.
 @param maxNumResults The maximum number of results of each type.
 @param minNumResults The minimum number of results of each type.
 @param successBlock The success block providing WEResult.
 @param errorBlock The error block providing error.
 
 */

+ (void)searchByIdWithGender:(WEVisionGender)gender
                    category:(NSString *)category
                 subcategory:(NSString *)subcategory
                   productId:(NSString *)productId
               maxNumResults:(NSNumber *)maxNumResults
               minNumResults:(NSNumber *)minNumResults
                     success:(void(^const)(WEResult *result))successBlock
                     failure:(void(^const)(NSError *error))errorBlock;



+ (void)searchByIdWithGender:(WEVisionGender)gender
                    category:(NSString *)category
                 subcategory:(NSString *)subcategory
                   productId:(NSString *)productId
                     success:(void(^const)(WEResult *result))successBlock
                     failure:(void(^const)(NSError *error))errorBlock;

///--------------------------------------
/// @name Search products by image
///--------------------------------------

/*!
 @abstract This endpoint retrieves the similar products to the image that you have entered. The results are returned in three sets, taking into account the color & the shape, only the color and only the shape. The image and contorn should be previously. The image and contour must be preprocessed using the method 'generateImage:contourPoints:margin:withCompletionBlock:' in the WEComputerVision class
 
 
 @param gender The gender of the category.
 @param category The name of the category.
 @param subcategory The name of the subcategory.
 @param imageDataStandardized The WEImageDataStandardized object proprocessed by WEComputerVision processImage:contourPoints:margin:withCompletionBlock:
 @param successBlock The success block providing WEResult.
 @param errorBlock The error block providing error.
 
 */


+ (void)searchByImageWithGender:(WEVisionGender)gender
                       category:(NSString *)category
                    subcategory:(NSString *)subcategory
          imageDataStandardized:(WEImageDataStandardized *)imageDataStandardized
                        success:(void(^const)(WEResult *result))successBlock
                        failure:(void(^const)(NSError *error))errorBlock;


///--------------------------------------
/// @name Cross search from image
///--------------------------------------

/*!
 @abstract This endpoint retrieves the similar products to the image that you have entered. The results are returned in three sets, taking into account the color & the shape, only the color and only the shape.
 
 @param gender The gender of the category.
 @param category The name of the category.
 @param subcategory The name of the subcategory.
 @param successBlock The success block providing WEResult.
 @param errorBlock The error block providing error.
 */


+ (void)crossSearchByIdWithGender:(WEVisionGender)gender
                         category:(NSString *)category
                      subcategory:(NSString *)subcategory
                        productId:(NSString *)productId
                          success:(void(^const)(WEResult *result))successBlock
                          failure:(void(^const)(NSError *error))errorBlock;

@end
