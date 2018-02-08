//
//  ViewController1.swift
//  XYXDomeTabbarDemo
//
//  Created by Teresa on 2017/11/28.
//  Copyright © 2017年 Teresa. All rights reserved.
//

import Foundation
import UIKit

class ViewController1: UIViewController {
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.init(red: 247/255.0, green: 245/255.0, blue: 184/255.0, alpha: 1)
        
        let label = UILabel.init()
        label.text = "Welcome to my blog \n http://umina.github.io/"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 18.0)
        label.sizeToFit()
        label.layer.cornerRadius = 15.0
        label.layer.masksToBounds = true
        label.center = CGPoint(x:view.center.x,y:view.frame.height - 120)
        view.addSubview(label)
    }
}
