//
//  TRTealViewController.m
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

#import "TRTealViewController.h"


@interface TRTealViewController ()
@property (nonatomic, strong) NSArray *transitions;
@property (nonatomic, weak) id <UIViewControllerTransitioningDelegate> selectedTransition;
@end


@implementation TRTealViewController


#pragma mark - Transition selection

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.transitions = @[
                         [NSNull null],
                         [EPPZTransition new],
                         [EPPZTransition crossFade],
                         [EPPZTransition partialSlide],
                         [EPPZTransition push]
                         ];
}

-(IBAction)transitionSegmentedControlValueChanged:(UISegmentedControl*) segmentedControl
{ self.selectedTransition = (id<UIViewControllerTransitioningDelegate>)self.transitions[segmentedControl.selectedSegmentIndex]; }


#pragma mark - Navigation

-(void)touchesEnded:(NSSet*) touches withEvent:(UIEvent*) event
{
    // Checks.
    if (self.presentedViewController != nil) return;
    
    // Create yellow.
    TRYellowViewController *yellow = [TRYellowViewController loadFromNib];
    
    // To be presented with the selected transition.
    yellow.modalPresentationStyle = UIModalPresentationCustom; // Important part of the game!
    yellow.transitioningDelegate = [self selectedTransition];
    
    // Present.
    [self presentViewController:yellow
                       animated:YES
                     completion:nil];
}


@end
