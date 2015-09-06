//
//  JHAnimationTransitioning.swift
//  Swift-03-2
//
//  Created by 常健洪 on 15/7/27.
//  Copyright (c) 2015年 常健洪. All rights reserved.
//

import UIKit

class JHAnimationTransitioning:NSObject, UIViewControllerAnimatedTransitioning {
   
    var operation:UINavigationControllerOperation!
    
    //转场时长
    func transitionDuration(transitionContext:UIViewControllerContextTransitioning)->NSTimeInterval{
        return 0.4
    }
    
    /**
    required
    
    :param: transitionContext <#transitionContext description#>
    */
    //转场参数变化//animateTransition
    func animateTransition(transitionContext:UIViewControllerContextTransitioning){
        //获得转场舞台
        let containerView = transitionContext.containerView()
        
        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        //获得从哪个场景开始转
        let fromView = fromVC!.view
        
        
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        //要转到哪个场景
        let toView = toVC!.view
        
        toView!.alpha = 0.0
        
        //UINavigationControllerOperation 用来判断是转入还是转出
        if operation == UINavigationControllerOperation.Pop {
            toView?.transform = CGAffineTransformMakeScale(1.0, 1.0)
            
            toView?.transform = CGAffineTransformMakeRotation(2.0*CGFloat(M_PI))
        } else {
            toView?.transform = CGAffineTransformMakeScale(0.3, 0.3)
            
        }
        
        containerView.insertSubview(toView, aboveSubview: fromView)
    
        UIView.animateWithDuration(
            transitionDuration(transitionContext),
            delay: 0,
            options: UIViewAnimationOptions.CurveEaseIn,
            animations: {
            
                if self.operation == UINavigationControllerOperation.Pop{
                    fromView.transform = CGAffineTransformMakeScale(3.3, 3.3)
                } else {
                    toView.transform = CGAffineTransformMakeScale(1.0, 1.0)
//                    toView.transform = CGAffineTransformMakeRotation(1.0*CGFloat(M_PI))
                    

                }
                toView.alpha = 1.0
            }, completion:{finish in
                
                transitionContext.completeTransition(true)
                
        } )
    }

}
