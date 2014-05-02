//
//  Formula33.m
//  Cookout
//
//  Created by Alex Hicks on 5/1/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import "Formula33.h"
#import "Common.h"
#import "Daily.h"

@interface Formula33() {
    NSMutableArray *_labels;
    NSMutableArray *_values;
    NSMutableDictionary *_result;
    NSNumber *_formulaResult;

}

@end


@implementation Formula33

+(NSString*) getValue:(Daily *)value{
    Formula33 *f33 = [[Formula33 alloc] init];
    f33.delegate = value;
    NSDictionary *value1 = [f33 getvalues];
    NSArray *value2 = (NSArray*) [value1 valueForKey:@"values"];
    return [value2 objectAtIndex:2];
    
}
+(NSNumber*) getFormulaResult:(Daily *)value{
    Formula33 *f33 = [[Formula33 alloc] init];
    f33.delegate = value;
    [f33 getvalues];
    
    return [f33 getResult];
    
    
}


-(id) init {
    if (self = [super init]) {
        _labels = [NSMutableArray arrayWithCapacity:4];
        _values = [NSMutableArray arrayWithCapacity:4];
        _result = [NSMutableDictionary dictionaryWithCapacity:2];
        [_labels addObject:[Common getTitleForDaily:DFUpDownToday132]];
        [_labels addObject:[Common getTitleForDaily:DFNetSalesDAY]];
        [_labels addObject:[Common getTitleForDaily:DFSalesLastWeekSameDay]];
        
    }
    return self;
}



-(NSUInteger) getFormulaId{
    return DFUpDownToday132;
}

-(NSNumber*) getResult {
    return @0;
}



-(NSDictionary*) getvalues{
    [_result removeAllObjects];
    NSNumber *value1 = [_delegate getNetSalesDAY];
    NSNumber *value2 = [_delegate getSalesLastWeekSameDay];
    float val = [value1 floatValue] - [value2 floatValue];
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
