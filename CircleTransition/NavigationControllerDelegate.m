//
//  NavigationControllerDelegate.m
//  CircleTransition
//
//  Created by Rohit Yadav on 03/08/16.
//  Copyright © 2016 iAppstreet. All rights reserved.
//

#import "NavigationControllerDelegate.h"
#import "CircleTransitionAnimator.h"

@implementation NavigationControllerDelegate

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panned:)];
    [self.navigationController.view addGestureRecognizer:pan];
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    return [CircleTransitionAnimator new];
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController
{
    return self.interactionController;
}

- (void)panned:(UIPanGestureRecognizer *)gestureRecogniser
{
    switch (gestureRecogniser.state) {
        case UIGestureRecognizerStateBegan:
        {
            self.interactionController = [UIPercentDrivenInteractiveTransition new];
            if (self.navigationController.viewControllers.count > 1) {
                [self.navigationController popViewControllerAnimated:YES];
            }
            else{
                [self.navigationController.topViewController performSegueWithIdentifier:@"PushSegue" sender:nil];
            }
        }
            break;
            
        case UIGestureRecognizerStateChanged:
        {
            CGPoint translation = [gestureRecogniser translationInView:self.navigationController.view];
            CGFloat completeProgress = translation.x/ CGRectGetWidth(self.navigationController.view.bounds);
            [self.interactionController updateInteractiveTransition:completeProgress];
        }
            break;
        
        case UIGestureRecognizerStateEnded:
        {
            if ([gestureRecogniser velocityInView:self.navigationController.view].x > 0) {
                [self.interactionController finishInteractiveTransition];
            }
            else{
                [self.interactionController cancelInteractiveTransition];
            }
            self.interactionController = nil;
        }
            break;
            
        
        default:
        {
            [self.interactionController cancelInteractiveTransition];
            self.interactionController = nil;
        }
            break;
    }
}

@end
