//
//  WEResult.m
//  WideEyesSDKiOS
//
//  Created by Guillem  on 19/05/15.
//  Copyright (c) 2015 WideEyes. All rights reserved.
//

#import "WEResult.h"
#import "WEObject.h"
@implementation WEResult


+ (instancetype)resultWithContent:(NSDictionary *)content {
    return [[self alloc]initWithContent:content];
}

- (instancetype)initWithContent:(NSDictionary *)content {
    self = [super init];
    if (self) {
        NSMutableArray *resultsBoth = [NSMutableArray array];
        NSMutableArray *resultsColor = [NSMutableArray array];
        NSMutableArray *resultsShape = [NSMutableArray array];
        
        for (NSDictionary *object in [content objectForKey:@"result_both"]) {
            [resultsBoth addObject:[WEObject createObjectWithInfo:object]];
        }
        
        for (NSDictionary *object in [content objectForKey:@"result_color"]) {
            [resultsColor addObject:[WEObject createObjectWithInfo:object]];
        }
        
        for (NSDictionary *object in [content objectForKey:@"result_shape"]) {
            [resultsShape addObject:[WEObject createObjectWithInfo:object]];
        }
        
        self.resultBoth = resultsBoth;
        self.resultColor = resultsColor;
        self.resultShape = resultsShape;
    }
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.resultBoth = [NSArray array];
        self.resultColor = [NSArray array];
        self.resultShape = [NSArray array];
    }
    return self;
}

@end
