//
//  JHCollectionViewCell.swift
//  Swift-03-2
//
//  Created by 常健洪 on 15/7/25.
//  Copyright (c) 2015年 常健洪. All rights reserved.
//

import UIKit

let WIDTH:CGFloat = UIScreen.mainScreen().bounds.width

class JHCollectionViewCell: UICollectionViewCell {
    
    var textLabel:DiaryLabel!
    var textInt:Int = 0
    var labelText:String = ""{
        
        didSet{
            
//            self.backgroundColor = UIColor.blueColor()
            
            setupUI()
            
            self.textLabel.updateLabelText(labelText)
        }
    }
       

    override func awakeFromNib() {
        
    }

    
    func setupUI(){
        
        self.textLabel = DiaryLabel(fontName:"TpldKhangXiDictTrial", labelText:labelText, fontSize: 16.0, lineHeight: 5.0, point:CGPointMake(itemWidth / 2, 75.0))
        
        self.addSubview(textLabel)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
}
