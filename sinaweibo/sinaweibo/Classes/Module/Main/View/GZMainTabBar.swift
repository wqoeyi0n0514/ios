//
//  GZMainTabBar.swift
//  sinaweibo
//
//  Created by mac book pro on 16/3/20.
//  Copyright © 2016年 finish. All rights reserved.
//

import UIKit
let buttonCount = 5
class GZMainTabBar: UITabBar {
    lazy var compose: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: UIControlState.Normal)
        button.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), forState: UIControlState.Highlighted)
        button.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState: UIControlState.Normal)
        button.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState: UIControlState.Selected)
        self.addSubview(button)
        return button
        }()
    override func layoutSubviews() {
        super.layoutSubviews()
        let subViewW = frame.width/CGFloat(buttonCount)
        var index = 0
        let subFrame = CGRect(x: 0, y: 0, width: subViewW, height: frame.height)
        for subView in self.subviews {
            let cls: AnyClass? = NSClassFromString("UITabBarButton")
            if subView.isKindOfClass(cls!) {
                subView.frame = CGRectOffset(subFrame, CGFloat(index)*subViewW, 0)
                index = index==1 ? 2: index
                index++
            }
        }
        compose.frame = CGRect(x: 2*subViewW, y: 0, width: subViewW, height: frame.height)
    }
    
}
