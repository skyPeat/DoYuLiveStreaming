//
//  SP_CommonTitleView.swift
//  DoYuLiveStreaming
//
//  Created by tianfeng pan on 17/3/23.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

import UIKit
//MARK:- 定义协议
protocol SP_CommonTitleViewDelegate : class {
    func sp_CommonTitleView(_ titleView : SP_CommonTitleView, index : Int)
}
class SP_CommonTitleView: UIView {
    //MARK:- 定义属性
    fileprivate var titles : [String]
    var previouButton = UIButton()
    var buttonArray = [UIButton]()
    //MARK:- 懒加载属性
    fileprivate lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = false
        return scrollView
    }()
    lazy var titleButton = [UIButton]()
    fileprivate lazy var slideLine : UIView = {
        let slideLine = UIView()
        slideLine.backgroundColor = UIColor.orange
        return slideLine
    }()
    //    设置代理属性
    weak var delegate : SP_CommonTitleViewDelegate?


    //MARK:- 自定义构造函数
    init(frame : CGRect,titles : [String]) {
        self.titles = titles
        super.init(frame: frame)
        //        设置UI界面
        setUpUIView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
//MARK:- 设置UI界面
extension SP_CommonTitleView{
    fileprivate func setUpUIView(){
        //        添加scrollView
        addSubview(scrollView)
        scrollView.frame = bounds

        //        添加titleButton
        let titleY : CGFloat = 0
        let titleW : CGFloat = frame.width / CGFloat(titles.count)
        let titleH : CGFloat = frame.height
        for (index,title) in titles.enumerated() {
            let titleX = titleW * CGFloat(index)
            let titleButton = UIButton()
            titleButton.tag = index
            titleButton.frame = CGRect(x: titleX, y: titleY, width: titleW, height: titleH)
            titleButton.setTitleColor(UIColor.black, for: .normal)
            titleButton.setTitleColor(UIColor.orange, for: .selected)
            titleButton.setTitle(title, for: .normal)
            titleButton.addTarget(self, action: #selector(titleButtonClick(button:)), for: .touchUpInside)
            buttonArray.append(titleButton)
            scrollView.addSubview(titleButton)
            //    添加slideLine
            if index == 0 {
                titleButtonClick(button: titleButton)
                let lineX : CGFloat = 0
                let lineH : CGFloat = 1
                let lineY : CGFloat = frame.height - lineH
                let lineW : CGFloat = titleW * 0.8
                slideLine.frame = CGRect(x: lineX, y: lineY, width: lineW, height: lineH)
                slideLine.center.x = titleButton.center.x
                slideLine.backgroundColor = UIColor.orange
                addSubview(slideLine)
            }

        }
    }

    //MARK:- 监听按钮点击
    func titleButtonClick(button : UIButton){
        previouButton.isSelected = false
        button.isSelected = !button.isSelected
        previouButton = button
        //点击按钮时，下划线跟着滑动
        UIView.animate(withDuration: 0.2) {self.slideLine.center.x = button.center.x}
        // 回调代理方法
        delegate?.sp_CommonTitleView(self,index: button.tag)
    }
}
//MARK:- 对外暴露方法
extension SP_CommonTitleView{
    func setCurrentIndex(_ currentIndex : Int){
        titleButtonClick(button: buttonArray[currentIndex])
    }
}
