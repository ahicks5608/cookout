//
//  Formula27.m
//  Cookout
//
//  Created by Alex Hicks on 4/23/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import "Formula27.h"
#import "Common.h"


@interface Formula27() {
    NSMutableArray *_labels;
    NSMutableArray *_values;
    NSMutableDictionary *_result;
    NSNumber *_formulaResult;

}

@end


@implementation Formula27


+(NSString*) getValue:(Daily*) value {
    Formula27 *f27 = [[Formula27 alloc] init];
    f27.delegate = value;
    NSDictionary *value1 = [f27 getvalues];
    NSArray *value2 = (NSArray*) [value1 valueForKey:@"values"];
    return [value2 objectAtIndex:2];
    
}

+(NSNumber*) getFormulaResult:(Daily*) value{
    return @0;
}


-(id) init {
    if (self = [super init]) {
        _labels = [NSMutableArray arrayWithCapacity:4];
        _values = [NSMutableArray arrayWithCapacity:4];
        _result = [NSMutableDictionary dictionaryWithCapacity:2];
        [_labels addObject:[Common getTitleForDaily:DFTotalServiceTime]];
        [_labels addObject:[Common getTitleForDaily:DFDayServiceTime]];
        [_labels addObject:[Common getTitleForDaily:DFNightServiceTime]];
        
    }
    return self;
}



-(NSUInteger) getFormulaId{
    return DFTotalServiceTime;
}

-(NSNumber*) getResult {
    return @0;
}



-(NSDictionary*) getvalues{
    [_result removeAllObjects];
    NSNumber *value1 = [_delegate getDayServiceTime];
    NSNumber *value2 = [_delegate getNightServiceTime];
    int val = ([value1 intValue] + [value2 intValue])/2;
    NSNumber *value3 = [NSNumber numberWithFloat:val];
    
    
    [_values addObject:[value1 stringValue]];
    
    [_values addObject:[value2 stringValue]];
    
    [_values addObject:[value3 stringValue]];
    
    [_result setValue:_labels forKey:@"labels"];
    [_result setValue:_values forKey:@"values"];
    
    return _result;
    
    
}

@end


