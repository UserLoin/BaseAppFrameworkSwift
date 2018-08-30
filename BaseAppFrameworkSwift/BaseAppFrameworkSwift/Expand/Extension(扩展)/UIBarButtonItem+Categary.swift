//
//  UIBarButtonItem+Categary.swift
//  WeiBo
//
//  Created by 咖达 on 2017/7/19.
//  Copyright © 2017年 咖达. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
    
    /// 自定义左边的返回按钮
    class func createLeftBackBarItem(imageName: String,target: AnyObject?,action: Selector) -> UIBarButtonItem{
        //左上角
        let backButton = UIButton.init(type: UIButtonType.custom)
        backButton.setImage(UIImage(named:imageName), for: UIControlState.normal)
        backButton.setImage(UIImage(named:imageName), for: UIControlState.highlighted)
        backButton.setTitleColor(UIColor.black, for: UIControlState.normal)
        backButton.setTitleColor(UIColor.red, for: UIControlState.highlighted)
        backButton.sizeToFit()
        
        // 这句代码放在sizeToFit后面
        backButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: -15, bottom: 0, right: 0)
        backButton.addTarget(target, action: action, for: UIControlEvents.touchUpInside)
        return UIBarButtonItem(customView: backButton)
    }
    
    /// 如果func前面加上class，就相当于OC中的+（类方法）
    class func createBarItem(imageName: String,target: AnyObject?,action: Selector) -> UIBarButtonItem
    {
        let btn = UIButton()
        btn.setImage(UIImage(named: imageName), for: UIControlState.normal)
        btn.setImage(UIImage(named: imageName + "_highlighted"), for: UIControlState.highlighted)
        btn.sizeToFit()
        btn.addTarget(target, action: action, for: UIControlEvents.touchUpInside)
        return UIBarButtonItem(customView: btn)
    }
    
    
    /// 初始化方法
    convenience init(imageName: String,target: AnyObject?, action: Selector) {
        let btn = UIButton()
        btn.setImage(UIImage(named: imageName), for: UIControlState.normal)
        btn.setImage(UIImage(named: imageName + "_highlighted"), for: UIControlState.highlighted)
        btn.sizeToFit()
        btn.addTarget(target, action: action, for: UIControlEvents.touchUpInside)
        self.init(customView: btn)
    }
}
