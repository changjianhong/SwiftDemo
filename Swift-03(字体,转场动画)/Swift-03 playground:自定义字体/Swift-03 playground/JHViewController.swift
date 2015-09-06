//
//  JHViewController.swift
//  Swift-03 playground
//
//  Created by 常健洪 on 15/7/25.
//  Copyright (c) 2015年 常健洪. All rights reserved.
//


/*
    添加第三方字体
    info.plist ->Fonts provided by application->字体名称

    Wyue-GutiFangsong-NC_deliverable  文悦古体仿宋
    TpldKhangXiDictTrial  康熙字典体
*/


import UIKit

class JHViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.whiteColor()
        //Wyue-GutiFangsong-NC_deliverable  //TpldKhangXiDictTrial
        let font = UIFont(name:"TpldKhangXiDictTrial", size: 10) as UIFont!
        
        let textAttributes:[NSObject : AnyObject]  = [NSFontAttributeName : font]
        
        var myLabel = UILabel()
    
        let labelText = "常健洪"
        
        /// OC Swift 混编
        let labelSize:CGSize = sizeHeightWithText(labelText, fontSize: 80, textAttributes: textAttributes)
        
        myLabel.frame = CGRect(x: 295/2,y: 100,width: labelSize.width,height: labelSize.height)
        
        myLabel.attributedText = NSAttributedString(string:labelText, attributes: textAttributes)
        
        myLabel.lineBreakMode = NSLineBreakMode.ByCharWrapping
        
        myLabel.numberOfLines = 0
        
        self.view.addSubview(myLabel)
    }

    /*
    Swift的String类型是值类型。如果你创建了一个新的字符串值，那么当其进行常量、变量赋值操作或在函数/方法中传递时，会进行值拷贝。在不同的情况下，都会对已有字符串值创建新的副本，并对该新副本进行传递或赋值。
    这和OC中的NSString不同，当您在OC创建了一个NSString实例，并将其传递给一个函数/方法,或者赋给一个变量，您永远都是传递或赋值同一个NSString实例的一个引用。
    除非您特别要求其进行值拷贝，否则字符串不会进行赋值新副本操作
    */
    
    func sizeHeightWithText(labelText:NSString,fontSize:CGFloat,textAttributes:[NSObject : AnyObject]) -> CGSize{
        
        return labelText.boundingRectWithSize(CGSizeMake(fontSize, 480), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: textAttributes, context: nil).size
        
    }

}
