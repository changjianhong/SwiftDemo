//
//  ViewController.swift
//  JHSwiftSQLite
//
//  Created by 常健洪 on 15/8/27.
//  Copyright (c) 2015年 常健洪. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        createTable()
        
        insertData()
        
        queryData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

