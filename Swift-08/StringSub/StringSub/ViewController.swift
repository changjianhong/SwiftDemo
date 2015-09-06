//
//  ViewController.swift
//  StringSub
//
//  Created by 常健洪 on 15/8/24.
//  Copyright (c) 2015年 常健洪. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var stringArray:NSMutableArray = NSMutableArray()
        
        for str1 in str.componentsSeparatedByString("/") {
            
            var arr = str1.componentsSeparatedByString("]")
            
            if arr.count == 1{

                var strr:string = string()
                strr.num = ""
                strr.alpha = str1
                
                stringArray.addObject(strr)
                
            }else {
                for i in 0...arr.count - 2 {
                    
//                    var str2 = arr[i] as String
//                    var str3 = arr[arr.count - 1] as String
//                    var str4 = str2.stringByAppendingString("]").stringByAppendingString(str3)
                    
                    var strr:string = string()
                    strr.num = arr[i]
                    strr.alpha = arr[arr.count-1]
                    stringArray.addObject(strr)
                }
            }
        
        }
        println("\(stringArray.count)")
    }

}

