//
//  LIRouterProtocol.swift
//  LIRouter
//
//  Created by 林文峰 on 2023/4/2.
//

import UIKit

@objc protocol LIRouterProtocol {
    /// 注册路由
    /// - Parameter router: 路由管理单例
    static func register(router:LIRouter)
    /// 跳转
    /// - Parameter props: 跳转参数
    static func jump(props:[String:Any])
}
