//
//  WEImageDataStandardized.h
//  WideEyesSDKiOS
//
//  Created by Guillem  on 09/06/15.
//  Copyright (c) 2015 WideEyes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WEImageData.h"
@interface WEImageDataStandardized : WEImageData


- (instancetype)initWithContent:(NSArray *)contour andImage:(UIImage *)image;

@end
