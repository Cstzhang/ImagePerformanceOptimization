//
//  ViewController.swift
//  ImagePerformanceOptimization
//
//  Created by zhangzb on 2017/11/2.
//  Copyright © 2017年 zhangzb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let iv  = UIImageView(frame: CGRect(x: 0, y: 0, width: 160, height: 160))
        
        iv.center = view.center
        
        view.addSubview(iv)
        
        iv.image = #imageLiteral(resourceName: "icon.png")
        
        
        
    }
   

}

