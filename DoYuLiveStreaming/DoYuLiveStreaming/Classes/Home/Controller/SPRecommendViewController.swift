//
//  SPRecommendViewController.swift
//  DoYuLiveStreaming
//
//  Created by tianfeng pan on 17/3/22.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

import UIKit
private let margin : CGFloat = 5
private let itemW : CGFloat = (SP_ScreenW - margin * 3) * 0.5
private let NitemH : CGFloat = itemW * 0.75
private let LitemH : CGFloat = itemW * 1.4
private let headerH : CGFloat = 49
private let KNormalID = "normalCell"
private let KLvChaBiaoID = "lvChaBiaoCell"
private let KheaderID = "headerID"
class SPRecommendViewController: UIViewController {
//    定义属性

//    懒加载collectionView属性
     lazy var collectionView : UICollectionView = {
//        0、创建流水布局
        let flowLayOut = UICollectionViewFlowLayout()
        flowLayOut.itemSize = CGSize(width: itemW, height: NitemH)
        flowLayOut.minimumLineSpacing = 0
        flowLayOut.minimumInteritemSpacing = margin
        flowLayOut.sectionInset = UIEdgeInsetsMake(0, margin, 0, margin)
        flowLayOut.headerReferenceSize = CGSize(width: SP_ScreenW, height: headerH)
//        1、创建collectionView
        let collectionView = UICollectionView(frame: SP_ScreenBounds , collectionViewLayout: flowLayOut)
        collectionView.backgroundColor = UIColor.white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib.init(nibName: "SP_NormalCell", bundle: nil), forCellWithReuseIdentifier: KNormalID)
        collectionView.register(UINib.init(nibName: "SP_LvChaBiaoCell", bundle: nil), forCellWithReuseIdentifier: KLvChaBiaoID)
        collectionView.register(UINib.init(nibName: "SP_HeaderReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: KheaderID)
        collectionView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        return collectionView
    }()
//    系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false
//    添加轮播图
//    添加工具栏
//    添加collectionView
        setUpCollectionView()
    }
    
}
extension SPRecommendViewController{

}
extension SPRecommendViewController{

}
extension SPRecommendViewController : UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate{
    func setUpCollectionView(){
        view.addSubview(collectionView)
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 12
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
              return 8
        }
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell : UICollectionViewCell!
        if indexPath.section == 2 {
             cell = collectionView.dequeueReusableCell(withReuseIdentifier: KLvChaBiaoID, for: indexPath)
        }else{
             cell = collectionView.dequeueReusableCell(withReuseIdentifier: KNormalID, for: indexPath)
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: KheaderID, for: indexPath)
        return headerView
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        if indexPath.section == 2 {
            return CGSize(width: itemW, height: LitemH)
        }else{
            return CGSize(width: itemW, height: NitemH)
        }
    }
}
