//
//  HttpConst.swift
//  YiYuanDuoBao
//
//  Created by 咖达 on 2017/8/23.
//  Copyright © 2017年 咖达. All rights reserved.
//

import UIKit

/**主Api*/
let MainApi = "http://112.74.43.177:8080/jjs-mobile/"
let MainImageViewApi = "http://112.74.43.177:8080/jjs-mobile/"
let Token = "APPToken"

//MARK: - 登录注册模块接口
/// 登录
let loginApi = MainApi + "login.do"
/// 退出
let loginOutApi = MainApi + "logout.do"

//MARK: - 夺宝模块接口
/// 夺宝接口
let showHotLottery = MainApi + "showHotLottery.do"
/// 夺宝商品详情接口
let lotteryDetailInfo = MainApi + "lotteryDetailInfo.do"

//MARK: - 折扣商城模块接口
let showDiscountProductsApi = MainApi + "showDiscountProducts.do"

//MARK: - 最新揭晓模块接口


//MARK: - 我的模块接口
