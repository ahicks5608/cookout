
//
//  DictionaryTransformer.m
//  PropertyInspection
//
//  Created by David Hicks on 4/6/12.
//  Copyright (c) 2012 SimpleiApps. All rights reserved.
//

#import "HourlyTransformer.h"

@implementation HourlyTransformer

+ (BOOL)allowsReverseTransformation {
	return YES;
}

+ (Class)transformedValueClass {
	return [NSData class];
}

- (id)transformedValue:(id)value {
	return [NSKeyedArchiver archivedDataWithRootObject:value];
}

- (id)reverseTransformedValue:(id)value {
	return [NSKeyedUnarchiver unarchiveObjectWithData:value];
}


@end