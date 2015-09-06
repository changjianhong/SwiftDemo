//
//  ViewController.swift
//  Swift-guard&flatMap
//
//  Created by 常健洪 on 15/8/19.
//  Copyright (c) 2015年 常健洪. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nestedArray = [[1,2,3],[4,5,6],[2,3]]
        
        let flattenedArray = nestedArray.flatMap({$0})
        
        let flattenedArray2 = nestedArray.flatMap({array in return array})
        
        println("flattenedArray2\(flattenedArray2)")
        
        println("flattenedArray\(flattenedArray)")
        
        let multipliedFlattenedArray = nestedArray.flatMap{$0.map {$0 * 2}}
        
        let multipliedFlattenedArray2 = nestedArray.flatMap({array in array.map({element in element * 2})})
        
        println("multipliedFlattenedArray\(multipliedFlattenedArray)")
        
        
        var array = [1,2,1,4]
        
        var names = ["fda","fdds","qwewq"]
        
        array.sort({$0>$1})
        
        println(" \(array)")
        
        let multiArray = array.map({$0 * 2})
        
        println("multiArray\(multiArray)")
        
        println("======================================")
  //============================================================
        
        let testArr = (1...7).map({"this is \($0)"})
        
        println("\(testArr)")
        
        let testArray = (7...9) //半开半闭区间？？
        
        println("\(testArray.startIndex) and \(testArray.endIndex)")
        
        let os = ObjCToSwift()
    }

}

