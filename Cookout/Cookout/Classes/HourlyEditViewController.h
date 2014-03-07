//
//  HourlyViewController.h
//  Cookout
//
//  Created by Alex Hicks on 3/7/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModalDelegate.h"
#import <CoreData/NSManagedObject.h>

@interface HourlyEditViewController : UIViewController

@property (nonatomic,weak) id<ModalDelegate> delegate;

- (void) configWithData:(NSManagedObject*) data;

@end
