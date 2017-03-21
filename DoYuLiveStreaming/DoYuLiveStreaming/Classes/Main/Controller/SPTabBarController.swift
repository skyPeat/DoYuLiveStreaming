//
//  SPTabBarController.swift
//  DoYuLiveStreaming
//
//  Created by tianfeng pan on 17/3/22.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

import UIKit

class SPTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //        0、添加子控制器
        setUpChildViewControllers()


    }


}
//MARK:-  添加子控制器
extension SPTabBarController{
  fileprivate func setUpChildViewControllers(){
        addChildViewControllers(viewController: SPHomeViewController(),title: "首页", normalImageName: "tabHome", selectedImageName: "tabHomeHL")
        addChildViewControllers(viewController: SPLiveViewController(),title: "直播", normalImageName: "tabLiving", selectedImageName: "tabLivingHL")
        addChildViewControllers(viewController: SPAttentionViewController(),title: "关注", normalImageName: "tabFocus", selectedImageName: "tabFocusHL")
        addChildViewControllers(viewController: SPDiscoverViewController(),title: "发现", normalImageName: "tabDiscovery", selectedImageName: "tabDiscoveryHL")
        addChildViewControllers(viewController: SPMineViewController(),title: "我的", normalImageName: "tabMine", selectedImageName: "tabMineHL")
    }
   private func addChildViewControllers(viewController:UIViewController,title:String,normalImageName:String,selectedImageName:String){
        viewController.title = title
        viewController.tabBarItem.image = UIImage(named: normalImageName)
        viewController.tabBarItem.selectedImage = UIImage(named: selectedImageName)?.withRenderingMode(.alwaysOriginal)
        UITabBar.appearance().tintColor = UIColor.orange
        addChildViewController(SPNavigationController(rootViewController: viewController))
    }
    
}
