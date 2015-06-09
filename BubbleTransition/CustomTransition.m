//
//  CustomTransition.m
//  BubbleTransition
//
//  Created by Anson on 15/6/9.
//  Copyright (c) 2015年 Anson Tsang. All rights reserved.
//

#import "CustomTransition.h"
@interface CustomTransition()

@property(nonatomic,strong)UIView * bubble;
@end


@implementation CustomTransition




#pragma mark ---Init

-(instancetype)init{
    
    if (self = [super init])
    {
        self.duration = 0.5;
        self.startPoint = CGPointZero;
        self.bubbleColor = [UIColor whiteColor];
        
        return self;
        
    }
    return nil;
}

#pragma mark --- Setter


//-(void)setStartPoint:(CGPoint)startPoint
//{
//    self.startPoint = startPoint;
//    if (_bubble){
//        _bubble.center = startPoint;
//    }
//    
//}

#pragma mark UIViewControllerAnimatedTransitioning Delegate


-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return self.duration;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    UIView * containerView = [transitionContext containerView];
    
    if (self.transitionmode == Present){
        
        UIView * presentedControllerView = [transitionContext viewForKey:UITransitionContextToViewKey];
        CGPoint  originalCenter = presentedControllerView.center;
        CGSize originalSize = presentedControllerView.frame.size;
        _bubble = [[UIView alloc]initWithFrame:[self frameForBubbleCenter:originalCenter andOriginalSize:originalSize andStart:self.startPoint]];
        _bubble.layer.cornerRadius = _bubble.frame.size.height / 2;
        _bubble.center = self.startPoint;
        _bubble.transform = CGAffineTransformMakeScale(0.001, 0.001);
        _bubble.backgroundColor = self.bubbleColor;
        [containerView addSubview:_bubble];
        
        presentedControllerView.center = self.startPoint;
        presentedControllerView.transform = CGAffineTransformMakeScale(0.001, 0.001);
        presentedControllerView.alpha = 0;
        [containerView addSubview:presentedControllerView];
        
        [UIView animateWithDuration:self.duration animations:^{
           
            _bubble.transform = CGAffineTransformIdentity;
            presentedControllerView.transform = CGAffineTransformIdentity;
            presentedControllerView.alpha = 1;
            presentedControllerView.center = originalCenter;
            
            
            
        }completion:^(BOOL finished) {
            
            [transitionContext completeTransition:YES];
            
        }];
        
        
        
        
        
        
        
    }else if (self.transitionmode == Pop){
        UIView * returningControllerView = [transitionContext viewForKey:UITransitionContextToViewKey];
        CGPoint originalCenter = returningControllerView.center;
        CGSize originalSize = returningControllerView.frame.size;

        
        _bubble.frame = [self frameForBubbleCenter:originalCenter andOriginalSize:originalSize andStart:self.startPoint];
        _bubble.layer.cornerRadius = _bubble.frame.size.height / 2;
        _bubble.center = self.startPoint;
        [UIView animateWithDuration:self.duration animations:^{
            _bubble.transform = CGAffineTransformMakeScale(0.001, 0.001);
            returningControllerView.transform = CGAffineTransformMakeScale(0.001, 0.001);
            returningControllerView.center = self.startPoint;
            returningControllerView.alpha = 0;
        } completion:^(BOOL finished) {
            [returningControllerView removeFromSuperview];
            [_bubble removeFromSuperview];
            [transitionContext completeTransition:YES];
        }];
        
    
        
    }else{
        
        UIView * returningControllerView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        CGPoint originalCenter = returningControllerView.center;
        CGSize originalSize = returningControllerView.frame.size;
        
        _bubble.frame = [self frameForBubbleCenter:originalCenter andOriginalSize:originalSize andStart:self.startPoint];
        _bubble.layer.cornerRadius = _bubble.frame.size.height / 2;
        _bubble.center = self.startPoint;
        
        [UIView animateWithDuration:self.duration animations:^{
            _bubble.transform = CGAffineTransformMakeScale(0.001, 0.001);
            returningControllerView.transform = CGAffineTransformMakeScale(0.001, 0.001);
            returningControllerView.center = self.startPoint;
            returningControllerView.alpha = 0;
            
        } completion:^(BOOL finished) {
            
            [returningControllerView removeFromSuperview];
            [_bubble removeFromSuperview];
            [transitionContext completeTransition:YES];
            
        }];
        
    }
    
}


-(CGRect)frameForBubbleCenter:(CGPoint)originalCenter andOriginalSize:(CGSize)originalSize andStart:(CGPoint)start{
    
    CGFloat lengthX = fmax(start.x, originalSize.width - start.x);
    CGFloat lengthY = fmax(start.x, originalSize.height - start.y);
    CGFloat offset = sqrt(lengthX * lengthX * lengthY * lengthY) * 2;
    return CGRectMake(0, 0, offset, offset);
    
    
}







@end
