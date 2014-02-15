//
//  CookoutDailyTest.m
//  Cookout
//
//  Created by Alex Hicks on 2/14/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Daily.h"

@interface CookoutDailyTest : XCTestCase{
    Daily *daily;
}

@end

@implementation CookoutDailyTest

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    daily = [[Daily alloc]init];

}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    daily = nil;
    
    [super tearDown];
}

- (void)test0
{

    NSNumber *result = [daily getNetSalesAmt];
    XCTAssertTrue((result != nil),@"result is nil");
    XCTAssertTrue(([result floatValue] == 0.0f) , @"invalid value");
    
}


- (void)test00
{
    
    NSNumber *result = daily.netSalesAmt;
    XCTAssertTrue((result != nil),@"result is nil");
    XCTAssertTrue(([result floatValue] == 0.0f) , @"invalid value");
    
}


- (void)test000
{
    daily.netSalesAmt = @100;
    NSNumber *result = daily.netSalesAmt;
    XCTAssertTrue((result != nil),@"result is nil");
    XCTAssertTrue(([result floatValue] == 100.0f) , @"invalid value");
}

- (void)test0000
{
    [daily setNetSalesAmt:@100];
    NSNumber *result = [daily getNetSalesAmt];
    XCTAssertTrue((result != nil),@"result is nil");
    XCTAssertTrue(([result floatValue] == 100.0f) , @"invalid value");
}


- (void)test1
{
    [daily setNetSalesAmt:@100];
    NSNumber *result = [daily getNetSalesAmt];
    XCTAssertTrue((result != nil),@"result is nil");
    XCTAssertTrue(([result floatValue] == 100.00f) , @"invalid value");
    
}

@end
