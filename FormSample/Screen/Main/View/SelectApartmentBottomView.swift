//
//  SelectApartmentBottomView.swift
//  FormSample
//
//  Created by siyeon park on 2023/11/20.
//

import UIKit
import SnapKit

final class SelectApartmentBottomView: BaseView {
    
    let tableView = UITableView()
    let shadowView: UIView = {
        let shadowView = UIView()
        shadowView.backgroundColor = Asset.Color.white.color
        return shadowView
    }()

    private let bottomView = UIView()
    private var radioDataList: [String] = []
    weak var delegate: SelectRadioCellDelegate?

    let closeBottomButton: UIButton = {
        let closeBottomButton = UIButton()
        closeBottomButton.backgroundColor = Asset.Color.white.color
        closeBottomButton.layer.cornerRadius = 24
        closeBottomButton.layer.borderWidth = 1
        closeBottomButton.layer.borderColor = Asset.Color.grayEEF1F3.color.cgColor
        closeBottomButton.titleLabel?.font = FontFamily.NotoSansKR.bold.font(size: 15)
        closeBottomButton.setTitleColor(Asset.Color.gray9DA4AA.color, for: .normal)
        closeBottomButton.setTitle(L10n.close, for: .normal)
        return closeBottomButton
    }()

    override func setupUI() {
        addSubviews([tableView, shadowView, bottomView])
        bottomView.addSubviews([closeBottomButton])

        tableView.register(SelectApartmentHeaderView.self, forHeaderFooterViewReuseIdentifier: SelectApartmentHeaderView.reuseIdentifier)
        tableView.register(SelectRadioTableViewCell.self, forCellReuseIdentifier: SelectRadioTableViewCell.reuseIdentifier)
        tableView.register(BottomEmptyTableViewCell.self, forCellReuseIdentifier: BottomEmptyTableViewCell.reuseIdentifier)
    }

    override func setupConstraint() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        shadowView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(bottomView.snp.top).offset(0)
        }

        bottomView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }

        closeBottomButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(24)
            make.top.equalTo(bottomView.snp.top).offset(24)
            make.bottom.equalTo(bottomView.snp.bottom).offset(-24)
            make.height.equalTo(50)
        }
    }

    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
    }

    func setRadioDataList(data: [String]) {
        radioDataList = data
    }
}

extension SelectApartmentBottomView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return radioDataList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if radioDataList.isEmpty {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BottomEmptyTableViewCell.reuseIdentifier, for: indexPath) as? BottomEmptyTableViewCell else {
                return UITableViewCell() }

            return cell
        }

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SelectRadioTableViewCell", for: indexPath) as? SelectRadioTableViewCell else { return UITableViewCell() }
        let data = radioDataList[indexPath.row]
        cell.configure(with: data)
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "SelectApartmentHeaderView") as? SelectApartmentHeaderView else {
            return UIView() }

        return header
    }

    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectedCell = tableView.cellForRow(at: indexPath) as? SelectRadioTableViewCell {
            selectedCell.setOn(isRadio: !selectedCell.isRadio)
        }
        let cellData = radioDataList[indexPath.row]
        delegate?.didSelectItem(cellData)
    }
}
