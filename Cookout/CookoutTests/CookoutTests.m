//
//  CookoutTests.m
//  CookoutTests
//
//  Created by Alex Hicks on 2/10/14.
//  Copyright (c) 2014 iapps. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Hourly.h"

@interface CookoutTests : XCTestCase {
    Hourly *hourly;
}

@end

@implementation CookoutTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
     hourly = [[Hourly alloc] init];
    
}

- (void)tearDown
{
    hourly = nil;
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test1{
    NSNumber *rate = hourly.payrate;
    XCTAssertTrue((rate != nil),@"rate is nil");
    XCTAssertTrue(([rate floatValue] == 7.50f) , @"invalid rate");
    
 
}
- (void)test1A{
    NSString *storeCode = hourly.storeCode;
    XCTAssertTrue((storeCode != nil),@"store code is nil");
    XCTAssertTrue(([storeCode isEqualToString:@"WS11"]), @"invalid store code");
}


- (void)test2
{
    hourly.saleAmount = [NSNumber numberWithInt:10000];
    hourly.crewCount = [NSNumber numberWithInt:100];
    NSNumber *result = [hourly laborPercent];
    XCTAssertTrue((result != nil), @"result not nil");
    XCTAssertEqual(13.33f, [result floatValue], @"thats invalid");

}

- (void)test3 {
    hourly.saleAmount = [NSNumber numberWithInt:2500];
    hourly.crewCount = [NSNumber numberWithInt:23];
    NSNumber *result = [hourly laborPercent];
    XCTAssertTrue((result != nil), @"result not null");
   XCTAssertEqual(14.49f, [result floatValue], @"thats invalid");
    
}

- (void)test4 {
    hourly.saleAmount = [NSNumber numberWithInt:0];
    hourly.crewCount = [NSNumber numberWithInt:2];
    NSNumber *result = [hourly laborPercent];
    XCTAssertTrue((result != nil), @"result not null");
    XCTAssertEqual(0 ,[result floatValue], @"thats invalid");
    
}

- (void)test5 {
    hourly.saleAmount = [NSNumber numberWithFloat:7.50f];
    hourly.crewCount = [NSNumber numberWithInt:1];
    NSNumber *result = [hourly laborPercent];
    XCTAssertTrue((result != nil), @"result not null");
    XCTAssertEqual(1, [result floatValue], @"thats invalid");
    
}

- (void)test6 {
    hourly.saleAmount = [NSNumber numberWithInt:2500];
    hourly.crewCount = [NSNumber numberWithInt:0];
    NSNumber *result = [hourly laborPercent];
    XCTAssertTrue((result != nil), @"result not null");
    XCTAssertEqual(0, [result floatValue], @"thats invalid");
    
}

@end
