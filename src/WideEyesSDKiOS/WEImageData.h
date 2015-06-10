//
//  WEImageData.h
//  WideEyesSDKiOS
//
//  Created by Guillem  on 09/06/15.
//  Copyright (c) 2015 WideEyes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface WEImageData : NSObject


/*!
@abstract The image to be processed
*/
@property (nonatomic, strong) UIImage *image;

/*!
 @abstract The contour of the object in pixel coordinates example @[@[@0,@100],@[@50,@200],@[@50,@200],@[@100,@200],@[@0,@400],@[@100,@400]].
 */
@property (nonatomic, strong) NSArray *contourPoints;

- (void)addXPoint:(NSNumber *)pointX andYPoint:(NSNumber *)pointY;

@end
