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
    class func request(type : requestType,urlString : String,parameters : [String : Any]? = nil,finish : @escaping (_ result : Any) -> ()){

//        0、获取请求类型
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
//        1、发送网络请求
        Alamofire.request(urlString, method: method, parameters: parameters).responseJSON { (response) in
//        2、获取请求结果
            guard let result = response.result.value else {
                print(response.result.error!)
                return
            }
//        3、回调数据
            finish(result as AnyObject)
        }
    }
//    func aa(){
//      Alamofire.request(URLConvertible, method: <#T##HTTPMethod#>, parameters: <#T##Parameters?#>, encoding: <#T##ParameterEncoding#>, headers: nil)
////        public func request(method: Method, URLString: URLStringConvertible, parameters: [String: AnyObject]? = nil, encoding: ParameterEncoding = .URL, headers: [String: String]? = nil) -> Request {
////            return Manager.sharedInstance.request(method, URLString, parameters: parameters, encoding: encoding, headers: headers)
////        }
//    }
}
