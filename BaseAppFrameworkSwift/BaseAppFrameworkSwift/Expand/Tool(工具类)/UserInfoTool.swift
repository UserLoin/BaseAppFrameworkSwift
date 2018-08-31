//
//  UserInfoTool.swift
//  BaseAppFrameworkSwift
//
//  Created by Simple_Code on 2018/8/31.
//  Copyright © 2018年 AnyApp. All rights reserved.
//

import UIKit
import YYKit

let UserInfoManager = UserInfoTool.shareTools

//MARK: -
class UserInfoTool: NSObject {
    
    var userCache = YYCache(name: "app.userInfo")
    var userModel: UserInfoModel {
        // 计算属性
        let temDic = (userCache?.object(forKey: "userInfo") as! [String : AnyObject])
        return UserInfoModel(dict: temDic)
    }

    ///单例
    static let shareTools: UserInfoTool = {
        let tools = UserInfoTool()
        return tools
    }()
    
    ///存储字典
    func update(userInfo: [String: AnyObject]) {
        userCache?.setObject((userInfo as NSCoding), forKey: "userInfo")
    }
    
    /// 更新Value
    func updateValue(value: AnyObject, key: String) {
        var temDic = (userCache?.object(forKey: "userInfo") as! [String : AnyObject])
        temDic[key] = value
        update(userInfo: temDic)
    }
}

//MARK: -
class UserInfoModel: NSObject {
    
    //MARK: -属性列表
    @objc var name: String?
    @objc var age: Int = 0
    @objc var height: Float = 0.0
    
    //MARK: -字典转模型
    init(dict: [String: AnyObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}

