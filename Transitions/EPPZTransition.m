//
//  EPPZTransition.m
//  Transitions
//
//  Created by Borbás Geri on 2/5/14.
//  Copyright (c) 2014 eppz! development, LLC.
//
//  follow http://www.twitter.com/_eppz
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import "EPPZTransition.h"


@interface EPPZTransition ()
@property (nonatomic) BOOL present;
@end


@implementation EPPZTransition


#pragma mark - Factories

+(EPPZTransition*)crossFade
{ return [EPPZCrossFade new]; }

+(EPPZTransition*)partialSlide
{ return [EPPZPartialCover new]; }

+(EPPZTransition*)push
{ return [EPPZPush new]; }


#pragma mark - Defaults

-(instancetype)init
{
    if (self = [super init]) { [self setup]; }
    return self;
}

-(void)setup
{
    // Subclass template.
}


#pragma mark - Transitioning

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController*) presented
                                                                 presentingController:(UIViewController*) presenting
                                                                     sourceController:(UIViewController*) source
{
    self.present = YES;
    return self;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController*) dismissed
{
    self.present = NO;
    return self;
}


#pragma mark - Animation

-(NSTimeInterval)duration
{ return 1.0; } // Default

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>) transitionContext
{ return self.duration; }

-(void)animateTransition:(id<UIViewControllerContextTransitioning>) transitionContext
{
    // Aliases.
    UIView *fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
    UIView *toView = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
    UIView *containerView = [transitionContext containerView];
    
    if (self.present)
    {
        [self animatePresentationOfView:toView
                                 onView:fromView
                              container:containerView
                             completion:^(BOOL finished){ [transitionContext completeTransition:YES]; }];
    }
    
    else
    {
        [self animateDismissalOfView:fromView
                              onView:toView
                           container:containerView
                          completion:^(BOOL finished){ [transitionContext completeTransition:YES]; }];
    }
}


#pragma mark - Subclass templates

-(void)animatePresentationOfView:(UIView*) modalView
                          onView:(UIView*) presenterView
                       container:(UIView*) containerView
                      completion:(void(^)(BOOL finished)) completion
{
    // Default implementation.
    [containerView addSubview:modalView];
    completion(YES);
}

-(void)animateDismissalOfView:(UIView*) modalView
                       onView:(UIView*) presenterView
                    container:(UIView*) containerView
                   completion:(void(^)(BOOL finished)) completion
{
    // Default implementation.
    completion(YES);
}


@end
