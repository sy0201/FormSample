//
//  CreateFormTableViewCell.swift
//  FormSample
//
//  Created by siyeon park on 2023/11/22.
//

import UIKit
import SnapKit

final class CreateFormTableViewCell: UITableViewCell, ReuseIdentifying {

    var createFormCellButtonAction: (() -> Void)?

    private let mainView = UIView()
    private let imgView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.image = UIImage(named: Asset.Icon.icExample.name)
        return image
    }()

    let createFormButton: UIButton = {
        let createFormButton = UIButton()
        createFormButton.backgroundColor = Asset.Color.green0F4F51.color
        createFormButton.titleLabel?.font = FontFamily.NotoSansKR.bold.font(size: 15)
        createFormButton.setTitle("작성하기", for: .normal)
        return createFormButton
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraint()
        setupActions()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        imgView.layer.cornerRadius = 16
        createFormButton.layer.cornerRadius = 26
    }
}

private extension CreateFormTableViewCell {
    func setupUI() {
        selectionStyle = .none
        mainView.backgroundColor = Asset.Color.backgroundF7F2EF.color
        contentView.addSubviews([mainView, imgView, createFormButton])
    }

    func setupConstraint() {
        mainView.snp.makeConstraints { make in
            make.left.right.top.equalTo(contentView)
            make.bottom.equalTo(contentView.snp.bottom).offset(34)
        }

        imgView.snp.makeConstraints { make in
            make.leading.equalTo(mainView.snp.leading).offset(24)
            make.trailing.equalTo(mainView.snp.trailing).offset(-24)
            make.top.equalTo(mainView.snp.top).offset(0)
            make.bottom.equalTo(mainView.snp.bottom).offset(-43)
        }

        createFormButton.snp.makeConstraints { make in
            make.leading.equalTo(imgView.snp.leading).offset(16)
            make.trailing.equalTo(imgView.snp.trailing).offset(-16)
            make.bottom.equalTo(mainView.snp.bottom).offset(-67)
            make.height.equalTo(54)
        }
    }

    func setupActions() {
        createFormButton.addTarget(self, action: #selector(createFormButtonTapped), for: .touchUpInside)
    }

    @objc func createFormButtonTapped() {
        createFormCellButtonAction?()
    }
}
