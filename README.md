# CustomTransition


This is an Objective-c version of [andreamazz/BubbleTransition](https://github.com/andreamazz/BubbleTransition).
I Re-wrote it for personal practice.


### To do

```objective-c
_transition = [[CustomTransition alloc]init];
```

```objective-c
-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    
    _transition.transitionmode = Present;
    _transition.startPoint = _transitionButton.center;
    _transition.bubbleColor = _transitionButton.backgroundColor;
    return _transition;
    
    
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    
    _transition.transitionmode = Dismiss;
    _transition.startPoint = _transitionButton.center;
    _transition.bubbleColor = _transitionButton.backgroundColor;
    return _transition;
    
    
}



```
###License

This prodject is released under MIT lisence.
