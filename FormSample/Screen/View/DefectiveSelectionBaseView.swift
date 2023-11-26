//
//  RequiredSelectionBaseView.swift
//  FormSample
//
//  Created by siyeon park on 2023/11/24.
//

import UIKit
import SnapKit

final class DefectiveSelectionBaseView: BaseView {
    
    weak var delegate: SelectRadioCellDelegate?
    var defectiveDataList: [String] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    private let mainView = UIView()
    private let titleView = UIView()
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = FontFamily.NotoSansKR.bold.font(size: 16)
        titleLabel.textColor = Asset.Color.black.color
        titleLabel.text = L10n.formMessage17
        return titleLabel
    }()
    let dismissButton: UIButton = {
        let dismissButton = UIButton()
        return dismissButton
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupUI() {
        addSubviews([mainView,
                     titleView,
                     dismissButton,
                     tableView])
        mainView.addSubviews([titleView, tableView])
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
        
        tableView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(mainView)
            make.top.equalTo(titleView.snp.bottom)
        }
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none

        tableView.register(SelectRadioTableViewCell.self, forCellReuseIdentifier: SelectRadioTableViewCell.reuseIdentifier)
    }
    
    func updateTableView(with data: [String]) {
        defectiveDataList = data
        tableView.reloadData()
    }
}

extension DefectiveSelectionBaseView: UITableViewDelegate, UITableViewDataSource {
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
