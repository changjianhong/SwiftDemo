//
//  ViewController.swift
//  AttributeString
//
//  Created by 常健洪 on 15/7/27.
//  Copyright (c) 2015年 常健洪. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let label = UILabel()
        
        label.attributedText = NSAttributedString(string: "changjianhong")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

