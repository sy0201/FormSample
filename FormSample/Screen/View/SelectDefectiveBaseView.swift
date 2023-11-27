//
//  SelectLocationBaseView.swift
//  FormSample
//
//  Created by siyeon park on 2023/11/24.
//

import UIKit
import SnapKit

final class SelectDefectiveBaseView: BaseView {
    
    weak var delegate: SelectRadioCellDelegate?
    var defectiveDataList: [String] = []
    
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
        contentLabel.text = L10n.formMessage19
        return contentLabel
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    override func setupUI() {
        addSubviews([mainView,
                     titleView,
                     dismissButton,
                     middleView,
                     tableView])
        mainView.addSubviews([titleView, tableView])
        middleView.addSubviews([contentBackView, contentLabel])
        titleView.addSubview(titleLabel)
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
        
        tableView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(mainView)
            make.top.equalTo(middleView.snp.bottom).offset(16)
        }
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none

        tableView.register(SelectRadioTableViewCell.self, forCellReuseIdentifier: SelectRadioTableViewCell.reuseIdentifier)
    }

    func setRadioDataList(data: [String]) {
        defectiveDataList = data
    }
}

extension SelectDefectiveBaseView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        defectiveDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SelectRadioTableViewCell", for: indexPath) as? SelectRadioTableViewCell else { return UITableViewCell() }
        let data = defectiveDataList[indexPath.row]
        cell.configure(with: data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectedCell = tableView.cellForRow(at: indexPath) as? SelectRadioTableViewCell {
            selectedCell.setOn(isRadio: !selectedCell.isRadio)
        }
        let cellData = defectiveDataList[indexPath.row]
        delegate?.didSelectItem(cellData)
    }
}
