//
//  RequiredSelectionBaseView.swift
//  FormSample
//
//  Created by siyeon park on 2023/11/24.
//

import UIKit

class RequiredSelectionBaseView: UIView {

    private let titleView = UIView()
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = FontFamily.NotoSansKR.bold.font(size: 16)
        titleLabel.textColor = Asset.Color.black.color
        titleLabel.text = L10n.formMessage10
        return titleLabel
    }()
    let dismissButton: UIButton = {
        let dismissButton = UIButton()
        return dismissButton
    }()
}
