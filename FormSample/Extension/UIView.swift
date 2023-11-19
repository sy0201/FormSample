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
    
    func gradationView(_ colors: [UIColor], rect: CGRect? = nil, _ isLeft: Bool = false) {
        let name = "gradientButtonBackground"

        for item in self.layer.sublayers ?? [] where item.name == name {
            item.removeFromSuperlayer()
        }

        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.name = name
        gradientLayer.frame = bounds
        gradientLayer.colors = colors.map { $0.cgColor }

        if isLeft {
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        } else {
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        }

        layer.addSublayer(gradientLayer)
    }
}
