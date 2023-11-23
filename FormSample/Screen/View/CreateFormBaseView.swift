//
//  CreateFormBaseView.swift
//  FormSample
//
//  Created by siyeon park on 2023/11/23.
//

import UIKit
import SnapKit

final class CreateFormBaseView: BaseView {

    private let mainView = UIView()
    private let titleView = UIView()
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = FontFamily.NotoSansKR.bold.font(size: 16)
        titleLabel.textColor = Asset.Color.black.color
        titleLabel.text = L10n.formMessage2
        return titleLabel
    }()
    private let titleLineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = Asset.Color.black.color
        return lineView
    }()

    private let localView = UIView()
    private let localTitleLabel: UILabel = {
        let localTitleLabel = UILabel()
        localTitleLabel.font = FontFamily.NotoSansKR.regular.font(size: 14)
        localTitleLabel.textColor = Asset.Color.gray2D3338.color
        localTitleLabel.text = L10n.formMessage9
        return localTitleLabel
    }()

    private let localLabel: UILabel = {
        let localLabel = UILabel()
        localLabel.font = FontFamily.NotoSansKR.bold.font(size: 14)
        localLabel.textColor = Asset.Color.green458E8F.color
        localLabel.text = "거실"
        return localLabel
    }()

    let localStackView: UIStackView = {
        let localStackView = UIStackView()
        localStackView.axis = .vertical
        localStackView.alignment = .leading
        localStackView.distribution = .fillProportionally
        localStackView.spacing = 0
        return localStackView
    }()

    let localButton: UIButton = {
        let localButton = UIButton()
        localButton.setImage(UIImage(named: Asset.Icon.icArrowDefault.name), for: .normal)
        return localButton
    }()

    private let localLineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = Asset.Color.grayEEF1F3.color
        return lineView
    }()

    private let defectiveView = UIView()
    private let defectiveTitleLabel: UILabel = {
        let defectiveTitleLabel = UILabel()
        defectiveTitleLabel.font = FontFamily.NotoSansKR.regular.font(size: 14)
        defectiveTitleLabel.textColor = Asset.Color.gray2D3338.color
        defectiveTitleLabel.text = L10n.formMessage15
        return defectiveTitleLabel
    }()

    private let defectiveLabel: UILabel = {
        let defectiveLabel = UILabel()
        defectiveLabel.font = FontFamily.NotoSansKR.bold.font(size: 14)
        defectiveLabel.textColor = Asset.Color.green458E8F.color
        defectiveLabel.text = "거실 아트월 하단 스위치/콘센트 고정 (부착) 불량"
        defectiveLabel.numberOfLines = 0
        return defectiveLabel
    }()

    let defectiveStackView: UIStackView = {
        let defectiveStackView = UIStackView()
        defectiveStackView.axis = .vertical
        defectiveStackView.alignment = .leading
        defectiveStackView.distribution = .fill
        defectiveStackView.spacing = 0
        return defectiveStackView
    }()

    private let defectiveLineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = Asset.Color.grayEEF1F3.color
        return lineView
    }()

    let defectiveButton: UIButton = {
        let defectiveButton = UIButton()
        defectiveButton.setImage(UIImage(named: Asset.Icon.icArrowDefault.name), for: .normal)
        return defectiveButton
    }()



    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraint()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setupUI() {
        addSubviews([mainView, titleView, localView, defectiveView, localStackView, defectiveStackView])
        titleView.addSubviews([titleLabel, titleLineView])

        localView.addSubviews([localStackView, localLineView, localButton])
        localStackView.addArrangedSubviews([localTitleLabel, localLabel])

        defectiveView.addSubviews([defectiveStackView, defectiveLineView, defectiveButton])
        defectiveStackView.addArrangedSubviews([defectiveTitleLabel, defectiveLabel])
    }

    override func setupConstraint() {
        mainView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(22)
            make.leading.trailing.bottom.equalToSuperview()
        }
        titleView.snp.makeConstraints { make in
            make.leading.trailing.top.equalTo(mainView)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(22)
            make.centerX.equalTo(titleView.snp.centerX)
        }

        titleLineView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(titleView).inset(24)
            make.bottom.equalTo(titleView).offset(0)
            make.height.equalTo(2)
        }

        localView.snp.makeConstraints { make in
            make.top.equalTo(titleView.snp.bottom)
            make.leading.trailing.equalTo(mainView)
        }

        localStackView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(localView).inset(24)
            make.top.bottom.equalTo(localView).inset(16)
        }

        localLineView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(localView).inset(24)
            make.bottom.equalTo(localView.snp.bottom).offset(0)
            make.height.equalTo(1)
        }

        localButton.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalTo(localView).inset(0)
        }

        defectiveView.snp.makeConstraints { make in
            make.top.equalTo(localView.snp.bottom).offset(0)
            make.leading.trailing.equalTo(mainView)
        }

        defectiveStackView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(defectiveView).inset(24)
            make.top.bottom.equalTo(defectiveView).inset(16)
        }

        defectiveLineView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(defectiveView).inset(24)
            make.bottom.equalTo(defectiveView.snp.bottom).offset(0)
            make.height.equalTo(1)
        }

        defectiveButton.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalTo(defectiveView).inset(0)
        }
    }
}
