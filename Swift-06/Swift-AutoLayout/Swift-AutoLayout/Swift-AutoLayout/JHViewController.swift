//
//  JHViewController.swift
//  Swift-AutoLayout
//
//  Created by 常健洪 on 15/8/9.
//  Copyright (c) 2015年 常健洪. All rights reserved.
//

import UIKit

class JHViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
    
    convenience init(){
        
        
        var nibNameOrNol:String? = "JHViewController"
        
        println("\(nibNameOrNol)")
        
        var path:String = NSBundle.mainBundle().pathForResource(nibNameOrNol, ofType: "xib")!
        
        println(path)
        
        if NSBundle.mainBundle().pathForResource(nibNameOrNol, ofType:nil) != nil {
            
            nibNameOrNol = nil
            
        }
        
        self.init(nibName:"JHViewController", bundle:nil);
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
