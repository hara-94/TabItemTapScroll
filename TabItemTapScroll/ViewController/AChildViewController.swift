//
//  AChildViewController.swift
//  TabItemTapScroll
//
//  Created by hikaruhara on 2021/04/21.
//

import UIKit

class AChildViewController: UIViewController {
    private let label: UILabel = .init()
    
    override func loadView() {
        super.loadView()
        
        title = "AChild"
        view.backgroundColor = .red
        label.text = "AChild"
        label.font = .boldSystemFont(ofSize: 20)
        label.sizeToFit()
        view.addSubview(label)
        label.center = .init(x: view.center.x, y: view.center.y)
    }
}
