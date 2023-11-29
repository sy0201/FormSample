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
        //mainView.backgroundColor = Asset.Color.white.color
        mainView.backgroundColor = Asset.Color.green799069.color
        mainView.layer.cornerRadius = 10
        return mainView
    }()

    private let topView = UIView()
    let checkButton: UIButton = {
        let checkButton = UIButton()
        checkButton.setImage(UIImage(named: Asset.Icon.icCheckOff.name), for: .normal)
        return checkButton
    }()

    let topStackView: UIStackView = {
        let topStackView = UIStackView()
        topStackView.axis = .horizontal
        topStackView.alignment = .fill
        topStackView.distribution = .fillEqually
        topStackView.spacing = 8
        return topStackView
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

    let imgHiddenStackView: UIStackView = {
        let imgHiddenStackView = UIStackView()
        imgHiddenStackView.axis = .vertical
        imgHiddenStackView.alignment = .fill
        imgHiddenStackView.distribution = .fillProportionally
        imgHiddenStackView.spacing = 0
        return imgHiddenStackView
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
    let attachPhotoStackView: UIStackView = {
        let attachPhotoStackView = UIStackView()
        attachPhotoStackView.axis = .horizontal
        attachPhotoStackView.alignment = .fill
        attachPhotoStackView.distribution = .fillEqually
        attachPhotoStackView.spacing = 8
        return attachPhotoStackView
    }()
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
        imageView.backgroundColor = .systemPink
        return imageView
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
        addSubviews([mainView])
        mainView.addSubviews([topView, imgHiddenStackView])
        topView.addSubviews([checkButton, topStackView])
        topStackView.addArrangedSubviews([modifyButton, deleteButton])

        imgHiddenStackView.addArrangedSubviews([middleView, attachPhotoView])

        middleView.addSubview(defectiveLabel)
        attachPhotoView.addSubviews([attachPhotoStackView])
        attachPhotoStackView.addArrangedSubviews([zoomInImageView, zoomOutImageView])
    }
    func setupConstraint() {
        mainView.snp.makeConstraints { make in
            //make.edges.equalToSuperview().inset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalToSuperview().inset(24)
            make.bottom.equalTo(imgHiddenStackView.snp.bottom).offset(16)
        }

        topView.snp.makeConstraints { make in
            make.leading.trailing.top.equalTo(mainView)
            make.bottom.equalTo(mainView)
        }

        checkButton.snp.makeConstraints { make in
            make.leading.bottom.equalTo(topView).inset(16)
            make.top.equalTo(topView).inset(24)
        }

        topStackView.snp.makeConstraints { make in
            make.trailing.equalTo(topView).inset(16)
            make.centerY.equalTo(checkButton.snp.centerY)
        }

        imgHiddenStackView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(mainView)
            make.top.equalTo(topStackView.snp.bottom)
            make.bottom.equalTo(mainView)
        }

        middleView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(imgHiddenStackView)
            make.top.equalTo(imgHiddenStackView)
        }

        defectiveLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(middleView).inset(16)
            make.top.bottom.equalTo(middleView)
        }

        attachPhotoView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(imgHiddenStackView)
            make.top.equalTo(middleView.snp.bottom)
            make.bottom.equalTo(imgHiddenStackView).inset(16)
        }

        attachPhotoStackView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(attachPhotoView).inset(16)
        }

        zoomInImageView.snp.makeConstraints { make in
            make.width.height.equalTo(176)
        }

        zoomOutImageView.snp.makeConstraints { make in
            make.width.height.equalTo(176)
        }
    }
}
