//
//  ModalDelegate.h
//  Cookout
//
//  Created by Alex Hicks on 3/7/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ModalDelegate <NSObject>
@optional
- (void) willDismissViewController:(UIViewController*) controller;
@required
- (void) didDismissViewController;

@end
