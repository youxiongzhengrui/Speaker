//
//  MBProgressHUDExtension.swift
//  FYHLive
//
//  Created by xiongzhengrui on 2018/3/23.
//  Copyright © 2018年 xiongzhengrui. All rights reserved.
//

import Foundation
import MBProgressHUD

let loadingMessage = "正在加载中"

extension MBProgressHUD {
    
    static func showLoading(message: String, view: UIView, animated: Bool = true) -> MBProgressHUD {
        return display(message: message, toView: view, animated: animated) ?? MBProgressHUD()
    }
    
    static func showMessage(_ message: String, to view: UIView?, animated: Bool = true) -> MBProgressHUD {
        return display(message: message, toView: view, animated: animated) ?? MBProgressHUD()
    }
    
    static func showError(_ error: String, to view: UIView? = nil) {
        display(message: error, toView: view, withIcon: #imageLiteral(resourceName: "mbError"), forDuration: 1)
    }
    
    static func showSuccess(_ success: String, to view: UIView? = nil) {
        display(message: success, toView: view, withIcon: #imageLiteral(resourceName: "mbSuccess"), forDuration: 1)
    }
    
    static func showMessage(_ text: String, toview view: UIView?, afterDelay delay: TimeInterval) {
        display(message: text, toView: view, withIcon: nil, forDuration: delay)
    }
    
    static func display(message: String = loadingMessage, toView view: UIView?, animated: Bool = true) -> MBProgressHUD? {
        guard !message.isEmpty else {
            return nil
        }
        let parentView: UIView
        if view == nil {
            guard let view = UIApplication.shared.windows.last else {
                return nil
            }
            parentView = view
        } else {
            parentView = view!
        }
        let hud = MBProgressHUD(view: parentView)
        hud.contentColor = .white
        hud.bezelView.backgroundColor = .black
        hud.graceTime = 0.5
        hud.removeFromSuperViewOnHide = true
        hud.label.numberOfLines = 0
        hud.label.lineBreakMode = .byWordWrapping
        hud.label.text = message
        parentView.addSubview(hud)
        //        UIApplication.shared.keyWindow?.addSubview(hud)
        hud.show(animated: animated)
        return hud
    }
    
    static func display(message: String, toView view: UIView?, withIcon icon: UIImage?, forDuration duration: TimeInterval) {
        guard !message.trim().isEmpty else {
            return
        }
        let parentView: UIView
        if view == nil {
            guard let view = UIApplication.shared.windows.last else {
                return
            }
            parentView = view
        } else {
            parentView = view!
        }
        let hud = MBProgressHUD(view: parentView)
        if icon == nil {
            hud.mode = .text
        } else {
            hud.mode = .customView
            hud.customView = UIImageView(image: icon)
        }
        hud.contentColor = .white
        hud.bezelView.backgroundColor = .black
        hud.label.numberOfLines = 0
        hud.label.lineBreakMode = .byWordWrapping
        hud.label.text = message
        hud.removeFromSuperViewOnHide = true
        //        UIApplication.shared.keyWindow?.addSubview(hud)
        parentView.addSubview(hud)
        hud.show(animated: true)
        hud.hide(animated: true, afterDelay: duration)
    }
}
