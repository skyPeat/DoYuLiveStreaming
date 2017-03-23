//
//  SPHomeViewController.swift
//  DoYuLiveStreaming
//
//  Created by tianfeng pan on 17/3/22.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

import UIKit

//MARK:- 定义常量
private let ID = "cell"
class SPHomeViewController: UIViewController { 
    //MARK:- 懒加载属性
    fileprivate lazy var titleView : SP_CommonTitleView = {[weak self] in
        let titleFrame = CGRect(x: 0, y: 0, width: SP_ScreenW, height: 40)
        let titleArray = ["推荐","手游","娱乐","游戏","趣玩"]
        let titleView = SP_CommonTitleView(frame: titleFrame, titles: titleArray)
        titleView.backgroundColor = UIColor.white
        titleView.delegate = self
        return titleView
    }()
    fileprivate lazy var contentView : SP_CommonContentView = {[weak self] in
        let contentFrame = CGRect(x: 0, y: (self?.titleView.frame.maxY)!, width: SP_ScreenW, height: SP_ScreenH - (self?.titleView.frame.maxY)! - SP_TabBarH)
        var childVCs = [UIViewController]()
        childVCs.append(SPRecommendViewController())
        childVCs.append(SPHandGameViewController())
        childVCs.append(SPRecreationViewController())
        childVCs.append(SPGameViewController())
        childVCs.append(SPFunPlayViewController())
        let contentView = SP_CommonContentView(frame: contentFrame, childVCs: childVCs, parentVC: self)
        contentView.delegate = self
        return contentView
    }()
       //MARK:- 定义属性
    override func viewDidLoad() {
        super.viewDidLoad()
        //        0、设置导航栏
        setUpNavigationBar()
        //        1、设置UI界面
        setUpUIView()
    }

}
//MARK:- 设置导航栏
extension SPHomeViewController : UISearchBarDelegate{
    fileprivate  func setUpNavigationBar(){
        //left
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(normalImageName: "logo", target: self, action: #selector(leftClick))
        //right
        let gameItem = UIBarButtonItem.init(normalImageName: "btn_search", target: self, action: #selector(gameCenter))
        let historyItem = UIBarButtonItem.init(normalImageName: "Image_my_history_click", target: self, action: #selector(history))
        navigationItem.rightBarButtonItems = [historyItem,gameItem]
        //title
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width * 0.5, height: 30))
        titleView.layer.cornerRadius = 5;
        //        searchBar
        let searchView = UISearchBar(frame: CGRect(x: 0, y: 5, width: titleView.bounds.width * 0.7, height: 20))
        searchView.placeholder = "斗鱼斗鱼"
        searchView.delegate = self
        titleView.addSubview(searchView)
        //调用相机的按钮
        let camaraButton = UIButton(type: .custom)
        camaraButton.frame = CGRect(x: titleView.bounds.width * 0.7 + 10, y: 5, width: titleView.bounds.width * 0.15, height: 20)
        camaraButton.setImage(UIImage(named: "Image_scan"), for: .normal)
        camaraButton.addTarget(self, action: #selector(cameraButtonClick), for: .touchUpInside)
        titleView.addSubview(camaraButton)
        titleView.backgroundColor = UIColor.white
        navigationItem.titleView = titleView
    }
    func leftClick(){
        print("aaaa")
    }
    func gameCenter(){
        print("bbbb")
    }
    func history(){
        print("cccc")
    }
    func cameraButtonClick(){
        print("cameraButtonClick")
    }


}
//MARK:- 设置UI界面
extension SPHomeViewController{
    fileprivate func setUpUIView(){
//        设置标题栏
        view.addSubview(titleView)
//        设置内容界面
        view.addSubview(contentView)
    }
}
//MARK:- 实现代理方法
extension SPHomeViewController : SP_CommonTitleViewDelegate,SP_CommonContentViewDelegate{
    func sp_CommonTitleView(_ titleView: SP_CommonTitleView, index: Int) {
       contentView.setCurrentIndex(index)
    }
    func sp_CommonContentView(_ contentView: SP_CommonContentView, currentIndex: Int) {
        titleView.setCurrentIndex(currentIndex)
    }

}

