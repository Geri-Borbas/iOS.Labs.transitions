labs-transitions
================

Drop-in UIViewController transitions.
```Objective-C
// Simple as this.
presentee.modalPresentationStyle = UIModalPresentationCustom;
presentee.transitioningDelegate = [EPPZTransition partialCover];
[self presentViewController:presentee animated:YES completion:nil];
```

In development
--------------

Come back later, or clone if you came from my **[Stackoverflow question](http://stackoverflow.com/questions/21591684/why-presenting-view-transform-gets-reset-on-dismissal)**.
