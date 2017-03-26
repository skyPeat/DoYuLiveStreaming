//
//  SP_LvChaBiaoCell.swift
//  DoYuLiveStreaming
//
//  Created by tianfeng pan on 17/3/23.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

import UIKit
import Kingfisher
class SP_LvChaBiaoCell: UICollectionViewCell {
//    设置属性
    @IBOutlet weak var lvChaBiaoImageView: UIImageView!
    @IBOutlet weak var attentionCount: UIButton!
    @IBOutlet weak var location: UIButton!
    @IBOutlet weak var name: UIButton!

    var group : SP_AnchorModel?{
        didSet{

            //            在线人数
            guard let group = group else{return}
            var onlineStr = ""
            if group.online >= 10000 {
                onlineStr = "\(Double(group.online) / 10000.0)万人在线"
            }else{
                onlineStr = "\(group.online)人在线"
            }
            attentionCount.setTitle(onlineStr, for: .normal)
            name.setTitle(group.nickname, for: .normal)
            location.setTitle(group.anchor_city, for: .normal)
            guard let iconUrl = URL(string: group.vertical_src) else {return}
            lvChaBiaoImageView.kf.setImage(with: iconUrl)
        }
    }


}
