//
//  SP_CommonExtention.swift
//  DoYuLiveStreaming
//
//  Created by tianfeng pan on 17/3/23.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//
import Foundation
import UIKit
// 便利构造函数: 1> convenience开头 2> 在构造函数中必须明确调用一个设计的构造函数(self)
//MARK:- UIBarButtonItem
extension UIBarButtonItem{
    convenience init(normalImageName : String, otherStateImageName : String = "", size : CGSize = CGSize.zero, target : Any?,action : Selector){
        let button = UIButton()
        button.setImage(UIImage(named:normalImageName), for: .normal)
        if otherStateImageName != "" {
            button.setImage(UIImage(named:otherStateImageName), for: .selected)
            button.setImage(UIImage(named:otherStateImageName), for: .highlighted)
        }
        button.addTarget(target, action: action, for: .touchUpInside)
        if size != CGSize.zero {
            button.frame = CGRect(origin: CGPoint.zero, size: size)
        }else{
            button.sizeToFit()
        }
        self.init(customView: button)
        }
}
extension NSDate{
    //MARK:- 获取时间的秒钟
    class func currentDate() -> String{
        let currentDate = NSDate().timeIntervalSince1970
        return "\(currentDate)"
    }
}
