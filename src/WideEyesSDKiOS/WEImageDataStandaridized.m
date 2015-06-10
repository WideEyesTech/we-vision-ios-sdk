//
//  WEImageDataStandaridized.m
//  WideEyesSDKiOS
//
//  Created by Guillem  on 09/06/15.
//  Copyright (c) 2015 WideEyes. All rights reserved.
//

#import "WEImageDataStandaridized.h"

@implementation WEImageDataStandaridized

- (instancetype)initWithContent:(NSArray *)contour andImage:(UIImage *)image {
    self = [super init];
    if (self) {
        self.image = image;
        self.contourPoints = contour;
    }
    return self;
}
@end
