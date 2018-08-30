//
//  Const.swift
//  YiYuanDuoBao
//
//  Created by 咖达 on 2017/8/18.
//  Copyright © 2017年 咖达. All rights reserved.
//

import UIKit
import SwiftyJSON

/// 宽高
let ScreenWidth = UIScreen.main.bounds.size.width
let ScreenHeight = UIScreen.main.bounds.size.height

/// 圆角及边框
func viewRadius(_ view:UIView, _ radio:Float, _ width:Float, _ color:UIColor) {
    view.layer.cornerRadius = CGFloat(radio)
    view.layer.masksToBounds = true
    view.layer.borderWidth = CGFloat(width)
    view.layer.borderColor = color.cgColor
    //启光栅化
    view.layer.shouldRasterize = true
    view.layer.rasterizationScale = UIScreen.main.scale
}

enum DBShoppingDetailType {
    case indiana
    case discount
    case latest
}

/// 返回JSON数据
func JsonResponse(_ dict: [String: AnyObject]) -> JSON
{
   return JSON(dict) as JSON
}
