//
//  ApplicationFormTopTableViewCell.swift
//  FormSample
//
//  Created by siyeon park on 2023/11/21.
//

import UIKit
import SnapKit

final class ApplicationFormTopTableViewCell: UITableViewCell, ReuseIdentifying {

    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = FontFamily.NotoSansKR.medium.font(size: 14)
        titleLabel.textColor = Asset.Color.black.color
        return titleLabel
    }()

    let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.font = FontFamily.NotoSansKR.regular.font(size: 14)
        descriptionLabel.textColor = Asset.Color.gray505C65.color
        descriptionLabel.numberOfLines = 0
        return descriptionLabel
    }()

    private let titleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.spacing = 0
        return stackView
    }()

    private let notAcceptedLabel: UILabel = {
        let notAcceptedLabel = UILabel()
        notAcceptedLabel.font = FontFamily.NotoSansKR.medium.font(size: 14)
        notAcceptedLabel.textColor = Asset.Color.black.color
        notAcceptedLabel.text = L10n.formMessage6
        return notAcceptedLabel
    }()

    let acceptedCountLabel: UILabel = {
        let acceptedCountLabel = UILabel()
        acceptedCountLabel.font = FontFamily.NotoSansKR.bold.font(size: 14)
        acceptedCountLabel.textColor = Asset.Color.green1A676A.color
        acceptedCountLabel.text = "0"
        return acceptedCountLabel
    }()

    private let caseLabel: UILabel = {
        let caseLabel = UILabel()
        caseLabel.font = FontFamily.NotoSansKR.medium.font(size: 14)
        caseLabel.textColor = Asset.Color.black.color
        caseLabel.text = L10n.formMessage7
        return caseLabel
    }()

    private let notAcceptStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .trailing
        stackView.distribution = .fillProportionally
        stackView.spacing = 0
        return stackView
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

extension ApplicationFormTopTableViewCell {
    func setupUI() {
        selectionStyle = .none
        self.backgroundColor = Asset.Color.backgroundF7F2EF.color
        addSubviews([titleStackView, notAcceptStackView])
        titleStackView.addArrangedSubviews([titleLabel, descriptionLabel])
        notAcceptStackView.addArrangedSubviews([notAcceptedLabel, acceptedCountLabel, caseLabel])
    }

    func setupConstraint() {
        titleStackView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview().inset(24)
        }

        notAcceptStackView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-24)
            make.top.equalTo(snp.top).offset(24)
        }
    }

    func setupConfiguration(_ tab: Enum.TabMenu) {
        if tab == .left {
            titleLabel.text = L10n.formMessage4
            descriptionLabel.text = L10n.formMessage5
            notAcceptStackView.isHidden = true
        } else if tab == .right {
            titleLabel.text = L10n.formMessage3
            descriptionLabel.text = L10n.formMessage8
            notAcceptStackView.isHidden = false
        }
    }
}
