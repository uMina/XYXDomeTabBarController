//
//  XYXViewController.swift
//  XYXDomeTabbarDemo
//
//  Created by Teresa on 2018/1/17.
//  Copyright © 2018年 Teresa. All rights reserved.
//

import UIKit

class XYXViewController: XYXDomeTabBarController {
    convenience init() {
        self.init(nibName: nil, bundle: nil)
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
        
        self.domeIndex = 2  
//        self.domeBar.domeButtonSize = CGSize(width: 50, height: 50)
    }
    
    /*
    override func domeButtonClicked(_ sender: UIButton) {
        <#code#>
    }
    */
}
