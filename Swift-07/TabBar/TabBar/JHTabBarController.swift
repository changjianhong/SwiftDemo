//
//  JHTabBarController.swift
//  TabBar
//
//  Created by 常健洪 on 15/8/19.
//  Copyright (c) 2015年 常健洪. All rights reserved.
//

import UIKit

class JHTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        println("\(self.childViewControllers.count)")
        
        println("\(self.viewControllers?.count)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
