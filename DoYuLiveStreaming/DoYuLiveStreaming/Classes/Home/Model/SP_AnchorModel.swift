//
//  SP_AnchorModel.swift
//  DoYuLiveStreaming
//
//  Created by tianfeng pan on 17/3/25.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

import UIKit

class SP_AnchorModel: NSObject {
    //房间的ID
    var room_id : Int = 0
    //房间显示图片的url
    var vertical_src : String = ""
    //判读是手机直播还是电脑直播
    var isVertical : Int = 0
    //主播昵称
    var nickname : String = ""
    //房间名字
    var room_name : String = ""
    //在线人数
    var online : Int = 0
    //位置
    var anchor_city : String = ""
    //字典转模型
    init(dict : [String : NSObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
