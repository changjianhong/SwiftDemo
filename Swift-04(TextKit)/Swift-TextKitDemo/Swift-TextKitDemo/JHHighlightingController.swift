//
//  JHHighlightingController.swift
//  Swift-TextKitDemo
//
//  Created by 常健洪 on 15/7/29.
//  Copyright (c) 2015年 常健洪. All rights reserved.
//

import UIKit

class JHHighlightingController: UIViewController {


  
    override func viewDidLoad() {
        super.viewDidLoad()

        
        var textStorage:JHTextStorage = JHTextStorage()
        
         textStorage .replaceCharactersInRange(NSMakeRange(0, 0), withString: String(contentsOfFile: NSBundle.mainBundle().pathForResource("iText", ofType: "txt")!, encoding: NSUTF8StringEncoding, error: nil)!)
        
        var layoutManager = NSLayoutManager()
        textStorage.addLayoutManager(layoutManager)
        
        var textContainer = NSTextContainer(size: self.view.bounds.size)
        layoutManager.addTextContainer(textContainer)
        
        
        let textView = UITextView(frame: self.view.bounds, textContainer: textContainer)
        
        
        self.view .addSubview(textView)
        
        
        
    }

   

}
