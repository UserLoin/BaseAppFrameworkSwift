
//
//  String+Category.swift
//  YiYuanDuoBao
//
//  Created by 咖达 on 2017/8/17.
//  Copyright © 2017年 咖达. All rights reserved.
//

import UIKit
extension String{
    
    //MARK: - 1.富文本相关处理
    /// 根据正则表达式改变文字颜色
    ///
    /// - Parameters:
    ///   - regex: 正则  "\\d+"  数字
    ///   - text: 文本
    ///   - color: 颜色
    /// - Returns: 返回的富文本字符串
    
    func changeTextChange(regex: String, color: UIColor) -> NSMutableAttributedString {
        let attributeString = NSMutableAttributedString(string: self)
        do {
            let regexExpression = try NSRegularExpression(pattern: regex, options: NSRegularExpression.Options())
            let result = regexExpression.matches(in: self, options: NSRegularExpression.MatchingOptions(), range: NSMakeRange(0, self.characters.count))
            for item in result {
                attributeString.addAttribute(NSAttributedStringKey.foregroundColor, value: color, range: item.range)
            }
        } catch {
            print("Failed with error: \(error)")
        }
        return attributeString
    }
    
    
    /// 改变字符串的attributeString
    ///
    /// - Parameters:
    ///   - string: 原字符串
    ///   - rangeString: 改变字符串
    ///   - color: 颜色
    /// - Returns: attributeString
    
    func changeAttributeString(rangeStringArray:[String], color:UIColor ) -> NSMutableAttributedString {
        let attributeString:NSMutableAttributedString = NSMutableAttributedString(string:self)
        let str = NSString(string: self)
        for rangeString in rangeStringArray {
            let theRange = str.range(of: rangeString)
            attributeString.addAttribute(NSAttributedStringKey.foregroundColor, value: color, range: theRange)
            attributeString.addAttribute(NSAttributedStringKey.font, value: UIFont.systemFont(ofSize: 14), range: theRange)
        }
        
        return attributeString
    }
    
    
    /// 富文本添加中划线
    ///
    /// - Parameters:
    ///   - rangeString: 需要添加下/中划线的文本
    ///   - isStrike:    中划线
    ///   - isUnderline: 下划线
    func  lineStyleAttributeString(rangeString: String, isStrike:Bool ,isUnderline:Bool) -> NSMutableAttributedString {
        let attributeString:NSMutableAttributedString = NSMutableAttributedString(string:self)
        let str = NSString(string: self)
        let theRange = str.range(of: rangeString)
        if isStrike {
            attributeString.addAttribute(NSAttributedStringKey.strikethroughStyle, value: 1, range: theRange)
            attributeString.addAttribute(NSAttributedStringKey.baselineOffset, value: 1, range: theRange)
            attributeString.addAttribute(NSAttributedStringKey.strikethroughColor, value: UIColor.red , range: theRange)
        }
        if isUnderline {
            attributeString.addAttribute(NSAttributedStringKey.underlineStyle, value: 1 , range: theRange)
            attributeString.addAttribute(NSAttributedStringKey.underlineColor, value: UIColor.red , range: theRange)
        }
        return attributeString
    }
    
    //MARK: - 2.获得label的高度
    ///获取高度
    func getLabHeight(labelStr:String,font:UIFont,width:CGFloat) -> CGFloat {
        let statusLabelText: NSString = labelStr as NSString
        let size = CGSize(width: width, height: 900)
        let dic = NSDictionary(object: font, forKey: NSAttributedStringKey.font as NSCopying)
        let strSize = statusLabelText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic as? [NSAttributedStringKey : AnyObject], context: nil).size
        return strSize.height
    }
    
    ///获取宽度
    func getLabWidth(labelStr:String, font:UIFont, height:CGFloat) -> CGFloat {
        let statusLabelText: NSString = labelStr as NSString
        let size = CGSize(width: 900, height: height);
        let dic = NSDictionary(object: font, forKey: NSAttributedStringKey.font as NSCopying)
        let strSize = statusLabelText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic as? [NSAttributedStringKey : AnyObject], context: nil).size
        return strSize.width
    }
    
    
    //MARK: - 3.文档路径
    /// 将当前字符串拼接到cache目录后面
    ///
    /// - Returns: cache路径
    func cacheDir() -> String{
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!  as NSString
        return path.appendingPathComponent((self as NSString).lastPathComponent)
    }
    
    /// 将当前字符串拼接到doc目录后面
    ///
    /// - Returns: doc路径
    func docDir() -> String
    {
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!  as NSString
        return path.appendingPathComponent((self as NSString).lastPathComponent)
    }
    
    /// 将当前字符串拼接到tmp目录后面
    ///
    /// - Returns: tmp路径
    func tmpDir() -> String
    {
        let path = NSTemporaryDirectory() as NSString
        return path.appendingPathComponent((self as NSString).lastPathComponent)
    }
}
