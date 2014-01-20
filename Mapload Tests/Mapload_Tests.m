//
//  Mapload_Tests.m
//  Mapload Tests
//
//  Created by Xin Gao on 20/01/2014.
//  Copyright (c) 2014 dodo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TiledMap.h"

@interface Mapload_Tests : XCTestCase

@end

@implementation Mapload_Tests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}



/*!
 
 Testing initializeMap
 
 Since initializeMap has 7 steps, the test is splitted into 7 parts as
 
 Step 1: check version with height tilewidth tileheight are set correctly
 
 Step 2: check
 
 */
- (void)testMapLoadingTest
{
    /* Testing the 7 steps of map loading */
    NSString *tmxfile = @"test";
    TiledMap *map = [[TiledMap alloc] initializeMap: tmxfile];
    XCTAssert(map.width == 10);
    XCTAssert(map.height == 7);
    XCTAssert(map.tileheight == 32);
    XCTAssert(map.tilewidth = 32);
    XCTAssert([map.version isEqual : @"1.0"]);
}
@end
