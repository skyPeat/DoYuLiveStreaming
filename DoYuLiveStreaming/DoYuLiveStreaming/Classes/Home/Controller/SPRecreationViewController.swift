//
//  SPRecreationViewController.swift
//  DoYuLiveStreaming
//
//  Created by tianfeng pan on 17/3/22.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

import UIKit

class SPRecreationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let bview = UIView(frame: CGRect(x: 50, y: 100, width: 200, height: 200))
        bview.backgroundColor = UIColor.cyan
        view.addSubview(bview)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
