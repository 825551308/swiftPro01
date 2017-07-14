//
//  VCExchangeMethod.swift
//  swiftPro01
//
//  Created by 金汕汕 on 2017/7/14.
//  Copyright © 2017年 ccs. All rights reserved.
//
import UIKit
import Foundation

extension UIViewController{

    open override class func initialize() {
        guard self === UIViewController.self else {
            return
        }
        // if using swift2.0+
        /*
         struct Static {
         static var onceToken: dispatch_once_t = 0
         }
         dispatch_once(&Static.onceToken) {
         replaceViewWillAppear()
         }
         */
        // if using swift3.0+
        let dispatchOnce: Void = {
            replaceViewWillAppear()
        }()
        _ = dispatchOnce
    }
    // 替换系统的 ViewWillAppear
    private class func replaceViewWillAppear() {
        let originSel = #selector(UIViewController.viewWillAppear(_:))
        let swizzlSel = #selector(UIViewController.cgy_viewWillAppear(_:))
        let originMethod = class_getInstanceMethod(self, originSel)
        let swizzlMethod = class_getInstanceMethod(self, swizzlSel)
        let addMethod = class_addMethod(self, originSel,
                                        method_getImplementation(swizzlMethod),
                                        method_getTypeEncoding(swizzlMethod))
        if addMethod {
            class_replaceMethod(self, swizzlSel,
                                method_getImplementation(originMethod),
                                method_getTypeEncoding(originMethod))
        } else {
            method_exchangeImplementations(originMethod, swizzlMethod)
        }
    }
    func cgy_viewWillAppear(_ animated: Bool) {
        self.cgy_viewWillAppear(animated)
        /** 写你自己的统一逻辑 */
//        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "",
//                                                                style: .plain,
//                                                                target: nil,
//                                                                action: nil)
    }
    
}
