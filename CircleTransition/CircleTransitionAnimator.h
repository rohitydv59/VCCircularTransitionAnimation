//
//  CircleTransitionAnimator.h
//  CircleTransition
//
//  Created by Rohit Yadav on 03/08/16.
//  Copyright © 2016 iAppstreet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface CircleTransitionAnimator : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, weak) id  <UIViewControllerContextTransitioning> transitionContext;

@end
