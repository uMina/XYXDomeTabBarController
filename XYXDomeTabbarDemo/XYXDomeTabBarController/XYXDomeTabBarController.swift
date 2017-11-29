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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureChildViewControllers()
        configureTabBar()
    }
    
    fileprivate func configureChildViewControllers(){
        let childControllersName = ["ViewController1","ViewController2","ViewController3","ViewController4"]
        let titleItems = ["A","B","C","D"]
        let imageItems = ["item1","item2","item3","item4"]
        
        for idx in 0...childControllersName.count-1 {
            let className = childControllersName[idx]
            if  let appName: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as! String? {
                let classStringName = "\(appName).\(className)"
                let classType = NSClassFromString(classStringName) as? UIViewController.Type
                if let type = classType {
                    let newController = type.init()
                    self.addChildViewController(newController, title: titleItems[idx], imageName: imageItems[idx], selectedImageName: imageItems[idx])
                }
            }
        }
    }
    
    fileprivate func addChildViewController(_ childController: UIViewController, title:String?, imageName:String?,selectedImageName:String?) {
        childController.title = title
        childController.tabBarItem.image = UIImage.init(named: imageName ?? "")
        childController.tabBarItem.selectedImage = UIImage.init(named: selectedImageName ?? "")
        let navController = UINavigationController.init(rootViewController: childController)
        self.addChildViewController(navController)
    }
    
    fileprivate func configureTabBar() {
        let tabBar = XYXDomeTabBar.init(frame: self.tabBar.frame, domeIndex:4)
        self.setValue(tabBar, forKey: "tabBar")
        tabBar.domeButton.addTarget(self, action: #selector(domeButtonClicked(_:)), for: UIControlEvents.touchUpInside)
        
    }
    
    @objc fileprivate func domeButtonClicked(_ sender:UIButton){
        let point = CGPoint(x: sender.center.x, y: self.tabBar.frame.minY)
        let shadeView = XYXShadeView(originalPoint: point)
        self.view.addSubview(shadeView)
        shadeView.bubbleView.btnA.addTarget(self, action: #selector(doWhatYouWant), for: UIControlEvents.touchUpInside)
    }
    
    @objc fileprivate func doWhatYouWant(){
        print("Do what you want")
    }
}
