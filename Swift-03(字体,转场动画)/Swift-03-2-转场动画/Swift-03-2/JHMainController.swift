//
//  JHMainController.swift
//  Swift-03-2
//
//  Created by 常健洪 on 15/7/25.
//  Copyright (c) 2015年 常健洪. All rights reserved.
//

import UIKit

class JHMainController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        //TpldKhangXiDictTrial //TpldYiFengScripture //TpldYiFengScriptureF
        var mylabel = DiaryLabel(fontName: "TpldKhangXiDictTrial", labelText:"常健洪", fontSize: 80, lineHeight: 3, point: CGPointMake(295/2, 100))
        
        self.view.addSubview(mylabel)
        
        mylabel.updateTextColor(UIColor.redColor())
        
      //  mylabel.updateLabelText("圣旨到")
        
    }
}
