//
//  SelectApartmentTableViewCell.swift
//  FormSample
//
//  Created by siyeon park on 2023/11/20.
//

import UIKit
import SnapKit

final class SelectApartmentTableViewCell: UITableViewCell, ReuseIdentifying {

    let selectImg: UIImageView = {
        let selectImg = UIImageView()
        selectImg.image = Asset.Icon.icRadioOff.image
        selectImg.bounds.size.height = 24
        return selectImg
    }()

    let selectApartmentLabel: UILabel = {
        let selectApartmentLabel = UILabel()
        selectApartmentLabel.font = FontFamily.NotoSansKR.regular.font(size: 16)
        selectApartmentLabel.textColor = Asset.Color.black.color
        return selectApartmentLabel
    }()

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.spacing = 16
        return stackView
    }()

    var isRadio: Bool = false {
        didSet {
            self.changeState()
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraint()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SelectApartmentTableViewCell {
    func setupUI() {
        selectionStyle = .none
        addSubviews([stackView])
        stackView.addArrangedSubviews([selectImg, selectApartmentLabel])
    }

    func setupConstraint() {
        stackView.snp.makeConstraints { make in
            make.leading.equalTo(snp.leading).offset(24)
            make.top.equalTo(snp.top).offset(12)
            make.bottom.equalTo(snp.bottom).offset(-12)
        }
    }

    func configure(with data: String) {
        selectApartmentLabel.text = data
    }

    func setOn(isRadio: Bool) {
        self.isRadio = isRadio
    }

    func changeState() {
        selectImg.image = isRadio ? Asset.Icon.icRadioOn.image : Asset.Icon.icRadioOff.image
    }
}
