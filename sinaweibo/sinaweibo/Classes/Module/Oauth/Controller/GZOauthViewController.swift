//
//  GZOauthViewController.swift
//  sinaweibo
//
//  Created by mac book pro on 16/3/21.
//  Copyright © 2016年 finish. All rights reserved.
//

import UIKit
import SVProgressHUD
class GZOauthViewController: UIViewController,UIWebViewDelegate {
    override func loadView() {
        view = webView
        webView.delegate = self
       
    }
    override func viewDidLoad() {
        setupView()
        //开启加载提示
        SVProgressHUD.showWithStatus("正在加载!", maskType: SVProgressHUDMaskType.Black)
        
        let urlString = "https://api.weibo.com/oauth2/authorize?client_id=\(client_id)&redirect_uri=\(redirect_uri)"
        let url: NSURL? = NSURL(string: urlString)
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
    }
    /**
    初始化view
    */
    private func setupView(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "填充", style: UIBarButtonItemStyle.Plain, target: self, action: "fillButtonClick")
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "取消", style: UIBarButtonItemStyle.Plain, target: self, action: "cancelButtonClick")
    }
    
    
    
    // MARK: - 按钮点击事件
    @objc private func cancelButtonClick(){
        dismissViewControllerAnimated(true, completion: nil)
    }
    @objc private func fillButtonClick(){
      
    }
    // MARK: - 懒加载
    private lazy var webView = UIWebView()
    
}
extension GZOauthViewController{
    // MARK: － UIWebViewDelegate
    func webViewDidFinishLoad(webView: UIWebView){
        //加载完成,隐藏提示
        SVProgressHUD.dismiss()
    }
}
