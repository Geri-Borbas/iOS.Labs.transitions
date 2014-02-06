//
//  EPPZPush.m
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

#import "EPPZPush.h"


@implementation EPPZPush


#pragma mark - Defaults

-(void)setup
{
    self.padding = [[UIApplication sharedApplication] keyWindow].bounds.size.height - 49.0;
}


#pragma mark - Presentation

-(void)animatePresentationOfView:(UIView*) modalView
                          onView:(UIView*) presenterView
                       container:(UIView*) containerView
                      completion:(void(^)(BOOL finished)) completion
{
    // Pre-animation.
    [containerView addSubview:modalView];
    modalView.transform = CGAffineTransformMakeTranslation(0.0, -modalView.bounds.size.height); // Top out
    
    // Animation.
    [UIView animateWithDuration:self.duration
                          delay:0.0
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^
     {
         presenterView.transform = CGAffineTransformMakeTranslation(0.0, self.padding); // In
         modalView.transform = CGAffineTransformMakeTranslation(0.0, -modalView.bounds.size.height + self.padding); // In
     }
                     completion:^(BOOL finished)
     {
         completion(finished);
     }];
}


#pragma mark - Dismissal

-(void)animateDismissalOfView:(UIView*) modalView
                       onView:(UIView*) presenterView
                    container:(UIView*) containerView
                   completion:(void(^)(BOOL finished)) completion
{
    // Pre-animation (gets override somewhy).
    presenterView.transform = CGAffineTransformMakeTranslation(0.0, self.padding); // In
    
    // Animation.
    [UIView animateWithDuration:self.duration
                          delay:0.0
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^
     {
         presenterView.transform = CGAffineTransformIdentity;
         modalView.transform = CGAffineTransformMakeTranslation(0.0, -modalView.bounds.size.height); // Top out
         
     } completion:^(BOOL finished){ completion(finished); }];
}


@end
