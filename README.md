# LIRouter

简单使用:
1.App启动后调用 LIRouter.shared.autoRegister()
autoRegister 在这个方法中会自动找到遵守LIRouterProtocol的类，进行路由注册

2.让你的控制器遵守LIRouterProtocol(当然不一定是控制器，准守了协议就行)
eg:
extension VCC:LIRouterProtocol {
    static func register(router: LIRouter) {
        router.register(url: "VCC", className: Self.self)
    }
    
    static func jump(props: [String : Any]) {
        guard let vc = UIViewController.currentViewController() else {
            print("currentViewController = nil")
            return
        }
        
        print(props)
        let target = VCC()
        vc.navigationController?.pushViewController(target, animated: true)
    }
}

3.跳转
eg:
LIRouter.shared.resolve(url: "VCA", props: ["test":"跳转1参数"])
