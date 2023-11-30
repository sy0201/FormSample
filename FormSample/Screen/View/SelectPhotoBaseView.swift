//
//  SelectPhotoBaseView.swift
//  FormSample
//
//  Created by siyeon park on 2023/11/27.
//

import UIKit
import SnapKit

final class SelectPhotoBaseView: BaseView {

    private let mainView = UIView()
    private let titleView = UIView()
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = FontFamily.NotoSansKR.bold.font(size: 16)
        titleLabel.textColor = Asset.Color.black.color
        titleLabel.text = L10n.formMessage10
        return titleLabel
    }()
    let dismissButton: UIButton = {
        let dismissButton = UIButton()
        dismissButton.setImage(UIImage(named: Asset.Icon.icClose.name), for: .normal)
        dismissButton.imageEdgeInsets = .init(top: 0, left: 336, bottom: 0, right: 0)
        return dismissButton
    }()

    private let middleView = UIView()
    private let contentBackView: UIView = {
        let backgroundView = UIView()
        backgroundView.layer.cornerRadius = 4
        backgroundView.backgroundColor = Asset.Color.grayF8F9F8.color
        return backgroundView
    }()
    private let contentLabel: UILabel = {
        let contentLabel = UILabel()
        contentLabel.font = FontFamily.NotoSansKR.regular.font(size: 13)
        contentLabel.textColor = Asset.Color.green0F4F51.color
        contentLabel.text = "근접 사진과 원경 사진을 첨부하시면 하자를 정확히 확인하는데 큰 도움이 됩니다."
        contentLabel.numberOfLines = 0
        return contentLabel
    }()

    let attachPhotoView: UIView = UIView()
    let attachPhotoStackView: UIStackView = {
        let attachPhotoStackView = UIStackView()
        attachPhotoStackView.axis = .horizontal
        attachPhotoStackView.alignment = .fill
        attachPhotoStackView.distribution = .fillEqually
        attachPhotoStackView.spacing = 10
        return attachPhotoStackView
    }()

    let cameraView: UIView = {
        let cameraView = UIView()
        cameraView.backgroundColor = Asset.Color.grayF4F5F6.color
        return cameraView
    }()
    let cameraButton = UIButton()
    let cameraStackView: UIStackView = {
        let cameraStackView = UIStackView()
        cameraStackView.axis = .vertical
        cameraStackView.alignment = .center
        cameraStackView.distribution = .fillEqually
        cameraStackView.spacing = 4
        return cameraStackView
    }()
    let cameraIconView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Asset.Icon.icCamera.image
        return imageView
    }()
    let cameraLabel: UILabel = {
        let cameraLabel = UILabel()
        cameraLabel.font = FontFamily.NotoSansKR.regular.font(size: 15)
        cameraLabel.textColor = Asset.Color.gray2D3338.color
        cameraLabel.text = L10n.formMessage20
        return cameraLabel
    }()

    let albumView: UIView = {
        let albumView = UIView()
        albumView.backgroundColor = Asset.Color.grayF4F5F6.color
        return albumView
    }()
    let albumStackView: UIStackView = {
        let albumStackView = UIStackView()
        albumStackView.axis = .vertical
        albumStackView.alignment = .center
        albumStackView.distribution = .fillEqually
        albumStackView.spacing = 4
        return albumStackView
    }()
    let albumaIconView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Asset.Icon.icImage.image
        return imageView
    }()
    let albumLabel: UILabel = {
        let albumLabel = UILabel()
        albumLabel.font = FontFamily.NotoSansKR.regular.font(size: 15)
        albumLabel.textColor = Asset.Color.gray2D3338.color
        albumLabel.text = L10n.formMessage21
        return albumLabel
    }()
    let albumButton = UIButton()

    override func setupUI() {
        addSubviews([mainView,
                     titleView,
                     dismissButton,
                     middleView,
                     attachPhotoView])
        mainView.addSubviews([titleView])
        middleView.addSubviews([contentBackView, contentLabel])
        titleView.addSubview(titleLabel)

        attachPhotoView.addSubview(attachPhotoStackView)
        attachPhotoStackView.addArrangedSubviews([cameraView, albumView])
        cameraView.addSubviews([cameraStackView, cameraButton])
        cameraStackView.addArrangedSubviews([cameraIconView, cameraLabel])

        albumView.addSubviews([albumStackView, albumButton])
        albumStackView.addArrangedSubviews([albumaIconView, albumLabel])
    }

    override func setupConstraint() {
        mainView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        titleView.snp.makeConstraints { make in
            make.leading.trailing.top.equalTo(mainView)
        }

        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(titleView).inset(24)
            make.top.bottom.equalTo(titleView).inset(22)
        }

        dismissButton.snp.makeConstraints { make in
            make.edges.equalTo(titleView)
        }

        middleView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(mainView)
            make.top.equalTo(titleView.snp.bottom)
        }

        contentBackView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(middleView).inset(24)
            make.top.bottom.equalTo(middleView)
        }

        contentLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(contentBackView).inset(16)
            make.top.bottom.equalTo(contentBackView).inset(8)
        }

        attachPhotoView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(mainView)
            make.top.equalTo(middleView.snp.bottom)
        }

        attachPhotoStackView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(mainView).inset(24)
            make.top.bottom.equalTo(attachPhotoView).offset(16)
        }

        cameraView.snp.makeConstraints { make in
            make.height.equalTo(130)
        }
        cameraStackView.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(cameraView)
        }
        cameraButton.snp.makeConstraints { make in
            make.edges.equalTo(cameraView)
        }

        albumView.snp.makeConstraints { make in
            make.height.equalTo(130)
        }
        albumStackView.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(albumView)
        }
        albumButton.snp.makeConstraints { make in
            make.edges.equalTo(albumView)
        }
    }
}
