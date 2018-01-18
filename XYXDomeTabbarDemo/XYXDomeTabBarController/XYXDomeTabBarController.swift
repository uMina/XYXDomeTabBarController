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
            domeBar.domeIndex = domeIndex
        }
    }
    
    /// 可设置domeBtn
    let domeBar = XYXDomeTabBar.init()

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
    }
    
    // MARK: - Configure UI
    
    func addChildViewController(_ childController: UIViewController, title:String?, imageName:String?,selectedImageName:String?) {
        childController.title = title
        childController.tabBarItem.image = UIImage.init(named: imageName ?? "")
        childController.tabBarItem.selectedImage = UIImage.init(named: selectedImageName ?? "")
        let navController = UINavigationController.init(rootViewController: childController)
        self.addChildViewController(navController)
    }
    
    fileprivate func configureTabBar() {
        self.setValue(domeBar, forKey: "tabBar")
        domeBar.domeButton.addTarget(self, action: #selector(domeButtonClicked(_:)), for: UIControlEvents.touchUpInside)
    }
    
    // MARK: - Action
    
    @objc func domeButtonClicked(_ sender:UIButton){
        let point = CGPoint(x: sender.center.x, y: self.tabBar.frame.minY)
        let shadeView = XYXShadeView(originalPoint: point)
        self.view.addSubview(shadeView)
        shadeView.bubbleView.btnA.addTarget(self, action: #selector(doWhatYouWant), for: UIControlEvents.touchUpInside)
    }
    
    @objc fileprivate func doWhatYouWant(){
        print("You could overwrite ‘domeButtonClicked(_:)’ method")
    }
    
}
