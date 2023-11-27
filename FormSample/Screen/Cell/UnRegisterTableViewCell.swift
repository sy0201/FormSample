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
    
    let selectImg: UIImageView = {
        let selectImg = UIImageView()
        selectImg.image = Asset.Icon.icCheckboxOff.image
        selectImg.bounds.size.height = 24
        return selectImg
    }()

    let selectItemLabel: UILabel = {
        let selectItemLabel = UILabel()
        selectItemLabel.font = FontFamily.NotoSansKR.regular.font(size: 16)
        selectItemLabel.textColor = Asset.Color.black.color
        return selectItemLabel
    }()

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.spacing = 16
        return stackView
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

extension UnRegisterTableViewCell {
    func setupUI() {
        selectionStyle = .none
        addSubviews([stackView])
        stackView.addArrangedSubviews([selectImg, selectItemLabel])
    }

    func setupConstraint() {
        stackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(24)
            make.top.bottom.equalToSuperview().inset(12)
        }

        selectImg.snp.makeConstraints { make in
            make.width.height.equalTo(24)
        }

        selectItemLabel.snp.makeConstraints { make in
            make.centerY.equalTo(selectImg.snp.centerY)
        }
    }

    func configure(with data: String) {
        selectItemLabel.text = data
    }

    func setOn(isCheckRegister: Bool) {
        self.isCheckRegister = isCheckRegister
    }

    func changeState() {
        selectImg.image = isCheckRegister ? Asset.Icon.icCheckboxOn.image : Asset.Icon.icCheckboxOff.image
    }
}
