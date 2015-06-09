//
//  ViewController.m
//  BubbleTransition
//
//  Created by Anson on 15/6/9.
//  Copyright (c) 2015年 Anson Tsang. All rights reserved.
//

#import "ViewController.h"
#import "CustomTransition.h"
@interface ViewController ()<UIViewControllerTransitioningDelegate>
@property (weak, nonatomic) IBOutlet UIButton *transitionButton;

@end

@implementation ViewController{
    
    CustomTransition * _transition;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _transition = [[CustomTransition alloc]init];
}


#pragma mark ----TransitionDelegate


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



#pragma mark ----  Storyboard Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UIViewController * toViewController = segue.destinationViewController;
    toViewController.transitioningDelegate = self;
    toViewController.modalPresentationStyle = UIModalPresentationCustom;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
