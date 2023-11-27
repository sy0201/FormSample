//
//  LocationCollectionViewCell.swift
//  FormSample
//
//  Created by siyeon park on 2023/11/26.
//

import UIKit
import SnapKit

final class LocationCollectionViewCell: UICollectionViewCell, ReuseIdentifying {
    
    var locationCellButtonAction: (() -> Void)?
    var isSelectedLocation: Bool = false {
        didSet {
            self.changeState()
        }
    }
    private let mainView = UIView()
    let roundView: UIView = {
        let roundView = UIView()
        roundView.backgroundColor = Asset.Color.grayF4F5F6.color
        roundView.layer.cornerRadius = 4
        return roundView
    }()
    let locationLabel: UILabel = {
        let locationLabel = UILabel()
        locationLabel.font = FontFamily.NotoSansKR.regular.font(size: 14)
        locationLabel.textColor = Asset.Color.gray505C65.color
        return locationLabel
    }()
    let locationButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraint()
        setupButtonTapped()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButtonTapped() {
        locationButton.addTarget(self, action: #selector(locationCellTapped), for: .touchUpInside)
    }
    
    @objc func locationCellTapped() {
        isSelectedLocation = !isSelectedLocation
        locationCellButtonAction?()
    }
}

extension LocationCollectionViewCell {
    func setupUI() {
        addSubview(mainView)
        mainView.addSubviews([roundView, locationLabel, locationButton])
    }
    
    func setupConstraint() {
        mainView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        roundView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalTo(mainView)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
        
        locationLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(mainView)
        }
        
        locationButton.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalTo(mainView)
        }
    }
    
    func configure(with data: String, isSelected: Bool) {
        locationLabel.text = data
        setOn(isSelectedLocation: isSelected)
        changeState()
    }
    
    func setOn(isSelectedLocation: Bool) {
        self.isSelectedLocation = !isSelectedLocation
    }
    
    func changeState() {
        roundView.layer.borderColor = isSelectedLocation ? Asset.Color.green0F4F51.color.cgColor : Asset.Color.grayF4F5F6.color.cgColor
        roundView.layer.borderWidth = isSelectedLocation ? 2 : 0
        locationLabel.font = isSelectedLocation ? FontFamily.NotoSansKR.bold.font(size: 14) : FontFamily.NotoSansKR.regular.font(size: 14)
        locationLabel.textColor = isSelectedLocation ? Asset.Color.green0F4F51.color : Asset.Color.gray505C65.color
    }
}
