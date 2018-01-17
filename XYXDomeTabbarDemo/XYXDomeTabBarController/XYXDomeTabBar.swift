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
    
    var domeImageName:String = "Add"{
        didSet{
            domeButton.setImage(UIImage.init(named: domeImageName), for: UIControlState.normal)
        }
    }
    
    var domeImageNameHighlighted:String = "Add_Highlighted"{
        didSet{
            domeButton.setImage(UIImage.init(named: domeImageNameHighlighted), for: UIControlState.highlighted)
        }
    }
    
    let domeButton = UIButton.init(type: UIButtonType.custom)
    private var domeIndex = 0
    
    convenience init(frame: CGRect, domeIndex:Int?) {
        self.init(frame: frame)
        self.domeIndex = domeIndex ?? 0
        
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().tintColor = UIColor.init(red: 170/255.0, green: 210/255.0, blue: 210/255.0, alpha: 1)
        self.shadowImage = UIImage.init()
        self.backgroundImage = UIImage.init()
        
        let edge = frame.height + 20.0
        domeButton.bounds = CGRect(x: 0, y: 0, width: edge, height: edge)
        domeButton.setImage(UIImage.init(named: "Add"), for: UIControlState.normal)
        domeButton.setImage(UIImage.init(named: "Add_Highlighted"), for: UIControlState.highlighted)
        addSubview(domeButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var idx = 0
        let btnWidth = self.bounds.width/CGFloat(self.subviews.count-1)
        
        for subView in self.subviews {
            if idx == self.domeIndex{
                idx += 1
            }
            
            if NSStringFromClass(subView.classForCoder) == "UITabBarButton"{
                subView.frame = CGRect(x: CGFloat(idx) * btnWidth, y: self.bounds.minY, width: btnWidth, height: self.bounds.height-2)
                idx += 1
            }else if subView.isKind(of: NSClassFromString("UIButton")!){
                domeButton.center = CGPoint(x:(CGFloat(self.domeIndex) + 0.5)*btnWidth, y:self.bounds.size.height * 0.3)
            }
        }
    }
}
