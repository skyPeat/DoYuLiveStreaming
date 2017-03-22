//
//  SP_NormalCell.swift
//  DoYuLiveStreaming
//
//  Created by tianfeng pan on 17/3/23.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

import UIKit

class SP_NormalCell: UICollectionViewCell {
//    设置属性
    @IBOutlet weak var normalImageView: UIImageView!
    @IBOutlet weak var attentionCount: UIButton!
    @IBOutlet weak var name: UIButton!
    @IBOutlet weak var describeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
