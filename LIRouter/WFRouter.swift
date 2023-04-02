//
//  LIRouter.swift
//  LIRouter
//
//  Created by 林文峰 on 2023/4/2.
//

import UIKit

@objc class LIRouter: NSObject {
    fileprivate var routerMap:[String:AnyClass] = [:]
    public static let shared = LIRouter()
    fileprivate static let resolveSelector = NSSelectorFromString("jumpWithProps:")
    fileprivate static let registerSelector = NSSelectorFromString("registerWithRouter:")
}

extension LIRouter {
    public func register(url:String,className:AnyClass) {
        if self.routerMap[url] == nil {
            self.routerMap.updateValue(className, forKey: url)
            return
        } else {
            assert(false,"\(url) 重复注册")
        }
    }
    @discardableResult
    public func resolve(url:String,props:[String:Any]) -> Bool {
        guard let anyClass = self.routerMap[url] else {
            print("\(url) 没有注册")
            return false
        }
        if !anyClass.responds(to: LIRouter.resolveSelector) {
            print("\(anyClass) 没有实现LIRouterProtocol协议")
            return false
        }
        anyClass.perform(LIRouter.resolveSelector,with:props,afterDelay: 0)
        return true
    }
    public func autoRegister() {
        for className in OCUtils.getAllClassName() {
            if let anyClass = NSClassFromString(className),
               anyClass.responds(to: LIRouter.registerSelector) {
                anyClass.perform(LIRouter.registerSelector,with:self,afterDelay: 0)
            }
        }
    }
}
extension UIViewController {
    class func currentViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return currentViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            return currentViewController(base: tab.selectedViewController)
        }
        if let presented = base?.presentedViewController {
            return currentViewController(base: presented)
        }
        return base
    }
}
