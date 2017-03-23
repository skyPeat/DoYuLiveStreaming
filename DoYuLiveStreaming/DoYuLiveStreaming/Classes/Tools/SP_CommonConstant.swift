//
//  SP_CommonConstant.swift
//  DoYuLiveStreaming
//
//  Created by tianfeng pan on 17/3/23.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

import UIKit

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
//随机色
let SP_RandomColor = UIColor(red: CGFloat(arc4random_uniform(255)) / 255.0, green: CGFloat(arc4random_uniform(255)) / 255.0, blue: CGFloat(arc4random_uniform(255)) / 255.0, alpha: 1.0)
//url
let SP_MainUrl = "http://capi.douyucdn.cn/api/v1/get"
