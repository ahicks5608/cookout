//
//  Formula9.m
//  Cookout
//
//  Created by Alex Hicks on 4/30/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import "Formula9.h"
#import "Common.h"
#import "Daily.h"

@interface Formula9() {
    NSMutableArray *_labels;
    NSMutableArray *_values;
    NSMutableDictionary *_result;
    
}

@end


@implementation Formula9

+(NSString*) getValue:(Daily *)value{
    Formula9 *f9 = [[Formula9 alloc] init];
    f9.delegate = value;
    NSDictionary *value1 = [f9 getvalues];
    NSArray *value2 = (NSArray*) [value1 valueForKey:@"values"];
    return [value2 objectAtIndex:2];
    
}
+(NSNumber*) getFormulaResult:(Daily *)value{
    Formula9 *f9 = [[Formula9 alloc] init];
    f9.delegate = value;
    [f9 getvalues];
    
    return [f9 getResult];
    
    
}


-(id) init {
    if (self = [super init]) {
        _labels = [NSMutableArray arrayWithCapacity:4];
        _values = [NSMutableArray arrayWithCapacity:4];
        _result = [NSMutableDictionary dictionaryWithCapacity:2];
        [_labels addObject:[Common getTitleForDaily:DFCashOSDAY]];
        [_labels addObject:[Common getTitleForDaily:DFCashSHForDep]];
        [_labels addObject:[Common getTitleForDaily:DFTotalDep]];
        
    }
    return self;
}



-(NSUInteger) getFormulaId{
    return DFCashOSDAY;
}

-(NSNumber*) getResult {
    return @0;
}



-(NSDictionary*) getvalues{
    [_result removeAllObjects];
    NSNumber *value1 = [_delegate getCashSHForDep];
    NSNumber *value2 = [_delegate getTotalDep];
    float val = ([value1 floatValue] - [value2 floatValue]) * -1;
    NSNumber *value3 = [NSNumber numberWithFloat:val];
    
    
    NSString *formattedValue = [Common formatNumberAsMoney:value1];
    [_values addObject:formattedValue];
    formattedValue = [Common formatNumberAsMoney:value2];
    [_values addObject:formattedValue];
    formattedValue = [Common formatNumberAsMoney:value3];
    [_values addObject:formattedValue];
    
    [_result setValue:_labels forKey:@"labels"];
    [_result setValue:_values forKey:@"values"];
    
    return _result;
    
    
}

@end
