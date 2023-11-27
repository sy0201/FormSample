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

    let zoomInView: UIView = {
        let zoomInView = UIView()
        zoomInView.backgroundColor = Asset.Color.grayF4F5F6.color
        return zoomInView
    }()
    let zoomInImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        return imageView
    }()

    let zoomInButton = UIButton()

    let zoomOutView: UIView = {
        let zoomOutView = UIView()
        zoomOutView.backgroundColor = Asset.Color.grayF4F5F6.color
        return zoomOutView
    }()
    let zoomOutImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        return imageView
    }()
    let zoomOutButton = UIButton()

    let attachPhotoStackView: UIStackView = {
        let attachPhotoStackView = UIStackView()
        attachPhotoStackView.axis = .horizontal
        attachPhotoStackView.alignment = .fill
        attachPhotoStackView.distribution = .fillEqually
        attachPhotoStackView.spacing = 10
        return attachPhotoStackView
    }()

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
        attachPhotoStackView.addArrangedSubviews([zoomInView, zoomOutView])
        zoomInView.addSubviews([zoomInImageView, zoomInButton])
        zoomOutView.addSubviews([zoomOutImageView, zoomOutButton])
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

        zoomInView.snp.makeConstraints { make in
            make.height.equalTo(130)
        }

        zoomOutView.snp.makeConstraints { make in
            make.height.equalTo(130)
        }

        zoomInImageView.snp.makeConstraints { make in
            make.edges.equalTo(zoomInView)
        }

        zoomOutImageView.snp.makeConstraints { make in
            make.edges.equalTo(zoomOutView)
        }

        zoomInButton.snp.makeConstraints { make in
            make.edges.equalTo(zoomInImageView)
        }

        zoomOutButton.snp.makeConstraints { make in
            make.edges.equalTo(zoomOutImageView)
        }
    }
}
