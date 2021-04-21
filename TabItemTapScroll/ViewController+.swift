//
//  ViewController+.swift
//  TabItemTapScroll
//
//  Created by hikaruhara on 2021/04/21.
//

import UIKit

extension UIViewController {
    func withNavigationController() -> UINavigationController {
        let navigation: UINavigationController = .init(rootViewController: self)
        return navigation
    }
}
