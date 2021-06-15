//
//  GZAFNetworkTool.swift
//  sinaweibo
//
//  Created by mac book pro on 16/3/21.
//  Copyright © 2016年 finish. All rights reserved.
//

import UIKit
import AFNetworking
/// 网络单例
class GZAFNetworkTool: NSObject {
    /// 单列默认的构造方法
    static let networkTool = GZAFNetworkTool()
    
    var afnManager: AFHTTPSessionManager
    
    //稀有化构造
    private  override init() {
        let url: NSURL? = NSURL(string: "https://api.weibo.com/")
        afnManager = AFHTTPSessionManager(baseURL: url)
        super.init()
    }
}
