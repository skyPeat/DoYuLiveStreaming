//
//  SP_Commom.swift
//  DoYuLiveStreaming
//
//  Created by tianfeng pan on 17/3/22.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

import UIKit
             /*颜色*/
// 随机色
let SP_RandomColor = UIColor.init(red: CGFloat(arc4random_uniform(255))/CGFloat(255.0), green: CGFloat(arc4random_uniform(255))/CGFloat(255.0), blue: CGFloat(arc4random_uniform(255))/CGFloat(255.0), alpha: 1.0)
//自定义颜色
func SP_Color(r:CGFloat,g : CGFloat, b : CGFloat,alpha : CGFloat) -> UIColor{
    let color = UIColor.init(red: r, green: g, blue: b, alpha: alpha)
    return color
}
func SP_Color(r:CGFloat,g : CGFloat, b : CGFloat) -> UIColor{
    let color = UIColor.init(red: r, green: g, blue: b, alpha:1.0)
    return color
}

           /*常用的尺寸*/
//屏幕的尺寸
let SP_ScreenBounds  = UIScreen.main.bounds
//屏幕的大小
let SP_ScreenSize = UIScreen.main.bounds.size
//屏幕的宽度
let SP_ScreenW = UIScreen.main.bounds.width
//屏幕的高度
let SP_ScreenH = UIScreen.main.bounds.height
//statusBar的高度
let SP_StatusBarH : CGFloat = 20
//导航条的高度
let SP_NavigationBarH : CGFloat = 44
//导航栏显示的高度
let SP_TopH : CGFloat = 64
//tabBar的高度
let SP_TabBarH : CGFloat = 49

//url
let sp_MainUrl = ""

/*常用的方法*/
extension UIImage{
//    设置一张不被渲染的图片
    func originalImage(imageName : String?) -> UIImage{
        guard let imageName = imageName else {
            return UIImage(named:"")!
        }
        return UIImage(named:imageName)!.withRenderingMode(.alwaysOriginal)
    }
}
