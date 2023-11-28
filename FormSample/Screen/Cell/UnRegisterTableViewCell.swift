//
//  SelectRadioTableViewCell.swift
//  FormSample
//
//  Created by siyeon park on 2023/11/20.
//

import UIKit
import SnapKit

final class UnRegisterTableViewCell: UITableViewCell, ReuseIdentifying {

    var isCheckRegister: Bool = false {
        didSet {
            self.changeState()
        }
    }

    let mainView = UIView()
    let selectImg: UIImageView = {
        let selectImg = UIImageView()
        selectImg.image = Asset.Icon.icCheckboxOff.image
        return selectImg
    }()

    private let labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.spacing = 4
        return stackView
    }()
    let locationLabel: UILabel = {
        let locationLabel = UILabel()
        locationLabel.font = FontFamily.NotoSansKR.medium.font(size: 15)
        locationLabel.textColor = Asset.Color.black.color
        locationLabel.text = "드레스룸"
        return locationLabel
    }()
    let checkButton = UIButton()

    private let countStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.spacing = 4
        return stackView
    }()
    let locationCountLabel: UILabel = {
        let locationCountLabel = UILabel()
        locationCountLabel.font = FontFamily.NotoSansKR.bold.font(size: 15)
        locationCountLabel.textColor = Asset.Color.green458E8F.color
        locationCountLabel.text = "3"
        return locationCountLabel
    }()

    let selectLocationCountLabel: UILabel = {
        let selectLocationCountLabel = UILabel()
        selectLocationCountLabel.font = FontFamily.NotoSansKR.regular.font(size: 16)
        selectLocationCountLabel.textColor = Asset.Color.green458E8F.color
        selectLocationCountLabel.text = "(3)"
        return selectLocationCountLabel
    }()

    let rightStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.spacing = 0
        return stackView
    }()

    let selectDeleteLabel: UILabel = {
        let selectDeleteLabel = UILabel()
        selectDeleteLabel.font = FontFamily.NotoSansKR.bold.font(size: 13)
        selectDeleteLabel.textColor = Asset.Color.grayCDD1D4.color
        selectDeleteLabel.text = "선택삭제"
        return selectDeleteLabel
    }()
    let moreDetailImg: UIImageView = {
        let moreImg = UIImageView()
        moreImg.image = Asset.Icon.icArrowBottom.image
        return moreImg
    }()
    let rightButton = UIButton()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraint()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UnRegisterTableViewCell {
    func setupUI() {
        selectionStyle = .none
        addSubviews([mainView, labelStackView, countStackView, rightStackView])
        mainView.addSubviews([selectImg, checkButton, labelStackView, rightStackView, rightButton])

        labelStackView.addArrangedSubviews([locationLabel, countStackView])
        countStackView.addArrangedSubviews([locationCountLabel, selectLocationCountLabel])
        rightStackView.addArrangedSubviews([selectDeleteLabel, moreDetailImg])
    }

    func setupConstraint() {
        mainView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        selectImg.snp.makeConstraints { make in
            make.leading.equalTo(mainView).offset(24)
            make.top.bottom.equalTo(mainView).inset(18)
            make.height.equalTo(24)
        }

        checkButton.snp.makeConstraints { make in
            make.leading.top.bottom.equalTo(mainView)
        }

        labelStackView.snp.makeConstraints { make in
            make.leading.equalTo(selectImg.snp.trailing).offset(8)
            make.trailing.equalTo(checkButton.snp.trailing)
            make.centerY.equalTo(selectImg.snp.centerY)
        }

        rightStackView.snp.makeConstraints { make in
            make.trailing.equalTo(mainView.snp.trailing).inset(24)
            make.centerY.equalTo(mainView.snp.centerY)
        }

        rightButton.snp.makeConstraints { make in
            make.trailing.top.bottom.equalTo(mainView)
            make.leading.equalTo(rightStackView)
        }
    }

    func configure(with data: String) {
        locationLabel.text = data
    }

    func setOn(isCheckRegister: Bool) {
        self.isCheckRegister = isCheckRegister
    }

    func changeState() {
        selectImg.image = isCheckRegister ? Asset.Icon.icCheckboxOn.image : Asset.Icon.icCheckboxOff.image
    }
}
