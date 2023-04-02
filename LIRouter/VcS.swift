//
//  VCA.swift
//  LIRouter
//
//  Created by 林文峰 on 2023/4/2.
//

import UIKit

class VCA: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        // Do any additional setup after loading the view.
    }
}

extension VCA:LIRouterProtocol {
    static func register(router: LIRouter) {
        router.register(url: "VCA", className: Self.self)
    }
    
    static func jump(props: [String : Any]) {
        guard let vc = UIViewController.currentViewController() else {
            print("currentViewController = nil")
            return
        }
        print(props)
        let target = VCA()
        vc.navigationController?.pushViewController(target, animated: true)
    }
}

class VCB: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .brown
        // Do any additional setup after loading the view.
    }
}

extension VCB:LIRouterProtocol {
    static func register(router: LIRouter) {
        router.register(url: "VCB", className: Self.self)
    }
    
    static func jump(props: [String : Any]) {
        guard let vc = UIViewController.currentViewController() else {
            print("currentViewController = nil")
            return
        }
        
        print(props)
        let target = VCB()
        vc.present(target, animated: true)
    }
}

class VCC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
        // Do any additional setup after loading the view.
    }
}

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
