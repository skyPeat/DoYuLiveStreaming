//
//  SP_HeaderReusableView.swift
//  DoYuLiveStreaming
//
//  Created by tianfeng pan on 17/3/23.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

import UIKit

class SP_HeaderReusableView: UICollectionReusableView {
//    设置属性
    @IBOutlet weak var titleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var moreButton: UIButton!
    var group : SP_GroupModel?{
        didSet{
            titleImageView.image = UIImage(named: group?.icon_name ?? "home_header_normal")
            titleLabel.text = group?.tag_name
        }
    }
}
