//
//  XYXDomeTabBarController.swift
//  XYXDomeTabbarDemo
//
//  Created by Teresa on 2017/11/28.
//  Copyright © 2017年 Teresa. All rights reserved.
//

import Foundation
import UIKit

class XYXDomeTabBarController: UITabBarController {
    /// 凸起按钮的位置
    var domeIndex:Int = 0{
        didSet{
            configureTabBar()
        }
    }
    
    /// 凸起按钮的normal状态图片
    var domeImageName:String = ""{
        didSet{
            let bar = self.tabBar.value(forKey: "tabBar") as! XYXDomeTabBar
            bar.domeImageName = domeImageName
        }
    }
    
    /// 凸起按钮的Highlighted状态图片
    var domeImageNameHighlighted:String = ""{
        didSet{
            let bar = self.tabBar.value(forKey: "tabBar") as! XYXDomeTabBar
            bar.domeImageNameHighlighted = domeImageNameHighlighted
        }
    }
    
    func addChildViewController(_ childController: UIViewController, title:String?, imageName:String?,selectedImageName:String?) {
        childController.title = title
        childController.tabBarItem.image = UIImage.init(named: imageName ?? "")
        childController.tabBarItem.selectedImage = UIImage.init(named: selectedImageName ?? "")
        let navController = UINavigationController.init(rootViewController: childController)
        self.addChildViewController(navController)
    }
    
    fileprivate func configureTabBar() {
        let tabBar = XYXDomeTabBar.init(frame: self.tabBar.frame, domeIndex:domeIndex)
        self.setValue(tabBar, forKey: "tabBar")
        tabBar.domeButton.addTarget(self, action: #selector(domeButtonClicked(_:)), for: UIControlEvents.touchUpInside)
    }
    
    @objc func domeButtonClicked(_ sender:UIButton){
        let point = CGPoint(x: sender.center.x, y: self.tabBar.frame.minY)
        let shadeView = XYXShadeView(originalPoint: point)
        self.view.addSubview(shadeView)
        shadeView.bubbleView.btnA.addTarget(self, action: #selector(doWhatYouWant), for: UIControlEvents.touchUpInside)
    }
    
    @objc func doWhatYouWant(){
        print("You could overwrite ‘domeButtonClicked(_:)’ method")
    }
}
