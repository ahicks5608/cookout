//
//  ModalDelegate.h
//  Cookout
//
//  Created by Alex Hicks on 3/7/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ModalDelegate <NSObject>

- (void) willDismissViewController:(UIViewController*) controller;
- (void) didDismissViewController;

@end
