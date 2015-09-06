//
//  JHRectViewController.swift
//  Swift-TextKitDemo
//
//  Created by 常健洪 on 15/7/29.
//  Copyright (c) 2015年 常健洪. All rights reserved.
//

import UIKit

class JHRectViewController: UIViewController {

    var textContainer:JHTextContainer!
    weak var textView:UITextView!
    weak var circleView:JHCircleView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        let circle = JHCircleView(frame: CGRectMake(100 ,150, 50, 100))
        self.circleView = circle
       
        
        var textStorage = NSTextStorage(string:String(contentsOfFile: NSBundle.mainBundle().pathForResource("layout", ofType: "txt")!, encoding: NSUTF8StringEncoding, error: nil)!)
        
        
        var layoutManager = NSLayoutManager()
        
        
        //支持断字显示
        layoutManager.hyphenationFactor = 1.0
        textStorage .addLayoutManager(layoutManager)
        
        textContainer = JHTextContainer(size: self.view.bounds.size)
        textContainer.lineBreakMode = NSLineBreakMode.ByCharWrapping
        layoutManager .addTextContainer(textContainer)
        
        
        let textView = UITextView(frame:CGRectMake(0, 100, 375, 375), textContainer: textContainer)
        self.textView = textView
        self.view.addSubview(textView)
       
//        self.textView.addSubview(circle)
        
//        self.updateExclusionPaths()
        
    }

    func updateExclusionPaths(){
        
        var ovalFrame = self.textView.convertRect(self.circleView.bounds, fromView: self.circleView)
        
        ovalFrame.origin.x -= self.textView.textContainerInset.left
        ovalFrame.origin.y -= self.textView.textContainerInset.top
        
        let ovalPath = UIBezierPath(ovalInRect: ovalFrame)
        
        self.textContainer.exclusionPaths = [ovalPath]
        
        
    }
    
    
    

}
