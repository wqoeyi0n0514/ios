//
//  GZMainViewController.swift
//  sinaweibo
//
//  Created by mac book pro on 16/3/20.
//  Copyright © 2016年 finish. All rights reserved.
//

import UIKit

class GZMainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //添加自定义tabbarItem kvc
        setValue(GZMainTabBar(), forKey: "tabBar")
        //首页
        let homeVC = GZHomeController()
        addChildViewController(homeVC, title: "首页", imageName: "tabbar_home")
        //消息
        let messageVC = GZMessageController()
        addChildViewController(messageVC, title: "消息", imageName: "tabbar_message_center")
        //发现
        let discoverVC = GZDiscoverController()
        addChildViewController(discoverVC, title: "发现", imageName: "tabbar_discover")
        //我
        let profileVC = GZProfileController()
        addChildViewController(profileVC, title: "我", imageName: "tabbar_profile")
    }
    /**
    添加子控制器
    */
    func addChildViewController(viewVC: UIViewController,title: String,imageName: String) {
        viewVC.title = title
        viewVC.tabBarItem.image = UIImage(named: imageName)
        //改变渲染模式
        viewVC.tabBarItem.selectedImage = UIImage(named: imageName+"_highlighted")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        //改变字体颜色
        viewVC.tabBarItem .setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.orangeColor()], forState: UIControlState.Selected)
        //包装成navc
        let navc = UINavigationController(rootViewController: viewVC)
        addChildViewController(navc)
    }
    
    
}
