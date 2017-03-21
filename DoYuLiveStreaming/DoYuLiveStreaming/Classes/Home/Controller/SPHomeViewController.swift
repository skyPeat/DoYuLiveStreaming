//
//  SPHomeViewController.swift
//  DoYuLiveStreaming
//
//  Created by tianfeng pan on 17/3/22.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

import UIKit

class SPHomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.groupTableViewBackground
        //设置导航栏
        setUpNavigationBar()

    }
}
//MARK:- 设置导航栏
extension SPHomeViewController : UISearchBarDelegate{
    fileprivate  func setUpNavigationBar(){
        //left
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "logo")?.withRenderingMode(.alwaysOriginal), style:.plain , target: self, action: #selector(leftClick))
        //right
        let gameItem = UIBarButtonItem(image: UIImage(named:"btn_search")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(gameCenter))
        let historyItem = UIBarButtonItem(image: UIImage(named:"Image_my_history_click")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(history))
        navigationItem.rightBarButtonItems = [gameItem,historyItem]
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
