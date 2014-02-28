//
//  TODTest.m
//  Cookout
//
//  Created by Alex Hicks on 2/27/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Common.h"
@interface TODTest : XCTestCase

@end

@implementation TODTest

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

- (void)testExample24hr
{
    NSString *result = [Common getTitleForTimeOfDay:[NSNumber numberWithInt:TOD24]];
    XCTAssertTrue((result != nil),@"Title is nil");
    XCTAssertTrue(([result isEqualToString:@"Happy Hour"]), @"invalid Title");

}

- (void)testExample0hr
{
    NSString *result = [Common getTitleForTimeOfDay:[NSNumber numberWithInt:TOD0]];
    XCTAssertTrue((result != nil),@"Title is nil");
    XCTAssertTrue(([result isEqualToString:@"12:00am to 12:59am"]), @"invalid Title");
    
}

@end
