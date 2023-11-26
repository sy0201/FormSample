//
//  LocationTableViewCell.swift
//  FormSample
//
//  Created by siyeon park on 2023/11/26.
//

import UIKit
import SnapKit

final class DefectiveTableViewCell: UITableViewCell, ReuseIdentifying {

    private let mainView = UIView()
    let roundView: UIView = {
        let roundView = UIView()
        return roundView
    }()
    let locationLabel: UILabel = {
        let locationLabel = UILabel()
        locationLabel.font = FontFamily.NotoSansKR.regular.font(size: 14)
        locationLabel.textColor = Asset.Color.grayF4F5F6.color
        return locationLabel
    }()
    let locationButton = UIButton()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraint()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DefectiveTableViewCell {
    func setupUI() {
        selectionStyle = .none
        addSubview(mainView)
        mainView.addSubviews([roundView, locationLabel, locationButton])
    }
    
    func setupConstraint() {
        mainView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        roundView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalTo(mainView)
        }
        
        locationLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(mainView)
        }
        
        locationButton.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalTo(mainView)
        }
    }
    
    func configure(with data: String) {
        locationLabel.text = data
    }
}
