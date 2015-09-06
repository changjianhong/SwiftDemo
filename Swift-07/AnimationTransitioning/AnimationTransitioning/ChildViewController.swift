//
//  ChildViewController.swift
//  AnimationTransitioning
//
//  Created by 常健洪 on 15/8/17.
//  Copyright (c) 2015年 常健洪. All rights reserved.
//

import UIKit

class ChildViewController: UIViewController {

    var themeColor:UIColor!

    override func viewDidLoad() {
        super.viewDidLoad()
        println("viewDidLoad \(self.title)")
        self.view.backgroundColor = themeColor
    }
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        println("viewWillAppear \(self.title)")
    }
    
    override func viewWillDisappear(animated: Bool) {
        
        super.viewWillDisappear(animated)
        println("viewWillDisappear \(self.title)")
    }
    
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)
        println("viewDidAppear \(self.title)")
    }
    
    override func viewDidDisappear(animated: Bool) {
        
        super.viewDidDisappear(animated)
        println("viewDidDisappear \(self.title)")
    }
    
}
