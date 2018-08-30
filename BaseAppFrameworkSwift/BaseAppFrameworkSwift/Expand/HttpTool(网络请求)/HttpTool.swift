//
//  HttpTool.swift
//  BaseAppFrameworkSwift
//
//  Created by Simple_Code on 2018/8/30.
//  Copyright © 2018年 AnyApp. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

///枚举类型
enum MethodType {
    case GET
    case POST
}

class HttpTool: NSObject {
    
    ///单例
    static let shareTools: HttpTool = {
        let tools = HttpTool()
        return tools
    }()
    
    /// GET POST 方法
    func request(methodType: MethodType,
                 urlString: String,
                 parameters: [String:Any]? = nil,
                 finishdCallBack: @escaping ( _ responseObject:AnyObject?, _ error: Error?) -> ()){
        
        let method = methodType == .GET ? HTTPMethod.get : HTTPMethod.post;
        Alamofire.request(urlString, method: method, parameters: parameters).responseJSON { (response) in
            
            if response.result.isSuccess {
                // print(JsonResponse(response.result.value as! [String : AnyObject]))
                finishdCallBack(response.result.value as AnyObject ,nil)
            } else {
                finishdCallBack(nil,response.result.error)
            }
        }
    }
}
