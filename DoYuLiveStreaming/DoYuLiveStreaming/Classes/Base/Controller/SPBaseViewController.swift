//
//  SPBaseViewController.swift
//  DoYuLiveStreaming
//
//  Created by tianfeng pan on 17/3/22.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

import UIKit
private let ID = "cell"
class SPBaseViewController: UIViewController {
    fileprivate lazy var buttonArray = NSMutableArray()
    fileprivate lazy var previueButton = UIButton()
    fileprivate var currentIndex : Int = 0
    fileprivate lazy var collectionView : UICollectionView = {[weak self] in
        //       0、创建流水布局
        let flowLayOut = UICollectionViewFlowLayout()
        flowLayOut.itemSize = SP_ScreenSize
        flowLayOut.scrollDirection = .horizontal
        flowLayOut.minimumLineSpacing = 0
        flowLayOut.minimumInteritemSpacing = 0
        //        1、创建collectionView
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayOut)
        collectionView.isPagingEnabled = true
        collectionView.bounces = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.scrollsToTop = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier:ID )
        return collectionView
        }()
    fileprivate var offsetX : CGFloat = 0
    fileprivate lazy var lineView = UIView()


    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false
        //添加子控制器
        setUpChildViewController()
        //添加collectionView
        view.addSubview(collectionView)
        collectionView.frame = SP_ScreenBounds
        //设置标题栏
        setUpTitleView()
    }

}
//MARK:- 添加子控制器
extension SPBaseViewController : UICollectionViewDataSource,UICollectionViewDelegate {
    //    添加子控制器
    func setUpChildViewController(){

    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childViewControllers.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ID, for: indexPath)
        for view in cell.contentView.subviews{
            view.removeFromSuperview()
        }
        let childVC = childViewControllers[indexPath.item]
        childVC.view.frame = cell.contentView.bounds
        cell.contentView.addSubview(childVC.view)
        return cell
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        currentIndex = Int(scrollView.contentOffset.x / SP_ScreenW + 0.5 )
        titleButtonClick(button: buttonArray[currentIndex] as! UIButton)
    }
}
//MARK:- 设置标题栏
extension SPBaseViewController{

    fileprivate func setUpTitleView(){
        //创建标题栏
        let titleView = UIScrollView(frame: CGRect(x: 0, y: 0, width: SP_ScreenW, height: 35))
        titleView.backgroundColor = UIColor.white
        view .addSubview(titleView)
        //设置标题按钮
        let count = childViewControllers.count
        var buttonX : CGFloat = 0
        let buttonY : CGFloat = 0,buttonW = titleView.frame.width / CGFloat(count),buttonH = titleView.frame.height
        for i in 0..<count {
            buttonX = buttonW * CGFloat(i)
            let titleButton = UIButton(type: .custom)
            titleButton.tag = i
            titleButton.frame = CGRect(x: buttonX, y: buttonY, width: buttonW, height: buttonH)
            titleButton.setTitle(childViewControllers[i].title, for: .normal)
            titleButton.setTitleColor(UIColor.black, for: .normal)
            titleButton.setTitleColor(UIColor.orange, for: .selected)
            titleButton.titleLabel?.textAlignment = .center
            titleButton.addTarget(self, action: #selector(titleButtonClick(button:)), for: .touchUpInside)
            buttonArray.add(titleButton)
            titleView.addSubview(titleButton)
            //添加下划线
            if i == 0 {
                titleButtonClick(button: titleButton)
                let lineX : CGFloat = 0
                let lineH : CGFloat = 1
                let lineY : CGFloat = titleView.frame.height - lineH
                let lineW : CGFloat = buttonW * 0.6
                lineView.frame = CGRect(x: lineX, y: lineY, width: lineW, height: lineH)
                lineView.center.x = titleButton.center.x
                lineView.backgroundColor = UIColor.orange
                titleView.addSubview(lineView)
            }
        }
    }
    func titleButtonClick(button:UIButton){
        previueButton.isSelected = false
        button.isSelected = !button.isSelected
        previueButton = button
        UIView.animate(withDuration: 0.25) { self.lineView.center.x = button.center.x}
        self.collectionView.contentOffset = CGPoint(x: SP_ScreenW * CGFloat(button.tag), y: 0)
    }
    
}
