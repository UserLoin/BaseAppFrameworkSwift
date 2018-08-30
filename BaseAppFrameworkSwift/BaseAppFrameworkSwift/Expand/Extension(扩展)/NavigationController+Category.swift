//
//  NavigationController+Category.swift
//  YiYuanDuoBao
//
//  Created by 咖达 on 2017/8/22.
//  Copyright © 2017年 咖达. All rights reserved.
//

import UIKit
extension UINavigationController
{
    
    /// 设置NavigationBar透明
    ///
    /// - Parameter isTransparent: 是否透明
    func setNavigationBarTransparent(_ isTransparent: Bool ,_ titleColor: UIColor? = UIColor.black)
    {
        if isTransparent {
            // 1.设置导航栏标题属性：设置标题颜色
            navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:titleColor ?? UIColor.black]
            // 2.设置导航栏前景色：设置item指示色
            navigationBar.tintColor = UIColor.black
            // 3.设置导航栏半透明
            navigationBar.isTranslucent = true
            // 4.设置导航栏背景图片
            navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
            // 5.设置导航栏阴影图片
            navigationBar.shadowImage = UIImage()
        }
        else
        {
            // 1.设置导航栏标题属性：设置标题颜色
            navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.black]
            // 2.设置导航栏前景色：设置item指示色
            navigationBar.tintColor = UIColor.black
            // 3.设置导航栏半透明
            navigationBar.isTranslucent = false
            // 4.设置导航栏背景图片
            navigationBar.setBackgroundImage(nil, for: UIBarMetrics.default)
            // 5.设置导航栏阴影图片
            navigationBar.shadowImage = nil
        }
    }
}
