//
//  CookoutClassTest.m
//  Cookout
//
//  Created by Alex Hicks on 2/12/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Hourly.h"
#import "Common.h"

@interface CookoutClassTest : XCTestCase

@end

@implementation CookoutClassTest

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

- (void)testgetLabor
{
    NSNumber * result = [Hourly getLaborPercentWithSalesAmount:@100 crewCount:@5];
    XCTAssertTrue((result != nil),@"result is nil");
    XCTAssertTrue(([result floatValue] == 2.6) , @"invalid rate");
    
}

/*
- (void)testInit1
{
    Hourly *hourly = [[Hourly alloc]init];
    hourly.timeOfDay = [NSNumber numberWithInt:TOD1];
    NSNumber *result = hourly.timeOfDay;
    XCTAssertTrue((result != nil),@"result is nil");
    XCTAssertTrue(([result intValue] == TOD1) , @"invalid rate");

    
}
*/


- (void)testInit2
{
    Hourly *hourly = [[Hourly alloc]init:TOD2];
    NSNumber *result = hourly.timeOfDay;
    XCTAssertTrue((result != nil),@"result is nil");
    XCTAssertTrue(([result intValue] == TOD2) , @"invalid rate");
}

@end






