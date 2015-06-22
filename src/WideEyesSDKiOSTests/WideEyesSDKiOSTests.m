//
//  WideEyesSDKiOSTests.m
//  WideEyesSDKiOS
//
//  Created by Guillem  on 19/05/15.
//  Copyright (c) 2015 WideEyes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "WEVision.h"
#import "WEInitialize.h"
#import "WEComputerVision.h"
#import "WEImageDataStandardized.h"
#import "WEImageData.h"

@interface WideEyesSDKiOSTests : XCTestCase
@property (nonatomic, strong) UIImage *image;
@end

@implementation WideEyesSDKiOSTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *imagePath = [bundle pathForResource:@"shoes" ofType:@"jpg"];
    self.image = [UIImage imageWithContentsOfFile:imagePath];

}

- (void)testSearchByIdWithMaxAndMinResultValues {
    XCTestExpectation *completionExpectation = [self expectationWithDescription:@"SearchByIdQuery"];
    [WEVision searchByIdWithGender:WEVisionGenderFemale
                          category:@"shoes"
                       subcategory:@"boots_booties"
                         productId:@"100014"
                     maxNumResults:@80
                     minNumResults:@10 success:^(WEResult *result) {
        [completionExpectation fulfill];
        XCTAssert(result.resultBoth > 0 && result.resultColor > 0 && result.resultShape > 0);
    } failure:^(NSError *error) {
        XCTFail(@"Fail with error: %@",[error.userInfo objectForKey:@"NSLocalizedDescription"]);
        [completionExpectation fulfill];

    }];
    
    [self waitForExpectationsWithTimeout:10.0 handler:nil];
}

- (void)testSearchById {
    XCTestExpectation *completionExpectation = [self expectationWithDescription:@"SearchByIdQuery"];
    [WEVision searchByIdWithGender:WEVisionGenderFemale
                          category:@"shoes"
                       subcategory:@"boots_booties"
                         productId:@"100014" success:^(WEResult *result) {
        [completionExpectation fulfill];
        XCTAssert(result.resultBoth > 0 && result.resultColor > 0 && result.resultShape > 0);
    } failure:^(NSError *error) {
        XCTFail(@"Fail with error: %@",[error.userInfo objectForKey:@"NSLocalizedDescription"]);
        [completionExpectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:10.0 handler:nil];
}

- (void)testCrossSearch {
    XCTestExpectation *completionExpectation = [self expectationWithDescription:@"CrossSearch"];
    [WEVision crossSearchByIdWithGender:WEVisionGenderFemale
                               category:@"shoes"
                            subcategory:@"boots_booties"
                              productId:@"100014"
                                success:^(WEResult *result) {
        [completionExpectation fulfill];
        XCTAssert(result.resultBoth > 0 && result.resultColor > 0 && result.resultShape > 0);
    } failure:^(NSError *error) {
        XCTFail(@"Fail with error: %@",[error.userInfo objectForKey:@"NSLocalizedDescription"]);
        [completionExpectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:10.0 handler:nil];
}

- (void)testCropImageContour {

    WEImageData *imageData = [[WEImageData alloc]init];
    [imageData setImage:self.image];
    [imageData addXPoint:@40 andYPoint:@220];
    [imageData addXPoint:@150 andYPoint:@220];
    [imageData addXPoint:@150 andYPoint:@300];
    [imageData addXPoint:@295 andYPoint:@300];
    [imageData addXPoint:@40 andYPoint:@385];
    [imageData addXPoint:@295 andYPoint:@385];
    
    WEImageDataStandardized *data = [WEComputerVision processImageData:imageData margin:@0];

     NSArray *returnContour =  @[@[@0,@0],@[@172,@0],@[@172,@125],@[@398,@125],@[@0,@258],@[@398,@258]];
    if (![data.contourPoints isEqualToArray:returnContour]) {
        XCTFail(@"Not the same contour");
    }
}

- (void)testCropImageSize {

    WEImageData *imageData = [[WEImageData alloc]init];
    [imageData setImage:self.image];
    [imageData addXPoint:@40 andYPoint:@220];
    [imageData addXPoint:@150 andYPoint:@220];
    [imageData addXPoint:@150 andYPoint:@300];
    [imageData addXPoint:@295 andYPoint:@300];
    [imageData addXPoint:@40 andYPoint:@385];
    [imageData addXPoint:@295 andYPoint:@385];
    
    WEImageDataStandardized *data = [WEComputerVision processImageData:imageData margin:@0];
    
    XCTAssert(data.image.size.width == 400.0f || data.image.size.height == 400.0f);
    
}

- (void)testCropImageAndSearchByImage {
    XCTestExpectation *completionExpectation = [self expectationWithDescription:@"SearchByImage"];
    WEImageData *imageData = [[WEImageData alloc]init];
    [imageData setImage:self.image];
    [imageData addXPoint:@40 andYPoint:@220];
    [imageData addXPoint:@150 andYPoint:@220];
    [imageData addXPoint:@150 andYPoint:@300];
    [imageData addXPoint:@295 andYPoint:@300];
    [imageData addXPoint:@40 andYPoint:@385];
    [imageData addXPoint:@295 andYPoint:@385];

    
    WEImageDataStandardized *data = [WEComputerVision processImageData:imageData margin:@0];
    
    [WEVision searchByImageWithGender:WEVisionGenderFemale
                             category:@"shoes"
                          subcategory:@"boots_booties"
                imageDataStandardized:data
                              success:^(WEResult *result) {
        [completionExpectation fulfill];
        XCTAssert(result.resultBoth > 0 && result.resultColor > 0 && result.resultShape > 0);
    } failure:^(NSError *error) {
        [completionExpectation fulfill];
        XCTFail(@"Fail with error: %@",[error.userInfo objectForKey:@"NSLocalizedDescription"]);
    }];
    [self waitForExpectationsWithTimeout:10.0 handler:nil];

}





@end
