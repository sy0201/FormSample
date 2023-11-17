//
//  BaseView.swift
//  PRUGIO
//
//  Created by siyeon park on 2023/11/08.
//

import UIKit

class BaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraint()
        initSubviews()
        initConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupUI() {}
    func setupConstraint() {}
    func initSubviews() {}
    func initConstraints() {}
}
