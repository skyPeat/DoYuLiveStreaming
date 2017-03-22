//
//  SPLiveViewController.swift
//  DoYuLiveStreaming
//
//  Created by tianfeng pan on 17/3/22.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

import UIKit

class SPLiveViewController: SPBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
extension SPLiveViewController{
    //    添加子控制器
    override func setUpChildViewController(){
        //recommend(推荐)
        let recommendVC = SPRecommendViewController()
        recommendVC.title = "推荐"
        addChildViewController(recommendVC)
        //handGame(手游)
        let handGameVC = SPHandGameViewController()
        handGameVC.title = "手游"
        addChildViewController(handGameVC)
        //recreation(娱乐)
        let recreationVC = SPRecreationViewController()
        recreationVC.title = "娱乐"
        addChildViewController(recreationVC)
        //game(游戏)
        let gameVC = SPGameViewController()
        gameVC.title = "游戏"
        addChildViewController(gameVC)
        //funPlay(趣玩)
        let funPlayVC = SPFunPlayViewController()
        funPlayVC.title = "趣玩"
        addChildViewController(funPlayVC)
    }

}
