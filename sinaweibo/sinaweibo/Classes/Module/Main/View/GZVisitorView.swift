//
//  GZVisitorView.swift
//  sinaweibo
//
//  Created by mac book pro on 16/3/21.
//  Copyright © 2016年 finish. All rights reserved.
//

import UIKit

class GZVisitorView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepraUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /**
    开启动画
    */
    func stepIconAnimation(){
        let baseAni = CABasicAnimation(keyPath: "transform.rotation")
        baseAni.fromValue = M_PI * 2
        baseAni.duration = 20
        baseAni.repeatCount = MAXFLOAT
        baseAni.removedOnCompletion = false //动画结束后不删除
        iconImageView.layer .addAnimation(baseAni, forKey: "iconAni")
    }
    /**
    设置访客视图显示内容
    
    - parameter imageName: 图片
    - parameter message:   消息
    */
    func stepVisitorInfo(imageName: String,message: String){
        homeImageView.hidden = true
        iconImageView.image = UIImage(named: imageName)
        sendSubviewToBack(coverImageView) //把子控件移到最下面
        messageLabel.text = message
    }
    
    /**
    UI准备
    */
    func prepraUI(){
        backgroundColor = UIColor(white: 237/255.0, alpha: 1)
        addSubview(iconImageView)
        addSubview(coverImageView)
        addSubview(homeImageView)
        addSubview(messageLabel)
        addSubview(regiestButton)
        addSubview(loginButton)
        
        //添加约束
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        homeImageView.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        regiestButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        coverImageView.translatesAutoresizingMaskIntoConstraints = false
        
        //iconImageView
        addConstraint(NSLayoutConstraint(item: iconImageView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: iconImageView, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: -40))
        //遮罩约束
        addConstraint(NSLayoutConstraint(item: coverImageView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0))
         addConstraint(NSLayoutConstraint(item: coverImageView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: coverImageView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: regiestButton, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0))
        
        //home
        addConstraint( NSLayoutConstraint(item: homeImageView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: iconImageView, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        addConstraint( NSLayoutConstraint(item: homeImageView, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: iconImageView, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0))
        // message
        addConstraint( NSLayoutConstraint(item: messageLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: iconImageView, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        addConstraint( NSLayoutConstraint(item: messageLabel, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: iconImageView, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 16))
        addConstraint( NSLayoutConstraint(item: messageLabel, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 250))
        
        
        //regiestButton
        addConstraint( NSLayoutConstraint(item: regiestButton, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: messageLabel, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 0))
        addConstraint( NSLayoutConstraint(item: regiestButton, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: messageLabel, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 16))
        
        addConstraint( NSLayoutConstraint(item: regiestButton, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 100))
        addConstraint( NSLayoutConstraint(item: regiestButton, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 35))
        //loginButton
        addConstraint( NSLayoutConstraint(item: loginButton, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: messageLabel, attribute: NSLayoutAttribute.Trailing, multiplier: 1, constant: 0))
        addConstraint( NSLayoutConstraint(item: loginButton, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: regiestButton, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0))
        addConstraint( NSLayoutConstraint(item: loginButton, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: regiestButton, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0))
        addConstraint( NSLayoutConstraint(item: loginButton, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: regiestButton, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0))
        
        
    }
    // MARK: - 按钮事件
    private func regiestButtonAction(){
       
    
    }
    private func loginButtonAction(){
        
    }
    
    // MARK: - 懒加载控件
    private lazy var iconImageView: UIImageView = {
        var imageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
        return imageView
        }()
    private lazy var coverImageView: UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_mask_smallicon"))
    private lazy var homeImageView: UIImageView = {
        var imageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
        return imageView
        }()
    private lazy var messageLabel: UILabel = {
        let messageLabel = UILabel()
        messageLabel.text = "关注一些人，看看有什么惊喜!"
        messageLabel.textAlignment = NSTextAlignment.Center
        messageLabel.font = UIFont.systemFontOfSize(18)
        messageLabel.numberOfLines = 0
        messageLabel.sizeToFit() //根据内容设置大小
        return messageLabel
        }()
    private lazy var regiestButton: UIButton = {
        var regiestButton = UIButton()
        regiestButton.setTitle("注册", forState: UIControlState.Normal)
        regiestButton.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: UIControlState.Normal)
        regiestButton.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Normal)
        regiestButton.addTarget(self, action: "regiestButtonAction", forControlEvents: UIControlEvents.TouchUpInside)
        return regiestButton
        }()
    private lazy var loginButton: UIButton = {
        var loginButton = UIButton()
        loginButton.setTitle("登录", forState: UIControlState.Normal)
        loginButton.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: UIControlState.Normal)
        loginButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        loginButton.addTarget(self, action: "loginButtonAction", forControlEvents: UIControlEvents.TouchUpInside)
        return loginButton
        }()
    
    
}
