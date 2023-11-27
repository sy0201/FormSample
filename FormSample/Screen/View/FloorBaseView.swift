//
//  FloorBaseView.swift
//  FormSample
//
//  Created by siyeon park on 2023/11/27.
//

import UIKit
import SnapKit

final class FloorBaseView: BaseView {
    
    private let mainView = UIView()

    let dismissButton: UIButton = {
        let dismissButton = UIButton()
        dismissButton.setImage(UIImage(named: Asset.Icon.icClose.name), for: .normal)
        dismissButton.imageEdgeInsets = .init(top: 0, left: 336, bottom: 0, right: 0)
        return dismissButton
    }()

    private let floorImage: UIImageView = {
        let floorImage = UIImageView()
        floorImage.image = Asset.Icon.icPresent.image
        floorImage.contentMode = .scaleAspectFill
        return floorImage
    }()

    override init(frame: CGRect) {
        super .init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setupUI() {
        addSubview(mainView)
        mainView.addSubviews([dismissButton, floorImage])
    }

    override func setupConstraint() {
        mainView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        dismissButton.snp.makeConstraints { make in
            make.leading.trailing.top.equalTo(mainView)
            make.height.equalTo(56)
        }

        floorImage.snp.makeConstraints { make in
            make.leading.trailing.equalTo(mainView).inset(7.5)
            make.top.equalTo(mainView.snp.bottom).offset(85)
            make.centerY.equalTo(mainView.snp.centerY)
            make.height.equalTo(471)
        }
    }
}
