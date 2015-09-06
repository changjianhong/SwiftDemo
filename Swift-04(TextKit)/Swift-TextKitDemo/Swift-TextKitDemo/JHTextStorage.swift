//
//  JHTextStorage.swift
//  Swift-TextKitDemo
//
//  Created by 常健洪 on 15/7/29.
//  Copyright (c) 2015年 常健洪. All rights reserved.
//

/*
- (NSString *)string;
- (NSDictionary *)attributesAtIndex:(NSUInteger)location
effectiveRange:(NSRangePointer)range;
- (void)replaceCharactersInRange:(NSRange)range withString:(NSString *)str;
- (void)setAttributes:(NSDictionary *)attrs range:(NSRange)range;
*/


import UIKit

class JHTextStorage: NSTextStorage {
   
    var _imp:NSMutableAttributedString!

    
    override init() {
        super.init()
        
        _imp = NSMutableAttributedString()
    }
    
    required init(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder);
        
//        _imp = NSMutableAttributedString()
        
    }

    /// 重写 属性 get方法
    override var string:String{
        get{
            return _imp.string
        }
    }
    
    
    override func attributesAtIndex(location: Int, effectiveRange range: NSRangePointer) -> [NSObject : AnyObject] {
        return _imp.attributesAtIndex(location, effectiveRange: range)
    }
    
    override func replaceCharactersInRange(range: NSRange, withString str: String) {
        _imp.replaceCharactersInRange(range, withString: str)
        
//        println(str.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
        
        self.edited(NSTextStorageEditActions.EditedCharacters, range: range, changeInLength:str.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) - range.length)
    }
    
    override func setAttributes(attrs: [NSObject : AnyObject]?, range: NSRange) {
        _imp.setAttributes(attrs, range: range)
        self.edited(NSTextStorageEditActions.EditedCharacters, range: range, changeInLength: 0)
    }
    
    override func processEditing() {
        var iExpression:NSRegularExpression!
        
        iExpression =  NSRegularExpression(pattern: "i[\\p{Alphabetic}&&\\p{Uppercase}][\\p{Alphabetic}]+", options: NSRegularExpressionOptions.allZeros, error: nil)
        
        
/// 由于 String 的paragraphRangeForRange 需要的参数是Range<String.index>类型  self.editedRange:NSRange
/// 而NSRange 与 Range<String.index> 之间的转换 不会
/// 即把String转换为NSString
        var str:NSString = string;
        let paragraphRange = str.paragraphRangeForRange(self.editedRange)
        self.removeAttribute(NSForegroundColorAttributeName, range: paragraphRange)
        self.removeAttribute(NSFontAttributeName, range: paragraphRange)
        
        
        iExpression.enumerateMatchesInString(string, options: NSMatchingOptions.allZeros, range: paragraphRange) { (result, flag, stop) -> Void in
            
            var attrs = Dictionary<NSObject,AnyObject>()
            attrs[NSForegroundColorAttributeName] = UIColor.redColor()
            attrs[NSFontAttributeName] = UIFont.systemFontOfSize(18)
            
            self.setAttributes(attrs, range: result.range)
        }
        
        super.processEditing()
        
    }
    
}
