//
//  WEObject.m
//  adfsaf
//
//  Created by Guillem  on 27/05/15.
//  Copyright (c) 2015 WideEyes. All rights reserved.
//

#import "WEObject.h"

@implementation WEObject

+ (instancetype)createObjectWithInfo:(NSDictionary *)info {
    return [[self alloc]initWithInfo:info];
}

- (instancetype)initWithInfo:(NSDictionary *)info {
    self = [super init];
    if (self) {
        //conform object
        self.productName = [info objectForKey:@"ProductName"];
        self.productId = [info objectForKey:@"ProductId"];
        
        if ([[info objectForKey:@"ProductUrl"]isKindOfClass:NSString.class]) {
            self.productUrl = [NSURL URLWithString:[info objectForKey:@"ProductUrl"]];
        }else{
            self.productUrl = [info objectForKey:@"ProductUrl"];
        }
        
        self.productCustomData = [info objectForKey:@"ProductCustomData"];
        
        NSMutableArray *imageUrls = [NSMutableArray array];
        for (NSString *imageUrl in [info objectForKey:@"ImgUrls"]) {
            if (imageUrl) {
                [imageUrls addObject:[NSURL URLWithString:[imageUrl stringByReplacingOccurrencesOfString:@" " withString:@""]]];
            }
        }
        
        self.productImagesUrls = [imageUrls copy];
    }
    return self;
}
@end
