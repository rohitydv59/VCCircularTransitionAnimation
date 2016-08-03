//
//  CircleTransitionAnimator.m
//  CircleTransition
//
//  Created by Rohit Yadav on 03/08/16.
//  Copyright © 2016 iAppstreet. All rights reserved.
//

#import "CircleTransitionAnimator.h"
#import "ViewController.h"

@implementation CircleTransitionAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    self.transitionContext = transitionContext;
    
    UIView *containerView = [transitionContext containerView];
    ViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    ViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIButton *button = fromViewController.button;
   
    [containerView addSubview:toViewController.view];
    
    UIBezierPath *circularPathInitial = [UIBezierPath bezierPathWithOvalInRect:button.frame];
    
    CGPoint extremePoint = (CGPoint){button.center.x-CGRectGetWidth(toViewController.view.bounds), button.center.y-CGRectGetHeight(toViewController.view.bounds)};
    
    CGFloat radius = sqrt((extremePoint.x* extremePoint.x) + (extremePoint.y*extremePoint.y));
    UIBezierPath *circleMaskFinal = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(button.frame, -radius, -radius)];
    
    CAShapeLayer *maskLayer = [CAShapeLayer new];
    maskLayer.path = circleMaskFinal.CGPath;
    toViewController.view.layer.mask = maskLayer;
    
    CABasicAnimation *maskLayerAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    maskLayerAnimation.fromValue = (__bridge id _Nullable)(circularPathInitial.CGPath);
    maskLayerAnimation.toValue = (__bridge id _Nullable)(circleMaskFinal.CGPath);
    
    maskLayerAnimation.duration = [self transitionDuration:transitionContext];
    maskLayerAnimation.delegate = self;
    [maskLayer addAnimation:maskLayerAnimation forKey:@"path"];
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    [self.transitionContext completeTransition:![self.transitionContext transitionWasCancelled]];
    [self.transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view.layer.mask = nil;
}

@end
