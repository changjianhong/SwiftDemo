//
//  PrivateTranstionContext.swift
//  AnimationTransitioning
//
//  Created by 常健洪 on 15/8/18.
//  Copyright (c) 2015年 常健洪. All rights reserved.
//

import UIKit

class PrivateTranstionContext: NSObject,UIViewControllerContextTransitioning {
   
    var animated:Bool!
    var interactive:Bool!
    private var privateViewControllers:NSDictionary
    private var privateDisapperaingFromRect:CGRect!
    private var privateAppearingFromRect:CGRect!
    private var privateDisappearingToRect:CGRect!
    private var privateAppearingToRect:CGRect!

    
    
    init(fromViewController:UIViewController, toViewController:UIViewController, goingRight:Bool) {
        
        self.privateViewControllers = [UITransitionContextFromViewControllerKey:fromViewController,
                                       UITransitionContextToViewControllerKey:toViewController]
        super.init()
        
        var travelDistance = goingRight ? -self.containerView().bounds.width : self.containerView().bounds.width
        self.privateDisapperaingFromRect  = self.containerView().bounds
        self.privateAppearingToRect = self.containerView().bounds
        self.privateDisappearingToRect = CGRectOffset (self.containerView().bounds, travelDistance, 0);
        self.privateAppearingFromRect = CGRectOffset (self.containerView().bounds, -travelDistance, 0);
        
    }
  
    func containerView() -> UIView {
        var vc = self.privateViewControllers[UITransitionContextFromViewControllerKey] as! UIViewController
        
        return vc.view.superview!
    }
    
    func isAnimated() -> Bool {
        return animated
    }
    
    func isInteractive() -> Bool {
        return interactive
    }
    
    func transitionWasCancelled() -> Bool {
        return false
    }
    
    func presentationStyle() -> UIModalPresentationStyle {
        return UIModalPresentationStyle.Custom
    }
    
    func updateInteractiveTransition(percentComplete: CGFloat) {}
    
    func finishInteractiveTransition() {}
    
    func cancelInteractiveTransition() {}
    
    func completeTransition(didComplete: Bool) {
        
    }
    
    func viewControllerForKey(key: String) -> UIViewController? {
        return self.privateViewControllers[key] as? UIViewController
    }
    
    func viewForKey(key: String) -> UIView? {
        return self.privateViewControllers[key]?.view

    }
    
    func targetTransform() -> CGAffineTransform {
        return self.viewForKey(UITransitionContextFromViewControllerKey)!.transform
    }
    
    func initialFrameForViewController(vc: UIViewController) -> CGRect {
        if vc == self.viewControllerForKey(UITransitionContextFromViewControllerKey) {
            return self.privateDisapperaingFromRect
        } else {
            return self.privateAppearingFromRect
        }
    }
    
    func finalFrameForViewController(vc: UIViewController) -> CGRect {
        if vc == self.viewControllerForKey(UITransitionContextToViewControllerKey) {
            return self.privateDisappearingToRect
        } else {
            return self.privateAppearingToRect
        }
    }
}
