//
//  WEResult.h
//  WideEyesSDKiOS
//
//  Created by Guillem  on 19/05/15.
//  Copyright (c) 2015 WideEyes. All rights reserved.
//

#import <Foundation/Foundation.h>
/*!
 The `WEResult` class is a respresentation of different grouped products in the Wide Eyes data base.
 */

@interface WEResult : NSObject

/*!
 @abstract resultsBoth
 */
@property (nonatomic, strong) NSArray *resultBoth;

/*!
 @abstract resultsShape
 */
@property (nonatomic, strong) NSArray *resultShape;

/*!
 @abstract resultsColor
 */
@property (nonatomic, strong) NSArray *resultColor;


/*!
 @abstract Creates a new WEResult with different products content.
 
 @param content retrived from the server.
 
 @returns Returns the object that is instantiated with the given information.
 */
+ (instancetype)resultWithContent:(NSDictionary *)content;

@end
