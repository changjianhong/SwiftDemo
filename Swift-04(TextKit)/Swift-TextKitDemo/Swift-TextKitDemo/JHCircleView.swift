//
//  JHCircleView.swift
//  Swift-TextKitDemo
//
//  Created by 常健洪 on 15/7/29.
//  Copyright (c) 2015年 常健洪. All rights reserved.
//

import UIKit

class JHCircleView: UIView {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.clearColor()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        
        self.tintColor.setFill()
        
        UIBezierPath(ovalInRect: self.bounds).fill()
    }

}
