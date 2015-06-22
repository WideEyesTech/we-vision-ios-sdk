//
//  WEComputerVision.m
//  WideEyesSDKiOS
//
//  Created by Guillem  on 21/05/15.
//  Copyright (c) 2015 WideEyes. All rights reserved.
//

#import "WEComputerVision.h"

@implementation WEComputerVision

+ (WEImageDataStandardized *)processImageData:(WEImageData *)imageData
                                        margin:(NSNumber *)margin {
    
    if (![imageData.image isKindOfClass:UIImage.class]) {
        [self throwException:@"Image"];
    }
    
    if (![margin isKindOfClass:NSNumber.class]) {
        [self throwException:@"Margin"];
    }
    
    for (NSArray *value in imageData.contourPoints) {
        if (![[value objectAtIndex:0] isKindOfClass:NSNumber.class] || ![[value objectAtIndex:1] isKindOfClass:NSNumber.class]) {
            [self throwException:@"Points"];
        }
    }
    
    CGFloat x0 = 100000, x1 = 0;
    CGFloat y0 = 100000, y1 = 0;
    CGFloat w = imageData.image.size.width;
    CGFloat h = imageData.image.size.height;
    
    // find max and min of X and Y
    for (NSArray *values in imageData.contourPoints) {
        CGFloat xValue = [[values objectAtIndex:0]floatValue];
        CGFloat yValue = [[values objectAtIndex:1]floatValue];
        if (xValue < x0) x0 = round(xValue);
        if (xValue > x1) x1 = round(xValue);
        if (yValue < y0) y0 = round(yValue);
        if (yValue > y1) y1 = round(yValue);
    }
    
    // compute center point
    CGPoint c = CGPointMake(round((x1+x0)*0.5f), round((y1+y0)*0.5f));
    
    // add margin to the original size
    int w2 = round((x1 - x0 +1) * (1 + 2.f*[margin floatValue]));
    int h2 = round((y1 - y0 +1) * (1 + 2.f*[margin floatValue]));
    
    // recompute the bounding box
    x0 = fmin(w-1, fmax(0, round(c.x -  w2 * 0.5f)));
    x1 = fmin(w-1, fmax(0, round(c.x +  w2 * 0.5f)));
    y0 = fmin(h-1, fmax(0, round(c.y -  h2 * 0.5f)));
    y1 = fmin(h-1, fmax(0, round(c.y +  h2 * 0.5f)));
    
    w2 = x1 - x0 +1;
    h2 = y1 - y0 +1;
    // crop image
    CGImageRef imageRef = CGImageCreateWithImageInRect([imageData.image CGImage],CGRectMake(x0, y0, x1-x0, y1-y0));
    UIImage *croppedImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    
    // crop contour
    NSMutableArray *cropContour = [NSMutableArray array];
    for (NSArray *values in imageData.contourPoints) {
        CGFloat xValue = [[values objectAtIndex:0]floatValue];
        CGFloat yValue = [[values objectAtIndex:1]floatValue];
        xValue -= x0;
        yValue -= y0;
        [cropContour addObject:@[[NSNumber numberWithFloat:xValue],[NSNumber numberWithFloat:yValue]]];
    }
    
    // resize image
    
    CGFloat standardSize = 400;
    w = croppedImage.size.width;
    h = croppedImage.size.height;
    CGFloat scale = 1.f, newWidth, newHeight;
    if (w > h) {
        
        scale = standardSize / w;
        newWidth = standardSize;
        newHeight = h * scale;
        
    } else {
        
        scale = standardSize / h;
        newWidth = w * scale;
        newHeight = standardSize;
        
    }
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(newWidth, newHeight), NO, 0.0);
    [croppedImage drawInRect:CGRectMake(0, 0, newWidth, newHeight)];
    UIImage *resizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    
    NSMutableArray *resizeContour = [NSMutableArray array];
    for (NSArray *values in cropContour) {
        CGFloat xValue = [[values objectAtIndex:0]floatValue];
        CGFloat yValue = [[values objectAtIndex:1]floatValue];
        xValue = xValue * scale;
        yValue = yValue * scale;
        [resizeContour addObject:@[[NSNumber numberWithFloat:round(xValue)],[NSNumber numberWithFloat:round(yValue)]]];
    }
    
    
    return [[WEImageDataStandardized alloc]initWithContent:resizeContour andImage:resizedImage];
}

+ (void)throwException:(NSString *)parameter {
    [NSException raise:@"Parameter error" format:@"%@ parameter has an error",parameter,nil];
}
@end
