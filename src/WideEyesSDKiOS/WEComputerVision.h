//
//  WEComputerVision.h
//  WideEyesSDKiOS
//
//  Created by Guillem  on 21/05/15.
//  Copyright (c) 2015 WideEyes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "WEImageData.h"
#import "WEImageDataStandaridized.h"

@interface WEComputerVision : NSObject

///--------------------------------------
/// @name Image pre processing for platform
///--------------------------------------

/*!
 @abstract This endpoint retrieves the similar products to the image that you have entered. The results are returned in three sets, taking into account the color & the shape, only the color and only the shape.
 
 @param image The image to be processed
 @param contourPoints The contour of the object in pixel coordinates example @[@[@0,@100],@[@50,@200],@[@50,@200],@[@100,@200],@[@0,@400],@[@100,@400]].
 @param margin Margin to final image
 @param block Block return de processed image and the processed contour 
 
 */

+ (WEImageDataStandaridized *)processImageData:(WEImageData *)imageData
                                        margin:(NSNumber *)margin;
@end
