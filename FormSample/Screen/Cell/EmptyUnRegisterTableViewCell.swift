//
//  ApplicationFormTopTableViewCell.swift
//  FormSample
//
//  Created by siyeon park on 2023/11/21.
//

import UIKit
import SnapKit

final class EmptyUnRegisterTableViewCell: UITableViewCell, ReuseIdentifying {

    let mainView: UIView = {
        let mainView = UIView()
        mainView.backgroundColor = Asset.Color.white.color
        mainView.layer.shadowPath = UIBezierPath(roundedRect: mainView.bounds, cornerRadius: 4).cgPath
        mainView.layer.cornerRadius = 10
        mainView.layer.shadowOpacity = 0.1
        mainView.layer.shadowColor = UIColor.black.cgColor
        mainView.layer.shadowOffset = CGSize(width: 0, height: 0)
        mainView.layer.shadowRadius = 4
        return mainView
    }()
    private let setView = UIView()
    private let chatAppImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.image = UIImage(named: Asset.Icon.icChatapp.name)
        return image
    }()

    private let labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        return stackView
    }()

    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textAlignment = .center
        titleLabel.font = FontFamily.NotoSansKR.bold.font(size: 16)
        titleLabel.textColor = Asset.Color.black.color
        titleLabel.text = "미접수 내역이 없습니다."
        return titleLabel
    }()
    private let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.textAlignment = .center
        descriptionLabel.font = FontFamily.NotoSansKR.regular.font(size: 14)
        descriptionLabel.textColor = Asset.Color.black.color
        descriptionLabel.text = "하자가 있으세요? 그럼 신청서 작성 메뉴에서 내용을 입력해주세요!"
        descriptionLabel.numberOfLines = 0
        return descriptionLabel
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

extension EmptyUnRegisterTableViewCell {
    func setupUI() {
        contentView.backgroundColor = Asset.Color.backgroundF7F2EF.color
        addSubviews([mainView])
        mainView.addSubviews([setView, chatAppImage])
        setView.addSubviews([chatAppImage, labelStackView])
        labelStackView.addArrangedSubviews([titleLabel, descriptionLabel])
    }

    func setupConstraint() {
        mainView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.bottom.equalToSuperview().inset(24)
        }

        setView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalTo(mainView)
        }

        chatAppImage.snp.makeConstraints { make in
            make.top.equalTo(setView).inset(216)
            make.centerX.equalTo(setView)
        }

        labelStackView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(setView).inset(60)
            make.top.equalTo(chatAppImage.snp.bottom).offset(24)
            make.bottom.equalTo(setView).inset(206)
        }
    }
}
