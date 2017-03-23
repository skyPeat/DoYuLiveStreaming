//
//  SP_CommonContentView.swift
//  DoYuLiveStreaming
//
//  Created by tianfeng pan on 17/3/24.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

import UIKit
//MARK:- 定义协议
protocol SP_CommonContentViewDelegate : class {
    func sp_CommonContentView(_ contentView : SP_CommonContentView,currentIndex : Int)
}
//MARK:- 定义常量
private let contentID = "contentCell"
class SP_CommonContentView: UIView {
    //MARK:- 定义属性
    fileprivate var childVCs : [UIViewController]
    fileprivate weak var parentVC : UIViewController?
    //MARK:- 懒加载属性
    fileprivate lazy var collectionView : UICollectionView = {[weak self] in
//        0、创建流水布局
        let flowLayOut = UICollectionViewFlowLayout()
        flowLayOut.itemSize = (self?.bounds.size)!
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
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier:contentID )
        return collectionView
    }()
    //MARK:- 设置代理属性
    weak var delegate : SP_CommonContentViewDelegate?
    //MARK:- 自定义构造函数
    init(frame: CGRect, childVCs : [UIViewController],parentVC : UIViewController?) {
        self.childVCs = childVCs
        self.parentVC = parentVC
        super.init(frame: frame)
        //        设置UI界面
        setUpUIView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension SP_CommonContentView{
    fileprivate func setUpUIView(){
//        0、添加子控制器
        for childVC in childVCs{
            parentVC?.addChildViewController(childVC)
        }
//        1、添加collectionView
        addSubview(collectionView)
        collectionView.frame = bounds
    }
}
//MARK:- 实现collectionView的数据源代理方法
extension SP_CommonContentView : UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childVCs.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: contentID, for: indexPath)
        //防止多次添加
        for view in cell.contentView.subviews{
            view.removeFromSuperview()
        }
        let childVC = childVCs[indexPath.item]
        childVC.view.frame = bounds
        cell.contentView.addSubview(childVC.view)
        return cell
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentIndex = Int(scrollView.contentOffset.x / SP_ScreenW + 0.5 )
        delegate?.sp_CommonContentView(self, currentIndex: currentIndex)
    }
}
//MARK:- 对外暴露方法
extension SP_CommonContentView{
    func setCurrentIndex(_ currentIndex : Int){
        let offsetX = collectionView.bounds.width * CGFloat(currentIndex)
        collectionView.contentOffset = CGPoint(x: offsetX, y: 0)
    }
}
