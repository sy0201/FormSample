//
//  MyView.swift
//  PRUGIO
//
//  Created by siyeon park on 2023/11/08.
//

import UIKit
import SnapKit

final class MainView: BaseView {
    
    private let backgroundImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = Asset.Icon.icMain.image
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()

    let gradationView = UIView()
    let titleView = UIView()

    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = FontFamily.NotoSansKR.bold.font(size: 15)
        titleLabel.textColor = Asset.Color.white.color
        titleLabel.text = L10n.preConfirmation
        return titleLabel
    }()

    private let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = FontFamily.NotoSansKR.light.font(size: 26)
        descriptionLabel.textColor = Asset.Color.white.color
        descriptionLabel.text = L10n.mainMessage1
        return descriptionLabel
    }()

    private let selectApartmentView: UIView = {
        let selectApartmentView = UIView()
        selectApartmentView.layer.cornerRadius = 8
        selectApartmentView.backgroundColor = Asset.Color.white.color
        return selectApartmentView
    }()

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 4
        return stackView
    }()

    private let pinImage: UIImageView = {
        let pinImage = UIImageView()
        pinImage.image = Asset.Icon.icMapPin.image
        pinImage.contentMode = .scaleAspectFit
        pinImage.bounds.size.width = 16
        return pinImage
    }()

    let apartmentComplexLabel: UILabel = {
        let apartmentComplexLabel = UILabel()
        apartmentComplexLabel.font = FontFamily.NotoSansKR.medium.font(size: 15)
        apartmentComplexLabel.textColor = Asset.Color.gray2D3338.color
        apartmentComplexLabel.text = L10n.selectApartmentComplex
        return apartmentComplexLabel
    }()

    private let arrowImage: UIImageView = {
        let arrowImage = UIImageView()
        arrowImage.image = Asset.Icon.icArrowBottom.image
        return arrowImage
    }()

    lazy var selectApartmentButton = UIButton()

    lazy var requestPreConfirmationButton: UIButton = {
        let applicationButton = UIButton()
        applicationButton.layer.cornerRadius = 26
        applicationButton.backgroundColor = Asset.Color.green799069.color
        applicationButton.titleLabel?.font = FontFamily.NotoSansKR.bold.font(size: 15)
        applicationButton.setTitleColor(Asset.Color.white.color, for: .normal)
        applicationButton.setTitle(L10n.requestPreConfirmation, for: .normal)
        applicationButton.isHidden = true
        return applicationButton
    }()

    override func setupUI() {
        addSubviews([backgroundImageView,
                     gradationView,
                     titleView,
                     titleLabel,
                     descriptionLabel,
                     selectApartmentView,
                     requestPreConfirmationButton
                    ])

        selectApartmentView.addSubviews([stackView, arrowImage, selectApartmentButton])

        stackView.addArrangedSubviews([pinImage, apartmentComplexLabel])
    }

    override func setupConstraint() {
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        gradationView.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(400)
        }

        titleView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalTo(snp.top).offset(34)
        }

        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(titleView.snp.leading).offset(16)
            make.trailing.equalTo(titleView.snp.trailing).offset(-16)
            make.top.equalTo(titleView.snp.top).offset(16)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalTo(titleView.snp.leading).offset(32)
            make.trailing.equalTo(titleView.snp.trailing).offset(-56)
            make.top.equalTo(titleLabel.snp.bottom).offset(56)
            make.bottom.equalTo(titleView.snp.bottom).offset(0)
        }

        selectApartmentView.snp.makeConstraints { make in
            make.leading.equalTo(snp.leading).offset(24.5)
            make.trailing.equalTo(snp.trailing).offset(-23.5)
            make.top.equalTo(descriptionLabel.snp.bottom).offset(40)
            make.height.equalTo(54)
        }

        selectApartmentButton.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        stackView.snp.makeConstraints { make in
            make.leading.equalTo(selectApartmentView.snp.leading).offset(16)
            make.trailing.lessThanOrEqualTo(arrowImage.snp.leading).offset(-16)
            make.top.equalTo(selectApartmentView.snp.top).offset(15)
            make.bottom.equalTo(selectApartmentView.snp.bottom).offset(-15)
        }

        arrowImage.snp.makeConstraints { make in
            make.right.equalTo(selectApartmentView.snp.right).offset(-16)
            make.centerY.equalTo(selectApartmentView.snp.centerY)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        
        requestPreConfirmationButton.snp.makeConstraints { make in
            make.leading.equalTo(snp.leading).offset(42)
            make.trailing.equalTo(snp.trailing).offset(-43)
            make.bottom.equalTo(snp.bottom).offset(-100)
            make.height.equalTo(54)
        }
    }
}
