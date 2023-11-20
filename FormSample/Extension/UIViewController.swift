//
//  UIViewController.swift
//  PrugioClone
//
//  Created by siyeon park on 2023/09/25.
//

import UIKit


extension UIViewController {

    var isModal: Bool {

        if let index = navigationController?.viewControllers.firstIndex(of: self), index > 0 {

            return false
        } else if presentingViewController != nil {

            return true
        } else if let navigationController = navigationController, navigationController.presentingViewController?.presentedViewController == navigationController {

            return true
        } else if let tabBarController = tabBarController, tabBarController.presentingViewController is UITabBarController {

            return true
        } else {

            return false
        }
    }
}
