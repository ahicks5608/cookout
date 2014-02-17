//
//  CookoutDailyTest.m
//  Cookout
//
//  Created by Alex Hicks on 2/14/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Daily.h"
#import "Common.h"


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

- (void)testcompare1
{
    Daily *daily1 = [[Daily alloc] init];
    NSNumber *result = [daily compare:daily1 what:COMPARE_SERVICETIME];
    XCTAssertTrue((result != nil),@"result is nil");
    XCTAssertTrue(([result floatValue] == 0.0f) , @"invalid value");
}

-(void) testInitWithData1 {
    
    /*
     _employeeFoodAmt = (NSNumber *) [_data valueForKeyPath:@"employeeFoodAmt"];
     _cashOsAmt = (NSNumber *) [_data valueForKeyPath:@"cashOsAmt"];
     _cashAmt = (NSNumber *) [_data valueForKeyPath:@"cashAmt"];
     */
    Daily *daily1 = [[Daily alloc] initWithHourly:nil data:@{cfnEmployeeFoodAmt: @100.50f,
                                                             cfnCashOsAmt:@-10,
                                                            cfnCashAmt: @200
                                                             }];
    NSNumber *result = daily1.employeeFoodAmt;
    XCTAssertTrue((result != nil),@"result is nil");
    XCTAssertTrue(([result floatValue] == 100.50f) , @"invalid value");

}

@end
