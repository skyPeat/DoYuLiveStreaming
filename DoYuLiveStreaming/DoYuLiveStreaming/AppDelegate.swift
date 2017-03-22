//
//  AppDelegate.swift
//  DoYuLiveStreaming
//
//  Created by tianfeng pan on 17/3/22.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        //       0、设置窗口根控制器
        setUpRootViewController()
        
        return true
    }
//MARK:- 设置窗口根控制器
    func setUpRootViewController(){
//        0、创建窗口
        window = UIWindow(frame: SP_ScreenBounds)
//        1、设置窗口根控制器
        window?.rootViewController = SPTabBarController()
//        2、显示窗口
        window?.makeKeyAndVisible()
    }
    
}

