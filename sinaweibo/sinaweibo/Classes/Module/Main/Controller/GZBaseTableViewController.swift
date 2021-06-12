//
//  GZBaseTableViewController.swift
//  sinaweibo
//
//  Created by mac book pro on 16/3/21.
//  Copyright © 2016年 finish. All rights reserved.
//

import UIKit

class GZBaseTableViewController: UITableViewController,GZVisitorViewDelegate {
    /// 是否登录
    var isLogin: Bool = false
    override func loadView() {
        isLogin ? super.loadView() : loadVisitorView()
    }
    /**
    加载访客视图
    */
    func loadVisitorView(){
        visitorView.delegate = self
        view = visitorView
        if self is GZHomeController {
            visitorView.stepIconAnimation()
            
        }else if self is GZMessageController {
            visitorView.stepVisitorInfo("visitordiscover_image_message", message: "登录后，别人评论你的微博，发给你的消息，都会在这里收到通知")
            
        }else if self is GZDiscoverController {
            visitorView.stepVisitorInfo("visitordiscover_image_message", message: "登录后，最新、最热微博尽在掌握，不再会与实事潮流擦肩而过")
            
        }else if self is GZProfileController {
            visitorView.stepVisitorInfo("visitordiscover_image_profile", message: "登录后，你的微博、相册、个人资料会显示在这里，展示给别人")
        }
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: UIBarButtonItemStyle.Plain, target: self, action: "didRegiestButtonClick:")
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: UIBarButtonItemStyle.Plain, target: self, action: "didLoginButtionClick:")
    }
  
    // MARK: - 懒加载
    lazy  var visitorView: GZVisitorView = GZVisitorView()
}
extension GZBaseTableViewController{
    // MARK: - GZVisitorViewDelegate
    func didRegiestButtonClick(visitorView: GZVisitorView){
       
    }
    func didLoginButtionClick(visitorView: GZVisitorView){
      
    }
  
}
