//
//  ViewController.swift
//  Swift-hideBottomHairline
//
//  Created by 常健洪 on 15/8/18.
//  Copyright (c) 2015年 常健洪. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationController?.navigationBar.hideBottomHairline()
        
    }

}

extension UINavigationBar {
    
    func hideBottomHairline() {
        
        let navigationBarImageView = hairlineImageViewInNavigationBar(self)
        
        navigationBarImageView?.hidden = true
        
    }
    
    func showBottomHairline() {
        
        let navigationBarImageView = hairlineImageViewInNavigationBar(self)
        
        navigationBarImageView?.hidden = false
        
    }
    
    func hairlineImageViewInNavigationBar(view:UIView) -> UIImageView? {
        
        if let view = view as? UIImageView where view.bounds.height <= 1.0 {
        
            return view
        }
        
        if let subviews = view.subviews as? [UIView] {
            
            for subview in subviews {
                
                if let imageView = hairlineImageViewInNavigationBar(subview) {
                    
                    return imageView
                }
                
            }
        }
        
        return nil
        
    }
    
}