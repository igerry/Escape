//
//  DWLoadingSceneTests.m
//  Escape
//
//  Created by dodo on 20/01/2014.
//  Copyright (c) 2014 dodo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DWLoadingScene.h"

@interface DWLoadingSceneTests : XCTestCase

@end

@implementation DWLoadingSceneTests

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testExamplePass
{
//    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
    DWLoadingScene *testScene = [[DWLoadingScene alloc] init];
    
    BOOL value = [testScene XCTestDemo];
    
    XCTAssertTrue(value, @"XCTestDemo method should return YES");
}

- (void)testExampleFail
{
    //    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
    DWLoadingScene *testScene = [[DWLoadingScene alloc] init];
    
    BOOL value = [testScene XCTestDemo];
    
    XCTAssertTrue(!value, @"XCTestDemo method should return YES");
}

@end
