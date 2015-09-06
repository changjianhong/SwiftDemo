//
//  JHViewController.swift
//  Swift-AutoLayout
//
//  Created by 常健洪 on 15/8/9.
//  Copyright (c) 2015年 常健洪. All rights reserved.
//

import UIKit

class JHViewController: UIViewController {

    @IBOutlet weak var imageViewTopView_CST: NSLayoutConstraint!
    @IBOutlet weak var imageViewTop_CST: NSLayoutConstraint!
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topPriorityChange()
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
    
    convenience init(){
        
        var nibNameOrNol:String? = "JHViewController"
        
        if NSBundle.mainBundle().pathForResource(nibNameOrNol, ofType:"nib") == nil {
            
            nibNameOrNol = nil
            
        }
        
        self.init(nibName:nibNameOrNol, bundle:nil);
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
    imageView top 只依赖于 label
    label隐藏 直接修改imageView的top 覆盖label原来的位置
    */
    func topConstantChange(){
        
        myLabel.hidden = true
        
        imageViewTop_CST.constant = -13
    }
    
    /**
    *  imageView top 分别依赖于label 父View
    修改top的优先级
    */
    func topPriorityChange(){
        
        myLabel.hidden = true
        imageViewTop_CST.priority = 750
        
        if imageViewTopView_CST.priority != 1000 {
            
             imageViewTopView_CST.priority = 1000
            
        }
        
       
    }
}
