//
//  UIImage+Category.swift
//  YiYuanDuoBao
//
//  Created by 咖达 on 2017/8/24.
//  Copyright © 2017年 咖达. All rights reserved.
//

import UIKit
extension UIImage
{
    /// placeHolder
    class func placeHolderImage() -> UIImage
    {
        return getImageWithColor(color: UIColor.groupTableViewBackground)
    }
    
    /// 将颜色转换为图片
    class func getImageWithColor(color:UIColor)->UIImage{
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    /// 颜色生成图片方法(带CGSize)
    class func image(with color: UIColor, size: CGSize) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContext(rect.size)
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.setFillColor(color.cgColor)
        context.fill(rect)
        let img: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return img
    }
}
