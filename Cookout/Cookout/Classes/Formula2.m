//
//  Formula2.m
//  Cookout
//
//  Created by Alex Hicks on 4/9/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import "Formula2.h"
#import "Common.h"


@interface Formula2() {
    NSMutableArray *_labels;
    NSMutableArray *_values;
    NSMutableDictionary *_result;
    
}

@end


@implementation Formula2


+(NSString*) getValue:(Daily*) value {
    Formula2 *f2 = [[Formula2 alloc] init];
    f2.delegate = value;
    NSDictionary *value1 = [f2 getvalues];
    NSArray *value2 = (NSArray*) [value1 valueForKey:@"values"];
    return [value2 objectAtIndex:2];

}


-(id) init {
    if (self = [super init]) {
        _labels = [NSMutableArray arrayWithCapacity:4];
        _values = [NSMutableArray arrayWithCapacity:4];
        _result = [NSMutableDictionary dictionaryWithCapacity:2];
        [_labels addObject:[Common getTitleForDaily:DFSalesTax]];
        [_labels addObject:[Common getTitleForDaily:DFNetSalesDAY]];
        [_labels addObject:@"Sales Tax Percentage Rate"];
        
    }
    return self;
}



-(NSUInteger) getFormulaId{
    return DFSalesTax;
}


-(NSDictionary*) getvalues{
    [_result removeAllObjects];
    NSNumber *value1 = [_delegate getNetSalesDAY];
    NSNumber *value2 = @7.56f;
#warning SALES TAX RATE NEEDS WORK 
    float val = ([value1 floatValue] * [value2 floatValue]/100);
    NSNumber *value3 = [NSNumber numberWithFloat:val];
    
    
    NSString *formattedValue = [Common formatNumberAsMoney:value1];
    [_values addObject:formattedValue];
    
    
    [_values addObject:[value2 stringValue]];
    
    
    formattedValue = [Common formatNumberAsMoney:value3];
    [_values addObject:formattedValue];
    
    [_result setValue:_labels forKey:@"labels"];
    [_result setValue:_values forKey:@"values"];
    
    return _result;
    
    
}

@end


