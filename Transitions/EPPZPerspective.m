//
//  EPPZPerspective.m
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

#import "EPPZPerspective.h"


CGFloat degreesToRadians(CGFloat degrees)
{ return degrees / 180.0f * M_PI; }


@interface EPPZPerspective ()
@property (nonatomic) CATransform3D presentingCorrectionTransform;
@property (nonatomic) CATransform3D modalOutTransform;
@end



@implementation EPPZPerspective


#pragma mark - Defaults

-(void)setup
{
    // Modal.
    CATransform3D move = CATransform3DMakeTranslation(480.0, 320.0, 0.0);
    CATransform3D rotate = CATransform3DMakeRotation(degreesToRadians(90), 0.1, 0.3, 0.2);
    self.modalOutTransform = CATransform3DConcat(move, rotate);
    
    // Put presenting view back (avoid intersections of the views).
    self.presentingCorrectionTransform = CATransform3DMakeTranslation(0.0, 0.0, -320.0);
}


#pragma mark - Presentation

-(void)animatePresentationOfView:(UIView*) modalView
                          onView:(UIView*) presenterView
                       container:(UIView*) containerView
                      completion:(void(^)(BOOL finished)) completion
{
    // Pre-animation.
    [containerView addSubview:modalView];
    presenterView.layer.transform = self.presentingCorrectionTransform; // Back
    modalView.layer.transform = self.modalOutTransform; // Out
    
    // Animation.
    [UIView animateWithDuration:self.duration
                     animations:^
     {
         modalView.layer.transform = CATransform3DIdentity; // In
     }
                     completion:^(BOOL finished){ completion(finished); }];
}


#pragma mark - Dismissal

-(void)animateDismissalOfView:(UIView*) modalView
                       onView:(UIView*) presenterView
                    container:(UIView*) containerView
                   completion:(void(^)(BOOL finished)) completion
{
    // Pre-animation.
    presenterView.layer.transform = self.presentingCorrectionTransform; // Back
    
    // Animation.
    [UIView animateWithDuration:self.duration
                     animations:^
    {
        modalView.layer.transform = self.modalOutTransform; // Out
    
    } completion:^(BOOL finished)
    {
        presenterView.layer.transform = CATransform3DIdentity; // In
        completion(finished);
    }];
}


@end
