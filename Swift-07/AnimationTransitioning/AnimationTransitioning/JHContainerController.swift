//
//  JHContainerController.swift
//  AnimationTransitioning
//
//  Created by 常健洪 on 15/8/17.
//  Copyright (c) 2015年 常健洪. All rights reserved.
//

import UIKit
import SnapKit

class JHContainerController: UIViewController {

    let kButtonSlotWidth = 64; // Also distance between button centers
    let kButtonSlotHeight = 44;
    
    var viewControllers:NSArray
    
    //测试数组
    var arr:[Int]!
    
    var privateButtonsView:UIView!
    
    var privateContainerView:UIView!
    
    var selectedViewController:UIViewController? {
        willSet(newValue) {
            _transitionToChildViewController(newValue!)
        }
        didSet {
            _updateButtonSelection()
        }
    }
    
    init(viewControllers:NSArray){
        
        self.viewControllers = viewControllers as! [UIViewController]
        
        super.init(nibName: nil, bundle: nil)
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        
        var rootView                              = UIView()
        rootView.backgroundColor                  = UIColor.blackColor()
        rootView.opaque                           = true

        self.privateContainerView                 = UIView()
        self.privateContainerView.backgroundColor = UIColor.blackColor()
        self.privateContainerView.opaque          = true

        self.privateButtonsView                   = UIView()
        self.privateButtonsView.backgroundColor   = UIColor.clearColor()
        self.privateButtonsView.tintColor         = UIColor(white: 1, alpha: 0.75)
        
        self.privateButtonsView.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.privateContainerView.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        rootView.addSubview(self.privateContainerView)
        rootView.addSubview(self.privateButtonsView)
        
        ///privateContainerView 布局
        self.privateContainerView.snp_makeConstraints { (make) -> Void in
            
            make.size.equalTo(rootView)
            make.top.equalTo(rootView)
            make.left.equalTo(rootView)
            
        }
        
        ///privateButtonsView 布局
        self.privateButtonsView.snp_makeConstraints { (make) -> Void in
            
            make.width.equalTo(kButtonSlotWidth * 3)
            make.height.equalTo(kButtonSlotHeight)
            make.center.equalTo(self.privateContainerView)
            
        }
        
        _addChildViewControllerBtns()
        
        self.view = rootView
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        var vc:UIViewController     = self.viewControllers[0] as! UIViewController

        self.selectedViewController = (self.selectedViewController != nil ? self.selectedViewController : vc)!
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func childViewControllerForStatusBarStyle() -> UIViewController? {
        
        return self.selectedViewController
    }
    
    
/// 私有方法
    
    func _addChildViewControllerBtns() {
    
        
        for (index,obj) in enumerate(self.viewControllers) {
            
            var vc = obj as! UIViewController
            
            var button = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
            
            button.adjustsImageWhenHighlighted = false
            
            var icon = vc.tabBarItem.image?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
            
            button.setImage(icon, forState: UIControlState.Normal)
            
            var selectedIcon = vc.tabBarItem.selectedImage.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
            
            button.setImage(selectedIcon, forState: UIControlState.Selected)
            
            button.tag = index
            
            button.addTarget(self, action: Selector("_buttonTap:"), forControlEvents: UIControlEvents.TouchDown)
            
            button.setTranslatesAutoresizingMaskIntoConstraints(false)
            
            self.privateButtonsView.addSubview(button)
            
            button.snp_makeConstraints({ (make) -> Void in
                
                make.centerY.equalTo(self.privateButtonsView)
                
                make.centerX.equalTo(self.privateButtonsView.snp_leading).offset((Float(index) + 0.5) * Float(self.kButtonSlotWidth))
                
            })
        
        }

    }
    
    func _buttonTap(btn:UIButton) {
        
        var vc = self.viewControllers[btn.tag] as! UIViewController
        
        self.selectedViewController = vc
        
    }
    
    func _updateButtonSelection() {
        
        for (index,obj) in enumerate(self.privateButtonsView.subviews) {
            
            var btn = obj as! UIButton
            
            btn.selected = (self.viewControllers[index] as? UIViewController == self.selectedViewController)
            
        }
        
    }
    
    func _transitionToChildViewController(toViewController:UIViewController) {
        
        var fromViewController:UIViewController? = (self.childViewControllers.count > 0 ? self.childViewControllers[0] as? UIViewController : nil)
        
        println("\(self.childViewControllers.count)")
        
        
        if fromViewController == toViewController || !self.isViewLoaded(){
            return
        }
        
        
        var toView              = toViewController.view
        toView.setTranslatesAutoresizingMaskIntoConstraints(true)
        toView.autoresizingMask = UIViewAutoresizing.FlexibleHeight | UIViewAutoresizing.FlexibleWidth
        toView.frame            = self.privateContainerView.frame
        
        fromViewController?.willMoveToParentViewController(nil)
        
        self.addChildViewController(toViewController)
        self.privateContainerView.addSubview(toView)
        
        fromViewController?.view .removeFromSuperview()
        
        fromViewController?.removeFromParentViewController()
        
        toViewController .didMoveToParentViewController(self)
        
//        var animator = Animator()
//        
//        var fromIndex = self.viewControllers.indexOfObject(fromViewController!)
//        var toIndex = self.viewControllers.indexOfObject(toViewController)
//        
//        var transtionContext =  PrivateTranstionContext(fromViewController: fromViewController!, toViewController: toViewController, goingRight: toIndex>fromIndex)
//        transtionContext.animated = true
//        transtionContext.interactive = false
//        
//        self.privateButtonsView.userInteractionEnabled = false
//        
//        animator .animateTransition(transtionContext)
    }
    
}


