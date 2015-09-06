//
//  JHInteractionController.swift
//  Swift-TextKitDemo
//
//  Created by 常健洪 on 15/7/29.
//  Copyright (c) 2015年 常健洪. All rights reserved.
//

import UIKit

class JHInteractionController: UIViewController {

    weak var circleView:JHCircleView!
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let circle = JHCircleView(frame: CGRectMake(100, 100, 150, 200))
        var pan = UIPanGestureRecognizer(target: self, action:Selector("panGesture:"))
        
        circle.addGestureRecognizer(pan)
        
        self.textView.addSubview(circle)
        self.circleView = circle
        
        
        let textStorage = self.textView.textStorage
        textStorage.replaceCharactersInRange(NSMakeRange(0, 0), withString: String(contentsOfFile: NSBundle.mainBundle().pathForResource("lorem", ofType: "txt")!, encoding: NSUTF8StringEncoding, error: nil)!)
        self.textView.layoutManager.hyphenationFactor = 1.0
        
        updateExclusionPaths()
    }
    
    func panGesture(pan:UIPanGestureRecognizer){
        
        var point = pan.locationInView(self.view)
        
        self.circleView.center = point
        
        updateExclusionPaths()
    }
    

    func updateExclusionPaths(){
        
        var ovalFrame = self.textView.convertRect(self.circleView.bounds, fromView: self.circleView)
        
//        var ovalFrame = self.circleView.frame;
        
        ovalFrame.origin.x -= self.textView.textContainerInset.left
        ovalFrame.origin.y -= self.textView.textContainerInset.top
        
        let ovalPath = UIBezierPath(ovalInRect: ovalFrame)
            
        self.textView.textContainer.exclusionPaths = [ovalPath]
        
    
    }

}
