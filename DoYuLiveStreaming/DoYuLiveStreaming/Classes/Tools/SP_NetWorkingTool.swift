//
//  SP_NetWorkingTool.swift
//  DoYuLiveStreaming
//
//  Created by tianfeng pan on 17/3/23.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

import UIKit
import Alamofire
enum requestType {
    case get
    case post
}
class SP_NetWorkingTool {
    class func request(type : requestType,urlString : String,parameters : [String : Any]? = nil,finishedCallBack : @escaping (_ result : Any) -> ()){
        //        0、获取请求类型
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        //        1、发送网络请求
        Alamofire.request(urlString, method: method, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            // 3.获取结果
            guard let result = response.result.value else {
                print(response.result.error!)
                return
            }
            // 4.将结果回调出去
            finishedCallBack(result)

        }
    }
}
