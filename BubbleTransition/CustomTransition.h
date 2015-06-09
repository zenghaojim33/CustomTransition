//
//  CustomTransition.h
//  BubbleTransition
//
//  Created by Anson on 15/6/9.
//  Copyright (c) 2015年 Anson Tsang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef enum{
    
    Present,
    Dismiss,
    Pop,
    
    
}BubbleTransitonMode;




@interface CustomTransition : NSObject<UIViewControllerAnimatedTransitioning>


@property(nonatomic,assign)CGPoint startPoint;
@property(nonatomic,assign)NSTimeInterval duration;
@property(nonatomic,assign)BubbleTransitonMode transitionmode;
@property(nonatomic,strong)UIColor * bubbleColor;


-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext;


-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext;

@end
