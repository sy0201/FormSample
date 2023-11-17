//
//  MyView.swift
//  PRUGIO
//
//  Created by siyeon park on 2023/11/08.
//

import UIKit
import SnapKit

class MainView: BaseView {
    private let backgroundImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "icMain")
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()

    let gradationView = UIView()
    let titleView = UIView()

    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = FontFamily.NotoSansKR.bold.font(size: 15)
        titleLabel.textColor = .white
        titleLabel.text = "사전확인"
        return titleLabel
    }()

    private let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.numberOfLines = 0
        //descriptionLabel.font = BaseConst.FONT_LIGHT_26
        descriptionLabel.textColor = .white
        descriptionLabel.text = "환영합니다!입주에 한 발 다가가기 위한 사전확인 신청을 시작해봅시다!"
        return descriptionLabel
    }()

    private let selectedView: UIView = {
        let selectedView = UIView()
        selectedView.layer.cornerRadius = 8
        selectedView.backgroundColor = .white
        return selectedView
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
        pinImage.image = UIImage(named: "icMapPin")
        pinImage.contentMode = .scaleAspectFit
        return pinImage
    }()

    let apartmentLabel: UILabel = {
        let apartmentLabel = UILabel()
        //apartmentLabel.font = BaseConst.FONT_MEDIUM_15
        //apartmentLabel.textColor = BaseConst.COLOR_GRAY_2D3338
        apartmentLabel.text = "단지선택"
        return apartmentLabel
    }()

    private let arrowImage: UIImageView = {
        let arrowImage = UIImageView()
        arrowImage.image = UIImage(named: "icArrowDown")
        return arrowImage
    }()

    lazy var apartmentButton = UIButton()

    lazy var applicationButton: UIButton = {
        let applicationButton = UIButton()
        applicationButton.layer.cornerRadius = 26
        //applicationButton.backgroundColor = BaseConst.COLOR_GREEN_799069
        //applicationButton.titleLabel?.font = BaseConst.FONT_BOLD_15
        applicationButton.setTitleColor(.white, for: .normal)
        applicationButton.setTitle("사전확인신청", for: .normal)
        applicationButton.isHidden = true
        return applicationButton
    }()

    override func setupUI() {

        addSubviews([backgroundImageView,
                     gradationView,
                     titleView,
                     titleLabel,
                     descriptionLabel,
                     selectedView,
                     applicationButton
                    ])

        selectedView.addSubviews([stackView,
                                  arrowImage,
                                  apartmentButton
                                 ])
    }

    override func setupConstraint() {
        stackView.addArrangedSubviews([pinImage,
                                       apartmentLabel
                                      ])

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

        selectedView.snp.makeConstraints { make in
            make.leading.equalTo(snp.leading).offset(24.5)
            make.trailing.equalTo(snp.trailing).offset(-23.5)
            make.top.equalTo(descriptionLabel.snp.bottom).offset(40)
            make.height.equalTo(54)
        }

        apartmentButton.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        stackView.snp.makeConstraints { make in
            make.leading.equalTo(selectedView.snp.leading).offset(16)
            make.top.equalTo(selectedView.snp.top).offset(15)
            make.bottom.equalTo(selectedView.snp.bottom).offset(-15)
        }

        arrowImage.snp.makeConstraints { make in
            make.right.equalTo(selectedView.snp.right).offset(-16)
            make.centerY.equalTo(selectedView.snp.centerY)
            make.width.equalTo(20)
            make.height.equalTo(20)

        }

        applicationButton.snp.makeConstraints { make in
            make.leading.equalTo(snp.leading).offset(42)
            make.trailing.equalTo(snp.trailing).offset(-43)
            make.bottom.equalTo(snp.bottom).offset(-100)
            make.height.equalTo(54)
        }
    }
}
