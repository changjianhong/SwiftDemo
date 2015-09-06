//
//  JHTestController.swift
//  Swift-02
//
//  Created by 常健洪 on 15/7/22.
//  Copyright (c) 2015年 常健洪. All rights reserved.
//

import UIKit

class JHTestController: UIViewController {
    
    
    //单例
    static let shareInstance = JHTestController()
    
    //? 可选的 Swift里不会自动给变量赋初始值，也就是说变量不会有默认值，所以要求使用变量之前必须要对其初始化
    //在写协议(protocol)时，对于可选代理方法，也需要在调用时在函数名后跟着？,如：
    //! 来声明变量，会成为隐式强拆包可选类型，这表示这个类型永远不会出现nil的情况，但一旦出来，在调用时就会崩溃
    var button:UIButton!
    
    
    /*
    UIButtonType.ContactAdd：前面带“+”图标按钮，默认文字颜色为蓝色，有触摸时的高亮效果
    UIButtonType.DetailDisclosure：前面带“!”图标按钮，默认文字颜色为蓝色，有触摸时的高亮效果
    UIButtonType.System：前面不带图标，默认文字颜色为蓝色，有触摸时的高亮效果
    UIButtonType.Custom：定制按钮，前面不带图标，默认文字颜色为白色，无触摸时的高亮效果
    UIButtonType.InfoDark：为感叹号“!”圆形按钮
    UIButtonType.InfoLight：为感叹号“!”圆形按钮
    */
    
    var alert:UIAlertView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        button = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
        
        button.frame = CGRectMake(self.view.frame.width / 2 - 40, self.view.frame.height / 2 - 20, 80, 40)
        
        button.backgroundColor = UIColor.redColor()
        
        button.setTitle("我是按钮", forState: UIControlState.Normal)
        
        button.addTarget(self, action:Selector("btnClick"), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view .addSubview(button)
        
        alert = UIAlertView(title: "我是按钮", message: "真他妈麻烦", delegate: self, cancelButtonTitle: "取消")
        
    }
    
    
    func btnClick(){
        println("我被点击了")
        
        alert.show()
        
    }
    
    

}
