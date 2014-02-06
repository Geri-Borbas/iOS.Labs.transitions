labs-transitions
================

Drop-in UIViewController transitions.
```Objective-C
// Simple as this.
presentee.modalPresentationStyle = UIModalPresentationCustom;
presentee.transitioningDelegate = [EPPZTransition prespective];
[self presentViewController:presentee animated:YES completion:nil];
```

![](https://github.com/eppz/labs-transitions/blob/master/Previews/EPPZTransition_0.0.2.gif "EPPZTransition 0.0.2")

Gonna make some parameter hooks in the future, now it is only a basic design for implementing custom transitions in a "keep your controller clean" manner. 

Instances are **"retained by themselves"**, no need for holding any references (unless you want to parametrize them).


#### License
> Licensed under the [Open Source MIT license](http://en.wikipedia.org/wiki/MIT_License).
