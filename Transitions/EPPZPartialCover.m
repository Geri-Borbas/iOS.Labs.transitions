//
//  EPPZPartialCover.m
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

#import "EPPZPartialCover.h"


@interface EPPZPartialCover ()
@end



@implementation EPPZPartialCover


#pragma mark - Defaults

-(void)setup
{
    self.padding = 128.0;
    self.fade = 0.5;
    self.shrink = 0.8;
}


#pragma mark - Presentation

-(void)animatePresentationOfView:(UIView*) modalView
                          onView:(UIView*) presenterView
                       container:(UIView*) containerView
                      completion:(void(^)(BOOL finished)) completion
{
    // Pre-animation.
    [containerView addSubview:modalView];
    modalView.transform = CGAffineTransformMakeTranslation(0.0, modalView.bounds.size.height); // Bottom out
    
    // Animation.
    [UIView animateWithDuration:self.duration
                          delay:0.0
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^
     {
         presenterView.alpha = self.fade;
         presenterView.transform = CGAffineTransformMakeScale(self.shrink, self.shrink);
         modalView.transform = CGAffineTransformMakeTranslation(0.0, self.padding); // In
     }
                     completion:^(BOOL finished){ completion(finished); }];
}


#pragma mark - Dismissal

-(void)animateDismissalOfView:(UIView*) modalView
                       onView:(UIView*) presenterView
                    container:(UIView*) containerView
                   completion:(void(^)(BOOL finished)) completion
{
    // Animation.
    [UIView animateWithDuration:self.duration
                          delay:0.0
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^
     {
         presenterView.alpha = 1.0;
         presenterView.transform = CGAffineTransformIdentity;
         modalView.transform = CGAffineTransformMakeTranslation(0.0, modalView.bounds.size.height); // Bottom out
     
    } completion:^(BOOL finished){ completion(finished); }];
}


@end
