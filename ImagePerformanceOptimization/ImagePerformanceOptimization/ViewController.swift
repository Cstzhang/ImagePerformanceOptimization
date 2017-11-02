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
        let rect = CGRect(x: 0, y: 0, width: 160, height: 160)
        let iv  = UIImageView(frame: rect)
        iv.center = view.center
        view.addSubview(iv)
//        let image = #imageLiteral(resourceName: "avatar_default_big.png")
      
        let image = #imageLiteral(resourceName: "cat.jpeg")
        
        iv.image = avatarImage(image: image, size: rect.size,backColor: view.backgroundColor)
    }
   
    
    
    // MARK: -图片拉伸处理
    
    /// 将原来的图像拉伸后返回新的图像
    ///
    /// - Parameters:
    ///   - image: 图像
    ///   - size: 尺寸
    /// - Returns: 处理后的图像
    func avatarImage(image:UIImage,size:CGSize,backColor:UIColor?) -> UIImage? {
        // 1 上下文 在内存中开辟地址，与屏幕显示无关
        let rect  = CGRect(origin: CGPoint(), size: size)
        /*
         1>size
         2>不透明 (混合) png图片支持透明 jpg 图形不支持透明
         3>屏幕分辨率 如果不指定，默认使用1.0的分辨率（图片质量不好）
           指定0，会选择当前设备屏幕的分辨率
         */
        UIGraphicsBeginImageContextWithOptions(rect.size, true, 0)
        
        // 圆角
        // （0） 背景填充
        backColor?.setFill()
        UIRectFill(rect)
        // （1） 原型路径
        let path = UIBezierPath(ovalIn: rect)
        // （2） 路径裁切
        path.addClip()
        // 2 绘图
        image.draw(in: rect)
        // 绘制内切原型
        UIColor.darkGray.setStroke()
        path.lineWidth = 2
        path.stroke()
        // 3 取得新的图像
        let result = UIGraphicsGetImageFromCurrentImageContext()
        // 4 关闭上下文
        UIGraphicsEndImageContext()
        // 5 返回结果
        return result
    }
    
    
    
    

}

