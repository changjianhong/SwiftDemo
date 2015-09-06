//
//  NumberParser.swift
//  Swift-01
//
//  Created by 常健洪 on 15/7/21.
//  Copyright (c) 2015年 常健洪. All rights reserved.
//

import Foundation

class NumberParser: NSObject {
   
    var number:Int
    
    override init() {
        number = 1
        println("changjianhong")
    }
    
    func singleNumberToChinese(number:Character)->String{
        switch number {
        case "0":
            return "零"
        case "1":
            return "一"
        case "2":
            return "二"
        case "3":
            return "三"
        default:
            return "妈蛋"
        }
    }
    
}
