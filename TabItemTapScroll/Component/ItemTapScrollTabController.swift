//
//  ITapScrollController.swift
//  TabItemTapScroll
//
//  Created by hikaruhara on 2021/04/21.
//

import UIKit

class ItemTapScrollTabController: UITabBarController {  //アイコンタップでスクロールさせるためのラッパークラス
    private var isRoot: Bool = false
    private var currentItemIndex: Int = -1
    private var nextItemIndex: Int = -1
    
    override func loadView() {
        super.loadView()
        delegate = self
    }
    
    static func assemble(_ viewControllers: [UIViewController]) -> ItemTapScrollTabController {
        let viewController = ItemTapScrollTabController()
        viewController.setViewControllers(viewControllers, animated: false)
        return viewController
    }
}

extension ItemTapScrollTabController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        currentItemIndex = tabBarController.selectedIndex
        if let nav = viewController as? UINavigationController,
           let current = nav.visibleViewController,
           let currentStackIdx = nav.viewControllers.firstIndex(of: current) {
            isRoot = currentStackIdx == 0
        }
        return true
    }
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        nextItemIndex = tabBarController.selectedIndex
        guard currentItemIndex == nextItemIndex, isRoot else { return }
        if let nav = viewController as? UINavigationController,
           let current = nav.visibleViewController,
           let scrollable = current as? Scrollable {
            scrollable.scrollToTop()
        }
    }
}
