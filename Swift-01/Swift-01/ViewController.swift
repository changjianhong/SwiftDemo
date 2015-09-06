//
//  ViewController.swift
//  Swift-01
//
//  Created by 常健洪 on 15/7/21.
//  Copyright (c) 2015年 常健洪. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// 初始化
        let str =  NumberParser.new().singleNumberToChinese("1")
        
        let number = NumberParser()
        
        println(number.number)
        
        let 常健洪:String = "刘梦元"
        
        println(常健洪)
        
        number.singleNumberToChinese("2")
        
        var num = NumberParser.new()
        
        var str2 = num.singleNumberToChinese("2")
        
        let a:Int = 3
        
        let str3 = str + str2 + String(a)
        
        let str4:String = "adafdas \(a)"
        
        println(str3)
        
        println(str4)
        
        var emptyArray = [Int]()
        
        var arr = ["a","b","c","d"]
        var arr1:[String] = ["a","b","c"];
        arr.append("e")
        arr += ["f","i"]
        
        var dic = ["1": "a","2": "b"]
        
        var dictionary = Dictionary<String,Float>()
        
        println(arr)
        
        println(emptyArray)
        
        println(dictionary)
        
        println("==========================================");
        
        println(dic)
        
        if let dicStr = dic.updateValue("c", forKey: "1"){
            println("asd\(dicStr)")
        }
        
        
        
        println(dic)
        
        println("==========================================");

        var airports = ["TYO": "Tokyo", "DUB": "Dublin"]
        
        if let oldValue = airports.updateValue("Dublin Internation", forKey: "DUB") {
            println("The old value for DUB was \(oldValue).")
        }
        
        let oldValue = airports.updateValue("Dublin as", forKey: "DUB")
        
        println("\(oldValue)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

