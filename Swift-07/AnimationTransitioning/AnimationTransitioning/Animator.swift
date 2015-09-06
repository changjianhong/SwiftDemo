//
//  Animator.swift
//  AnimationTransitioning
//
//  Created by 常健洪 on 15/8/18.
//  Copyright (c) 2015年 常健洪. All rights reserved.
//

import UIKit

class Animator: NSObject,UIViewControllerAnimatedTransitioning {
   
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        
        return 0.25
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        
        transitionContext.containerView().addSubview(toViewController!.view)
        
        toViewController?.view.alpha = 0
        
        UIView.animateWithDuration(self.transitionDuration(transitionContext), animations: { () -> Void in
            
            fromViewController?.view.transform = CGAffineTransformMakeScale(0.1, 0.1)
            toViewController?.view.alpha = 1
            
        }) { (isCompletion) -> Void in
            
            fromViewController?.view.transform = CGAffineTransformIdentity
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        }
        
    }
    
}
