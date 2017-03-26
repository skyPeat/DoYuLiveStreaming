//
//  SP_GroupModel.swift
//  DoYuLiveStreaming
//
//  Created by tianfeng pan on 17/3/25.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

import UIKit

class SP_GroupModel: NSObject {
    //组对应的信息
    var room_list : [[String : NSObject]]? {
        didSet {
            guard let room_list = room_list else {return}
            for dict in room_list{
                anchorModels.append(SP_AnchorModel(dict: dict))
            }
        }
    }
    //组显示的标题
    var tag_name : String?
    //图标
    var icon_name : String?
    //主播模型对应的数组
    lazy var anchorModels : [SP_AnchorModel] = [SP_AnchorModel]()
    //字典转模型
    override init() {

    }
    init(dict : [String : NSObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {

    }

//    override func setValue(_ value: Any?, forKey key: String) {
//        if key == "room_list"{
//            if let dataArray =  value as? [[String : NSObject]] {
//                for dict in dataArray {
//                    anchorModels.append(SP_AnchorModel(dict: dict))
//                }
//            }
//        }
//    }

}
