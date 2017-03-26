//
//  SP_RecommendViewModel.swift
//  DoYuLiveStreaming
//
//  Created by tianfeng pan on 17/3/24.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

import UIKit
/*
 #pragma mark- 接口名称：顶部轮播数据
 接口地址：http://www.douyutv.com/api/v1/slide/6
 请求参数：</br>
 参数名称	参数说明
 version	当前版本号：2.300


 #pragma mark- 接口名称：大数据数据（第一组热门数据）
 接口地址：http://capi.douyucdn.cn/api/v1/getbigDataRoom
 请求参数：</br>
 参数名称	参数说明
 time	获取当前时间的字符串

 */
class SP_RecommendViewModel{
    lazy var groupModel : [SP_GroupModel] = [SP_GroupModel]()
    lazy var bigDataRoomGroup : SP_GroupModel = SP_GroupModel()
    lazy var VerticalRoomGroup : SP_GroupModel = SP_GroupModel()
}
//MARK:- 发送网络请求
extension SP_RecommendViewModel{
    func requestData(finishedCallBack:@escaping () -> ()){
        //        定义参数
        let parameters : [String : Any] = ["time":NSDate.currentDate(),"limit":4,"offset":0]
        let dispatchGroup = DispatchGroup()
        //        0、请求第一组数据
        dispatchGroup.enter()
        SP_NetWorkingTool.request(type: .get, urlString: SP_MainUrl.appending("bigDataRoom"), parameters: ["time":NSDate.currentDate()]) { (result) in
            //            0、获取请求的数据
            guard let resultDict = result as? [String : NSObject] else{return}
            guard let resultArray = resultDict["data"] as? [[String : NSObject]] else {return}
            //            1、字典数组转模型数组
            self.bigDataRoomGroup.tag_name = "热门"
            self.bigDataRoomGroup.icon_name = "home_header_hot"
            for dict in resultArray{
                let anchor = SP_AnchorModel(dict: dict)
                self.bigDataRoomGroup.anchorModels.append(anchor)
            }
            dispatchGroup.leave()
        }

        //        1、请求第二组数据
        dispatchGroup.enter()
        SP_NetWorkingTool.request(type: .get, urlString: SP_MainUrl.appending("VerticalRoom"), parameters: parameters) { (result) in
            //            0、获取请求的数据
            guard let resultDict = result as? [String : NSObject] else{return}
            guard let resultArray = resultDict["data"] as? [[String : NSObject]] else {return}
            //            1、字典数组转模型数组
            self.VerticalRoomGroup.tag_name = "颜值"
            self.VerticalRoomGroup.icon_name = "lvChaBiao"
            for dict in resultArray{
                let anchor = SP_AnchorModel(dict: dict)
                self.VerticalRoomGroup.anchorModels.append(anchor)
            }
             dispatchGroup.leave()
        }
        //        2、请求后面的数据
        dispatchGroup.enter()
        SP_NetWorkingTool.request(type: .get, urlString: SP_MainUrl.appending("HotCate"), parameters: parameters) { (result) in
            //            0、获取请求的数据
            guard let resultDict = result as? [String : NSObject] else{return}
            guard let resultArray = resultDict["data"] as? [[String : NSObject]] else {return}
            //            1、字典数组转模型数组
            for dict in resultArray {
                let groupModel = SP_GroupModel(dict: dict)
                self.groupModel.append(groupModel)
            }
             dispatchGroup.leave()
        }
       dispatchGroup.notify(queue: DispatchQueue.main) {
        self.groupModel.insert(self.VerticalRoomGroup, at: 0)
        self.groupModel.insert(self.bigDataRoomGroup, at: 0)
        finishedCallBack()
        }
    }
}
