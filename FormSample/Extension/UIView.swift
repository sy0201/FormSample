//
//  UIView.swift
//  FormSample
//
//  Created by siyeon park on 2023/11/17.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach { self.addSubview($0) }
    }
    
}
