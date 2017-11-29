//
//  ViewController2.swift
//  XYXDomeTabbarDemo
//
//  Created by Teresa on 2017/11/28.
//  Copyright © 2017年 Teresa. All rights reserved.
//

import Foundation
import UIKit

class ViewController2: UIViewController {
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.init(red: 249/255.0, green: 191/255.0, blue: 205/255.0, alpha: 1)
        
        let label = UILabel.init()
        label.text = "Welcome to my blog \n http://umina.github.io/"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 18.0)
        label.sizeToFit()
        label.layer.cornerRadius = 15.0
        label.layer.masksToBounds = true
        label.center = CGPoint(x:view.center.x,y:view.frame.height - 100)
        view.addSubview(label)
    }
}

