//
//  JHMultiTextViewController.swift
//  Swift-TextKitDemo
//
//  Created by 常健洪 on 15/7/29.
//  Copyright (c) 2015年 常健洪. All rights reserved.
//

import UIKit

class JHMultiTextViewController: UIViewController {

    @IBOutlet weak var oneTextView: UITextView!
 
    @IBOutlet weak var twoView: UIView!
    
    @IBOutlet weak var threeView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var oneTextStorage = self.oneTextView.textStorage;
        oneTextStorage .replaceCharactersInRange(NSMakeRange(0, 0), withString:String(contentsOfFile: NSBundle.mainBundle().pathForResource("lorem", ofType: "txt")!, encoding: NSUTF8StringEncoding, error:nil)!)
        
        
        var twoLayoutManager = NSLayoutManager()
        oneTextStorage.addLayoutManager(twoLayoutManager)
        var twoTextContainer = NSTextContainer()
        twoLayoutManager.addTextContainer(twoTextContainer)
        
        let twoTextView = UITextView(frame: self.twoView.bounds, textContainer: twoTextContainer)
        twoTextView.scrollEnabled = false
        twoTextView.translatesAutoresizingMaskIntoConstraints()
        twoTextView.autoresizingMask = UIViewAutoresizing.FlexibleHeight | UIViewAutoresizing.FlexibleWidth
        self.twoView .addSubview(twoTextView)
        
        
        
        var threeTextContainer = NSTextContainer(size: self.threeView.bounds.size)
        twoLayoutManager .addTextContainer(threeTextContainer)
        let threeTextView = UITextView(frame: self.threeView.bounds, textContainer: threeTextContainer)
        self.threeView .addSubview(threeTextView)
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        self.view.endEditing(true)
        
    }
    
}
