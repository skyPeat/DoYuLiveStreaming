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
    lazy var recommendVM : SP_RecommendViewModel = SP_RecommendViewModel()
//    系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false
//    添加轮播图
//    添加工具栏
//    添加collectionView
        setUpCollectionView()
//    请求数据
        recommendVM.requestData{
            self.collectionView.reloadData()
        }
    }
}
//MARK:- 遵守协议，实现协议方法
extension SPRecommendViewController : UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate{
    func setUpCollectionView(){
        view.addSubview(collectionView)
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return recommendVM.groupModel.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recommendVM.groupModel[section].anchorModels.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let anchorModel = recommendVM.groupModel[indexPath.section].anchorModels[indexPath.item]
        if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KLvChaBiaoID, for: indexPath) as! SP_LvChaBiaoCell
            cell.group = anchorModel
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KNormalID, for: indexPath) as! SP_NormalCell
            cell.group = anchorModel
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: KheaderID, for: indexPath) as! SP_HeaderReusableView
        headerView.group = recommendVM.groupModel[indexPath.section]
        return headerView
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        if indexPath.section == 1 {
            return CGSize(width: itemW, height: LitemH)
        }else{
            return CGSize(width: itemW, height: NitemH)
        }
    }
}

