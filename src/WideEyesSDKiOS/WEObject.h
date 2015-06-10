//
//  WEObject.h
//  adfsaf
//
//  Created by Guillem  on 27/05/15.
//  Copyright (c) 2015 WideEyes. All rights reserved.
//

#import <Foundation/Foundation.h>


/*!
 The `WEObject` class is a respresentation of a product in the Wide Eyes data base.
 This is the main class that is used to interact with objects in the sdk.
 */
@interface WEObject : NSObject

/*!
 @abstract The name of the product
 */
@property (nonatomic, strong) NSString *productName;

/*!
 @abstract The identifier of the product
 */
@property (nonatomic, strong) NSString *productId;

/*!
 @abstract The product url
 */
@property (nonatomic, strong) NSURL *productUrl;

/*!
 @abstract The product extra data
 */
@property (nonatomic, strong) NSString *productCustomData;

/*!
 @abstract Array of images URLs
 */
@property (nonatomic, strong) NSArray *productImagesUrls;

///--------------------------------------
/// @name Creating a WEObject
///--------------------------------------

/*!
 @abstract Creates a new WEObject with information.
 
 @param information retrived from the server.
 
 @returns Returns the object that is instantiated with the given information.
 */

+ (instancetype)createObjectWithInfo:(NSDictionary *)info;

@end
