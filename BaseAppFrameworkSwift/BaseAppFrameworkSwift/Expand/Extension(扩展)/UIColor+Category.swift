//
//  UIColor+Category.swift
//  WeiBo
//
//  Created by 咖达 on 2017/7/30.
//  Copyright © 2017年 咖达. All rights reserved.
//

import UIKit

extension UIColor
{
    
    /// 常见的蓝色
    class func commonBlueColor() -> UIColor {
        return UIColor.rgbColor(45, 144, 255)
    }
    
    /// 随机色
    class func randomColor() -> UIColor {
        return UIColor(red: randomNumber(),
                       green: randomNumber(),
                       blue: randomNumber() ,
                       alpha: 1.0)
    }
    class func randomNumber() -> CGFloat {
        // 0 ~ 255
        return CGFloat(arc4random_uniform(256)) / CGFloat(255)
    }
    
    
    ///RGBA
    class func rgbaColor(_ red:Int ,_ green:Int ,_ blue:Int ,_ alpha:CGFloat) -> UIColor {
        return UIColor(red: CGFloat(red)/255.0,
                       green: CGFloat(green)/255.0,
                       blue: CGFloat(blue)/255.0,
                       alpha: alpha)
    }
    ///RGBA
    class func rgbColor(_ red:Int ,_ green:Int ,_ blue:Int) -> UIColor {
        return UIColor(red: CGFloat(red)/255.0,
                       green: CGFloat(green)/255.0,
                       blue: CGFloat(blue)/255.0,
                       alpha: 1.0)
    }
    
    
    /// 16进制 转 RGBA
    class func rgbaColorFromHex(_ rgb:Int, _ alpha:CGFloat) ->UIColor {
        return UIColor(red: ((CGFloat)((rgb & 0xFF0000) >> 16)) / 255.0,
                       green: ((CGFloat)((rgb & 0xFF00) >> 8)) / 255.0,
                       blue: ((CGFloat)(rgb & 0xFF)) / 255.0,
                       alpha: alpha)
        //调用示例：UIColor.rgbaColorFromHex(0xb38a34, alpha: 0.3);
    }
    /// 16进制 转 RGB
    class func rgbColorFromHex(_ rgb:Int) ->UIColor {
        return UIColor(red: ((CGFloat)((rgb & 0xFF0000) >> 16)) / 255.0,
                       green: ((CGFloat)((rgb & 0xFF00) >> 8)) / 255.0,
                       blue: ((CGFloat)(rgb & 0xFF)) / 255.0,
                       alpha: 1.0)
    }
}
