//
//  JHTextContainer.swift
//  Swift-TextKitDemo
//
//  Created by 常健洪 on 15/7/30.
//  Copyright (c) 2015年 常健洪. All rights reserved.
//


import UIKit

class JHTextContainer: NSTextContainer {
   
    override func lineFragmentRectForProposedRect(proposedRect: CGRect, atIndex characterIndex: Int, writingDirection baseWritingDirection: NSWritingDirection, remainingRect: UnsafeMutablePointer<CGRect>) -> CGRect {
        
        var containerSize = self.size;
        
        var rect = super.lineFragmentRectForProposedRect(proposedRect, atIndex: characterIndex, writingDirection: baseWritingDirection, remainingRect: remainingRect)
        
        //半径  选取width height 最小值 / 2
        var radius = fminf(Float(containerSize.width), Float(containerSize.height))/2.0
        
        var ypos = fabs((Float(rect.origin.y) + Float(rect.size.height) / 2.0) - radius)
        
        var width = (ypos < radius) ? 2.0 * sqrt(radius * radius - ypos * ypos):0.0
        
//        var newRect = CGRectMake(CGFloat(Float(rect.origin.x) + radius - width / 2.0), rect.origin.y, CGFloat(width), rect.size.height)
        
        var height = rect.size.height
        
        var newRect = CGRectMake(CGFloat(Float(rect.origin.x) + radius - width / 2.0), rect.origin.y, CGFloat(width), height)
        
//        var newRect = CGRectMake(140.446838378906, 0.0, 94.1063232421875, 12.0)
        
        return newRect
        
    }
    
    
    
}
