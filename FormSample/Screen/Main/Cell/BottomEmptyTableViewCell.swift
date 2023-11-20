//
//  BottomEmptyTableViewCell.swift
//  FormSample
//
//  Created by siyeon park on 2023/11/20.
//

import UIKit
import SnapKit

final class BottomEmptyTableViewCell: UITableViewCell, ReuseIdentifying {

    let view = UIView()

    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = FontFamily.NotoSansKR.regular.font(size: 16)
        titleLabel.textColor = Asset.Color.gray9DA4AA.color
        titleLabel.text = L10n.mainMessage2
        return titleLabel
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraint()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BottomEmptyTableViewCell {
    func setupUI() {
        addSubviews([view, titleLabel])
    }

    func setupConstraint() {
        view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY)
        }
    }
}
