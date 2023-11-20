//
//  UINavigationController.swift
//  PrugioClone
//
//  Created by siyeon park on 2023/09/25.
//

import UIKit


extension UINavigationController {

    func popViewController(animated: Bool = true, completion: @escaping () -> Void) {

        CATransaction.begin()
        CATransaction.setCompletionBlock {
            completion()
        }
        self.popViewController(animated: animated)
        CATransaction.commit()
    }
}
