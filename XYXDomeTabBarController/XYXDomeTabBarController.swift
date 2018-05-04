//
//  XYXDomeTabBarController.swift
//  XYXDomeTabbarDemo
//
//  Created by Teresa on 2017/11/28.
//  Copyright © 2017年 Teresa. All rights reserved.
//

import Foundation
import UIKit

open class XYXDomeTabBarController: UITabBarController {
    /// 凸起按钮的位置
    public var domeIndex:Int = 0{
        didSet{
            domeBar.domeIndex = domeIndex
        }
    }
    public var domeButtonNormalImageName:String = ""{
        didSet{
            domeBar.domeButton.setImage(UIImage.init(named: domeButtonNormalImageName), for: UIControlState.normal)
        }
    }
    public var domeButtonHighlightedImageName:String = ""{
        didSet{
            domeBar.domeButton.setImage(UIImage.init(named: domeButtonHighlightedImageName), for: UIControlState.highlighted)
        }
    }
    
    /// 可设置domeBtn
    public let domeBar = XYXDomeTabBar.init()

    // MARK: - Life Cycle
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
    }
    
    // MARK: - Configure UI
    
    public func addChildViewController(_ childController: UIViewController, title:String?, imageName:String?,selectedImageName:String?) {
        childController.title = title
        childController.tabBarItem.image = UIImage.init(named: imageName ?? "")
        childController.tabBarItem.selectedImage = UIImage.init(named: selectedImageName ?? "")
        if childController is UINavigationController{
            self.addChildViewController(childController)
        }else{
            let navController = UINavigationController.init(rootViewController: childController)
            self.addChildViewController(navController)
        }
    }
    
    fileprivate func configureTabBar() {
        self.setValue(domeBar, forKey: "tabBar")
        domeBar.domeButton.addTarget(self, action: #selector(domeButtonClicked(_:)), for: UIControlEvents.touchDown)
    }
    
    // MARK: - Action
    
    @objc open func domeButtonClicked(_ sender:UIButton){
        let y = min(sender.frame.minY, self.tabBar.frame.minY)
        let point = CGPoint(x: sender.center.x, y: y)
        let shadeView = XYXShadeView(originalPoint: point)
        self.view.addSubview(shadeView)
        shadeView.bubbleView.btnA.addTarget(self, action: #selector(doWhatYouWant), for: UIControlEvents.touchUpInside)
    }
    
    @objc fileprivate func doWhatYouWant(){
        print("You could overwrite ‘domeButtonClicked(_:)’ method")
    }
    
}
