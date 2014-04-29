//
//  Formula6.m
//  Cookout
//
//  Created by Alex Hicks on 4/29/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import "Formula6.h"
#import "Common.h"
#import "Daily.h"

@interface Formula6() {
    NSMutableArray *_labels;
    NSMutableArray *_values;
    NSMutableDictionary *_result;
    
}

@end


@implementation Formula6

+(NSString*) getValue:(Daily *)value{
    Formula6 *f6 = [[Formula6 alloc] init];
    f6.delegate = value;
    NSDictionary *value1 = [f6 getvalues];
    NSArray *value2 = (NSArray*) [value1 valueForKey:@"values"];
    return [value2 objectAtIndex:2];
    
}
+(NSNumber*) getFormulaResult:(Daily *)value{
    Formula6 *f6 = [[Formula6 alloc] init];
    f6.delegate = value;
    [f6 getvalues];
    
    return [f6 getResult];
    
    
}


-(id) init {
    if (self = [super init]) {
        _labels = [NSMutableArray arrayWithCapacity:4];
        _values = [NSMutableArray arrayWithCapacity:4];
        _result = [NSMutableDictionary dictionaryWithCapacity:2];
        [_labels addObject:[Common getTitleForDaily:DFGrossSales]];
        [_labels addObject:[Common getTitleForDaily:DFNetSalesDAY]];
        [_labels addObject:[Common getTitleForDaily:DFSalesTax]];
        
    }
    return self;
}



-(NSUInteger) getFormulaId{
    return DFGrossSales;
}

-(NSNumber*) getResult {
    return @0;
}



-(NSDictionary*) getvalues{
    [_result removeAllObjects];
    NSNumber *value1 = [_delegate getNetSalesDAY];
    NSNumber *value2 = [_delegate getSalesTax];
    float val = [value1 floatValue] + [value2 floatValue];
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
