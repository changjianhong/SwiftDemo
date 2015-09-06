//
//  DiaryLabel.swift
//  Swift-03-2
//
//  Created by 常健洪 on 15/7/25.
//  Copyright (c) 2015年 常健洪. All rights reserved.
//

import UIKit

class DiaryLabel: UILabel {

    var textAttributes:[NSObject:AnyObject]!
    
    convenience init(fontName:String,
        labelText:String,
        fontSize:CGFloat,
        lineHeight:CGFloat,
        point:CGPoint){
            
            self.init(frame:CGRectZero)
        
            var font = UIFont(name: fontName, size: fontSize) as UIFont!
            
            let paragraphStyle = NSMutableParagraphStyle()
            
            paragraphStyle.lineSpacing = lineHeight
            
            textAttributes = [NSFontAttributeName:font,NSParagraphStyleAttributeName:paragraphStyle]
       
            var labelSize:CGSize = sizeHeightWithText(labelText, fontSize: fontSize, textAttributes: textAttributes)
            
            self.frame = CGRect(origin: point, size: labelSize)
           
            self.attributedText = NSAttributedString(string: labelText, attributes: textAttributes)
            
            self.lineBreakMode = NSLineBreakMode.ByCharWrapping
            
            self.numberOfLines = 0
            
    }
    
    func sizeHeightWithText(labelText:NSString,fontSize:CGFloat,textAttributes:[NSObject : AnyObject]) -> CGSize{
        
        var size = labelText.boundingRectWithSize(CGSizeMake(fontSize, 480), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: textAttributes, context: nil).size
        return size;
    }
    
    func updateLabelText(labelText:String){
        
        var labelSize = sizeHeightWithText(labelText, fontSize: self.font.pointSize, textAttributes:textAttributes)
        
        self.attributedText = NSAttributedString(string: labelText, attributes: textAttributes)
        
        self.frame = CGRect(origin: self.frame.origin, size: labelSize)
    }
    
    
    func updateTextColor(textColor:UIColor){
        
        textAttributes[NSForegroundColorAttributeName] = textColor
        
        self.attributedText = NSAttributedString(string: self.attributedText.string, attributes: textAttributes)
        
    }
    
    
}










