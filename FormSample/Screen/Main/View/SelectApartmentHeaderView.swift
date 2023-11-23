//
//  SelectApartmentHeaderView.swift
//  FormSample
//
//  Created by siyeon park on 2023/11/20.
//

import UIKit
import SnapKit

final class SelectApartmentHeaderView: UITableViewHeaderFooterView, ReuseIdentifying {

    let titleView = UIView()
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = FontFamily.NotoSansKR.bold.font(size: 18)
        titleLabel.textColor = Asset.Color.black.color
        titleLabel.text = L10n.selectApartmentComplex
        return titleLabel
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraint()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupUI() {
        addSubviews([titleView, titleLabel])
    }

    func setupConstraint() {
        titleView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        titleLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(20)
            make.centerX.equalTo(titleView.snp.centerX)
        }
    }
}
