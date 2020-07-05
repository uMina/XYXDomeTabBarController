//
//  XYXShadeView.swift
//  XYXDomeTabbarDemo
//
//  Created by Teresa on 2017/11/28.
//  Copyright © 2017年 Teresa. All rights reserved.
//

import Foundation
import UIKit

class XYXShadeView: UIView {
    var originalPoint = CGPoint.zero
    private var flag = 1
    let bubbleView = XYXBubbleSelectorView.init(frame: CGRect.zero)
    
    convenience init(originalPoint:CGPoint) {
        self.init(frame: UIScreen.main.bounds)
        backgroundColor = UIColor.gray.withAlphaComponent(0.0)
        
        self.originalPoint = originalPoint
        
        bubbleView.frame = CGRect(x: originalPoint.x, y: originalPoint.y, width: 0, height: 0)
        addSubview(bubbleView)
        UIView.animate(withDuration: 0.25) {
            self.bubbleView.frame = CGRect(x: 0, y: 0, width: 230, height: 80)
            let centerY = UIScreen.main.bounds.height == 812 ? UIScreen.main.bounds.height-80-30 - 34 : UIScreen.main.bounds.height-80-30
            self.bubbleView.center = CGPoint(x: self.center.x, y: centerY)
            self.bubbleView.configureUI()
        }
        
        bubbleView.btnA.addTarget(self, action: #selector(removeShadeView), for: UIControl.Event.touchUpInside)
        
    }
    
    @objc fileprivate func removeShadeView() {
        UIView.animate(withDuration: 0.25, animations: {
            self.bubbleView.frame = CGRect(x: self.originalPoint.x, y: self.originalPoint.y, width: 0, height: 0)
        }) { (isSuccess) in
            self.removeFromSuperview()
        }
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        
        let hitView = super.hitTest(point, with: event)
        
        guard flag%2 == 0 else {
            flag += 1
            return hitView
        }
        if hitView is XYXShadeView {
            self.removeShadeView()
        }
        return hitView
    }
}

class XYXBubbleSelectorView: UIView {
    
    fileprivate let titleLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12.0)
        label.textColor = UIColor.darkGray
        label.textAlignment = NSTextAlignment.center
        label.text = "Do"
        label.sizeToFit()
        return label
    }()

    let btnA:UIButton = {
        let btn = UIButton.init(type: UIButton.ButtonType.custom)
        btn.setTitle("What you want", for: UIControl.State.normal)
        btn.setTitleColor(UIColor.init(red: 170/255.0, green: 210/255.0, blue: 210/255.0, alpha: 1), for: UIControl.State.normal)
        btn.sizeToFit()
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        layer.cornerRadius = 15.0
        layer.masksToBounds = true
        
        addSubview(titleLabel)
        addSubview(btnA)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        titleLabel.center = CGPoint(x: self.frame.width/2, y: titleLabel.frame.height)
        btnA.center = CGPoint(x: self.frame.width/2, y: (titleLabel.frame.maxY+self.frame.height)/2)
    }
    
}
