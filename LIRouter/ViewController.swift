//
//  ViewController.swift
//  LIRouter
//
//  Created by 林文峰 on 2023/4/2.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray
        self.title = "homeVC"
        // Do any additional setup after loading the view.
        let button1 = UIButton(frame: CGRect(x: 20, y: 100, width: 200, height: 100))
        button1.backgroundColor = .red
        button1.addTarget(self, action: #selector(jump1), for: .touchUpInside)
        self.view.addSubview(button1)
        let button2 = UIButton(frame: CGRect(x: 20, y: 300, width: 200, height: 100))
        button2.backgroundColor = .black
        button2.addTarget(self, action: #selector(jump2), for: .touchUpInside)
        self.view.addSubview(button2)
        let button3 = UIButton(frame: CGRect(x: 20, y: 500, width: 200, height: 100))
        button3.backgroundColor = .yellow
        button3.addTarget(self, action: #selector(jump3), for: .touchUpInside)
        self.view.addSubview(button3)
    }
    
    @objc func jump1() {
        LIRouter.shared.resolve(url: "VCA", props: ["test":"跳转1参数"])
    }
    
    @objc func jump2() {
        LIRouter.shared.resolve(url: "VCB", props: ["test":"跳转2参数"])
    }
    @objc func jump3() {
        LIRouter.shared.resolve(url: "VCC", props: ["test":"跳转3参数"])
    }
}

