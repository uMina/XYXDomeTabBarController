//
//  XYXDomeTabBar.swift
//  XYXDomeTabbarDemo
//
//  Created by Teresa on 2017/11/28.
//  Copyright © 2017年 Teresa. All rights reserved.
//

import Foundation
import UIKit

public class XYXDomeTabBar: UITabBar {
    
    /// 凸起按钮.
    public let domeButton = UIButton.init(type: UIButton.ButtonType.custom)
    
    /// 凸起按钮尺寸.
    public var domeButtonSize:CGSize?{
        didSet{
            if domeIndex == -1 {
                domeIndex = 0
            }else{
                configureDomeBtn()
            }
        }
    }
    
    /// 凸起按钮位置: 从0开始计数. 若不设置, 则默认不显示.
    public var domeIndex = -1{
        didSet{
            configureDomeBtn()
        }
    }
    
    fileprivate let prePhoneTabBarHeight:CGFloat = 49
    
    convenience public init() {
        self.init(frame: CGRect.zero)
        
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().tintColor = UIColor.init(red: 170/255.0, green: 210/255.0, blue: 210/255.0, alpha: 1)
        
        self.shadowImage = UIImage.init()
        self.backgroundImage = UIImage.init()
        
        domeButton.contentHorizontalAlignment = .fill
        domeButton.contentVerticalAlignment = .fill
        domeButton.setImage(UIImage.init(named: "Add"), for: UIControl.State.normal)
        domeButton.setImage(UIImage.init(named: "Add_Highlighted"), for: UIControl.State.highlighted)
        
        addSubview(self.domeButton)
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        var idx = 0
        let btnWidth = self.bounds.width/CGFloat(self.subviews.count-1)
        for subView in self.subviews {
            if idx == self.domeIndex {
                idx += 1
            }
            if NSStringFromClass(subView.classForCoder) == "UITabBarButton"{
                let height = self.bounds.height > prePhoneTabBarHeight ? prePhoneTabBarHeight - 2 : self.bounds.height-2
                subView.frame = CGRect(x: CGFloat(idx) * btnWidth, y: self.bounds.minY, width: btnWidth, height: height)
                idx += 1
            }else if subView.isKind(of: NSClassFromString("UIButton")!){
                var centerY:CGFloat = 0
                if self.domeButton.frame.height > self.prePhoneTabBarHeight {
                    centerY = self.frame.height - self.domeButton.frame.height/2
                }else{
                    centerY = self.frame.height - self.prePhoneTabBarHeight/2
                }
                if self.frame.height > self.prePhoneTabBarHeight {
                    centerY -= 34
                }
                let domeCenter = CGPoint(x:(CGFloat(self.domeIndex) + 0.5)*btnWidth, y: centerY)
                subView.center = domeCenter
                
            }else if subView.isKind(of: NSClassFromString("UIView")!){ }
        }
    }
    
    func configureDomeBtn() {
        if let size = domeButtonSize {
            domeButton.frame = CGRect(origin: CGPoint.zero, size: size)
        }else{
            let edge = frame.height + 20.0
            let size = CGSize(width: edge, height: edge)
            domeButton.frame = CGRect(origin: CGPoint.zero, size: size)
        }
        layoutIfNeeded()
    }
}
