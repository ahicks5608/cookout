//
//  BaseModalViewController.h
//  Cookout
//
//  Created by Alex Hicks on 3/14/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModalDelegate.h"


@interface BaseModalViewController : UIViewController

@property (nonatomic, weak) id<ModalDelegate> delegate;

@end
