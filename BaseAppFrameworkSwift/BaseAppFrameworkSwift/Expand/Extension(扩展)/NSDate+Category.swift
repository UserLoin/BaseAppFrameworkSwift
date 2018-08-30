//
//  NSDate+Category.swift
//  YiYuanDuoBao
//
//  Created by 咖达 on 2017/8/24.
//  Copyright © 2017年 咖达. All rights reserved.
//

import UIKit
extension NSDate
{
    
    /// 根据时间戳转换成一定格式的字符串
    ///
    /// - Parameter timeStamp: 时间戳：1463637809
    /// - Returns:             规定格式的字符串
    public class func timeStampToString(timeStamp: Int) -> String
    {
        //转换为时间
        let timeInterval:TimeInterval = TimeInterval(timeStamp)
        let date = Date(timeIntervalSince1970: timeInterval)
        
        //格式化输出
        let dformatter = DateFormatter()
        dformatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        return dformatter.string(from: date)
    }
    
    
    static func stringToTimeStamp(stringTime:String)->String {
        
        let dfmatter = DateFormatter()
        dfmatter.dateFormat="yyyy年MM月dd日"
        let date = dfmatter.date(from: stringTime)
        
        let dateStamp:TimeInterval = date!.timeIntervalSince1970
        let dateSt:Int = Int(dateStamp)
        
        return String(dateSt)
        
    }
    
    static func timeStampToStringT(timeStamp:String)->String {
        
        let string = NSString(string: timeStamp)
        
        let timeSta:TimeInterval = string.doubleValue
        let dfmatter = DateFormatter()
        dfmatter.dateFormat="yyyy年MM月dd日"
        
        let date = NSDate(timeIntervalSince1970: timeSta)
        
        return dfmatter.string(from: date as Date)
    }
    
    
}
