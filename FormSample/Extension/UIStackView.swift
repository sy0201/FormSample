//
//  UIStackView.swift
//  PRUGIO
//
//  Created by siyeon park on 2023/11/08.
//

import UIKit

extension UIStackView {
    
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach { self.addArrangedSubview($0) }
    }
}
