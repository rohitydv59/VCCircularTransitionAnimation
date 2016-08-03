//
//  NavigationControllerDelegate.h
//  CircleTransition
//
//  Created by Rohit Yadav on 03/08/16.
//  Copyright © 2016 iAppstreet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NavigationControllerDelegate : NSObject <UINavigationControllerDelegate>

@property (nonatomic, strong) IBOutlet UINavigationController *navigationController;
@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *interactionController;

@end
