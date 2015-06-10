//
//  WEImageData.m
//  WideEyesSDKiOS
//
//  Created by Guillem  on 09/06/15.
//  Copyright (c) 2015 WideEyes. All rights reserved.
//

#import "WEImageData.h"

@implementation WEImageData

- (void)addXPoint:(NSNumber *)pointX andYPoint:(NSNumber *)pointY {
    if (!self.contourPoints) {
        self.contourPoints = @[];
    }
    NSMutableArray *array = [self.contourPoints mutableCopy];
    [array addObject:@[pointX,pointY]];
    self.contourPoints = [array copy];
}
@end
