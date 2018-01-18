//
//  XYXDomeTabBar.swift
//  XYXDomeTabbarDemo
//
//  Created by Teresa on 2017/11/28.
//  Copyright © 2017年 Teresa. All rights reserved.
//

import Foundation
import UIKit

class XYXDomeTabBar: UITabBar {
    
    /// 凸起按钮.
    let domeButton = UIButton.init(type: UIButtonType.custom)
    
    /// 凸起按钮尺寸.
    var domeButtonSize:CGSize?{
        didSet{
            if domeIndex == -1 {
                domeIndex = 0
            }else{
                configureDomeBtn()                
            }
        }
    }
    
    /// 凸起按钮位置: 从0开始计数. 若不设置, 则默认不显示.
    var domeIndex = -1{
        didSet{
            configureDomeBtn()
        }
    }
    
    fileprivate let domeView = UIView()
    
    convenience init() {
        self.init(frame: CGRect.zero)
        
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().tintColor = UIColor.init(red: 170/255.0, green: 210/255.0, blue: 210/255.0, alpha: 1)
        self.shadowImage = UIImage.init()
        self.backgroundImage = UIImage.init()
        
        domeButton.contentHorizontalAlignment = .fill
        domeButton.contentVerticalAlignment = .fill
        domeButton.setImage(UIImage.init(named: "Add"), for: UIControlState.normal)
        domeButton.setImage(UIImage.init(named: "Add_Highlighted"), for: UIControlState.highlighted)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        var idx = 0
        let btnWidth = self.bounds.width/CGFloat(self.subviews.count-1)
        for subView in self.subviews {
            if idx == self.domeIndex {
                idx += 1
            }
            if NSStringFromClass(subView.classForCoder) == "UITabBarButton"{
                subView.frame = CGRect(x: CGFloat(idx) * btnWidth, y: self.bounds.minY, width: btnWidth, height: self.bounds.height-2)
                idx += 1
            }else if subView.isKind(of: NSClassFromString("UIView")!){  }
        }
    }

    func configureDomeBtn() {
        addSubview(domeView)
        var nextResponder = self.next
        while let responder = nextResponder {
            if responder.isKind(of: UIViewController.classForCoder()) {
                let vc = responder as! UIViewController
                vc.view.addSubview(domeButton)
                if let size = domeButtonSize {
                    domeButton.frame = CGRect(origin: CGPoint.zero, size: size)
                }else{
                    let edge = frame.height + 20.0
                    domeButton.frame = CGRect(x: 0, y: 0, width: edge, height: edge)
                }
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.25, execute: {[unowned self] in
                    let btnWidth = self.bounds.width/CGFloat(self.subviews.count-1)
                    if self.domeButton.frame.height > self.frame.height{
                        let domeCenter = CGPoint(x:(CGFloat(self.domeIndex) + 0.5)*btnWidth, y: vc.view.frame.height - self.domeButton.frame.height/2)
                        self.domeButton.center = domeCenter
                    }else{
                        let domeCenter = CGPoint(x:(CGFloat(self.domeIndex) + 0.5)*btnWidth, y: vc.view.frame.height - self.frame.height/2)
                        self.domeButton.center = domeCenter
                    }
                })
                break
            }
            nextResponder = responder.next
        }
    }
}
