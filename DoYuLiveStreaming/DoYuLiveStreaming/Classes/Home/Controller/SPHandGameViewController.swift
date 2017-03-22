//
//  SPHandGameViewController.swift
//  DoYuLiveStreaming
//
//  Created by tianfeng pan on 17/3/22.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

import UIKit

class SPHandGameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let bview = UIView(frame: CGRect(x: 50, y: 100, width: 200, height: 200))
        bview.backgroundColor = UIColor.white
        view.addSubview(bview)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
