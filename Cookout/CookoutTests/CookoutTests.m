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
    Hourly *hourly1 = [[Hourly alloc] init:[NSNumber numberWithInt:10000] crewCount:[NSNumber numberWithInt:100]];
    NSNumber *result = hourly1.laborPercent;
    XCTAssertTrue((result != nil), @"result not nil");
    XCTAssertEqual(13.33f, [result floatValue], @"thats invalid");

}

- (void)test3 {
    Hourly *hourly1 = [[Hourly alloc] init:[NSNumber numberWithInt:2501] crewCount:[NSNumber numberWithInt:23]];
    NSNumber *result = [hourly1 getLaborPercent];
    XCTAssertTrue((result != nil), @"result not null");
    XCTAssertEqual(14.50f, [result floatValue], @"thats invalid");
    
}

- (void)test4 {
   // hourly.saleAmount = [NSNumber numberWithInt:0];
   // hourly.crewCount = [NSNumber numberWithInt:2];
    NSNumber *result = hourly.laborPercent;
    XCTAssertTrue((result != nil), @"result not null");
    XCTAssertEqual(0 ,[result floatValue], @"thats invalid");
    
}

- (void)test5 {
    Hourly *hourly1 = [[Hourly alloc] init:TOD22];
    NSNumber *result = hourly1.timeOfDay;
    XCTAssertTrue((result != nil), @"result not null");
    XCTAssertEqual(TOD22, [result intValue], @"thats invalid");
    
}

- (void)test6 {
    Hourly *hourly1 = [[Hourly alloc] init:TOD22];
    NSNumber *result = hourly1.laborPercent;
    XCTAssertTrue((result != nil), @"result not null");
    XCTAssertEqual(TOD22, [result intValue], @"thats invalid");
    
}

- (void)test777 {
    
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:hourly];
    Hourly *hourly1 = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    XCTAssertTrue((data != nil),@"result is nil");
    XCTAssertTrue((hourly1 != nil),@"result is nil");
    
}

- (void)test8 {
    Hourly *hourly1 = [[Hourly alloc] init:[NSNumber numberWithInt:10000] crewCount:[NSNumber numberWithInt:100]];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:hourly1];
    Hourly *hourly2 = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    NSNumber *result = [hourly2 getLaborPercent];
    XCTAssertTrue((result != nil), @"result not null");
    XCTAssertEqual(13.33f, [result floatValue], @"thats invalid");
    result = [hourly2 getSalesAmt];
    XCTAssertTrue((result != nil), @"result not null");
    XCTAssertEqual(10000.0f, [result floatValue], @"thats invalid");
   
}


@end
