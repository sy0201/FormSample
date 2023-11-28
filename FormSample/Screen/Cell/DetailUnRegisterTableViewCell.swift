//
//  SelectRadioTableViewCell.swift
//  FormSample
//
//  Created by siyeon park on 2023/11/20.
//

import UIKit
import SnapKit

final class DetailUnRegisterTableViewCell: UITableViewCell, ReuseIdentifying {

    let mainView: UIView = {
        let mainView = UIView()
        mainView.backgroundColor = Asset.Color.white.color
        mainView.layer.cornerRadius = 10
        return mainView
    }()

    let imgHiddenStackView: UIStackView = {
        let topStackView = UIStackView()
        topStackView.axis = .vertical
        topStackView.alignment = .fill
        topStackView.distribution = .fillProportionally
        topStackView.spacing = 16
        return topStackView
    }()

    private let topView = UIView()
    let checkButton: UIButton = {
        let checkButton = UIButton()
        checkButton.setImage(UIImage(named: Asset.Icon.icCheckOff.name), for: .normal)
        return checkButton
    }()
    let modifyButton: UIButton = {
        let modifyButton = UIButton()
        modifyButton.titleLabel?.font = FontFamily.NotoSansKR.medium.font(size: 14)
        modifyButton.titleLabel?.textColor = Asset.Color.grayCDD1D4.color
        modifyButton.setTitle("수정하기", for: .normal)
        return modifyButton
    }()
    let deleteButton: UIButton = {
        let deleteButton = UIButton()
        deleteButton.setImage(UIImage(named: Asset.Icon.icGrayClose.name), for: .normal)
        return deleteButton
    }()
    let topStackView: UIStackView = {
        let topStackView = UIStackView()
        topStackView.axis = .horizontal
        topStackView.alignment = .fill
        topStackView.distribution = .fillEqually
        topStackView.spacing = 16
        return topStackView
    }()

    private let middleView = UIView()
    private let defectiveLabel: UILabel = {
        let defectiveLabel = UILabel()
        defectiveLabel.font = FontFamily.NotoSansKR.bold.font(size: 16)
        defectiveLabel.textColor = Asset.Color.black.color
        defectiveLabel.text = "거실 도배(벽) 들뜸/탈락 : 하자상태(찢김)"
        return defectiveLabel
    }()

    let attachPhotoView: UIView = UIView()

    let zoomInImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        imageView.backgroundColor = .yellow
        return imageView
    }()

    let zoomOutImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        imageView.backgroundColor = .yellow
        return imageView
    }()

    let attachPhotoStackView: UIStackView = {
        let attachPhotoStackView = UIStackView()
        attachPhotoStackView.axis = .horizontal
        attachPhotoStackView.alignment = .fill
        attachPhotoStackView.distribution = .fillEqually
        attachPhotoStackView.spacing = 10
        return attachPhotoStackView
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

extension DetailUnRegisterTableViewCell {
    func setupUI() {
        addSubviews([mainView,
                     topView,
                     imgHiddenStackView,
                     topStackView,
                     checkButton,
                     middleView,
                     attachPhotoView,
                     attachPhotoStackView])
        mainView.addSubviews([topView,
                              imgHiddenStackView,
                              middleView,
                              attachPhotoView,
                              attachPhotoStackView])
        imgHiddenStackView.addArrangedSubviews([topView,
                                        middleView,
                                        attachPhotoView])
        topView.addSubviews([checkButton,
                             topStackView,
                             defectiveLabel])
        topStackView.addArrangedSubviews([modifyButton, deleteButton])

        middleView.addSubviews([attachPhotoView, attachPhotoStackView])

        attachPhotoView.addSubview(attachPhotoStackView)
        attachPhotoStackView.addArrangedSubviews([zoomInImageView, zoomOutImageView])
    }

    func setupConstraint() {
        mainView.snp.makeConstraints { make in
            make.edges.top.bottom.equalToSuperview()
        }

        imgHiddenStackView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalTo(mainView)
        }

        topView.snp.makeConstraints { make in
            make.leading.trailing.top.equalTo(imgHiddenStackView)
        }

        checkButton.snp.makeConstraints { make in
            make.leading.equalTo(topView).inset(16)
            make.top.equalTo(topView).inset(27)
        }

        topStackView.snp.makeConstraints { make in
            make.trailing.equalTo(topView).inset(16)
            make.top.equalTo(topView).inset(27)
            make.centerY.equalTo(checkButton.snp.centerY)
        }

        middleView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(imgHiddenStackView)
            make.top.equalTo(topView.snp.bottom)
        }

        defectiveLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(middleView).inset(16)
            make.top.equalTo(middleView).offset(16)
            make.bottom.equalTo(middleView).offset(-16)
        }

        attachPhotoView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(imgHiddenStackView)
            make.top.equalTo(middleView.snp.bottom)
            make.bottom.equalTo(imgHiddenStackView).inset(16)
        }

        attachPhotoStackView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(imgHiddenStackView).inset(24)
            make.top.equalTo(attachPhotoView.snp.bottom).inset(16)
        }

        zoomInImageView.snp.makeConstraints { make in
            make.leading.equalTo(attachPhotoStackView).inset(16)
            make.top.bottom.equalTo(attachPhotoStackView).inset(16)
            make.height.equalTo(130)
        }

        zoomOutImageView.snp.makeConstraints { make in
            make.trailing.equalTo(attachPhotoStackView).inset(8)
            make.centerY.equalTo(zoomInImageView.snp.centerY)
            make.height.equalTo(130)
        }
    }
}
