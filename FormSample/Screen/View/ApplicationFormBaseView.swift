//
//  ApplicationFormBaseView.swift
//  FormSample
//
//  Created by siyeon park on 2023/11/21.
//

import UIKit
import SnapKit

final class ApplicationFormBaseView: BaseView {
    
    private let leftTabView: UIView = {
        let leftTabView = UIView()
        leftTabView.backgroundColor = .white
        return leftTabView
    }()

    let leftButton: UIButton = {
        let leftButton = UIButton()
        leftButton.titleLabel?.font = FontFamily.NotoSansKR.bold.font(size: 15)
        leftButton.setTitleColor(Asset.Color.green0F4F51.color, for: .normal)
        leftButton.setTitle(L10n.formMessage2, for: .normal)
        return leftButton
    }()

    private let rightTabView: UIView = {
        let rightTabView = UIView()
        rightTabView.backgroundColor = .white
        return rightTabView
    }()

    let rightButton: UIButton = {
        let rightButton = UIButton()
        rightButton.titleLabel?.font = FontFamily.NotoSansKR.bold.font(size: 15)
        rightButton.setTitleColor(Asset.Color.green0F4F51.color, for: .normal)
        rightButton.setTitle(L10n.formMessage2, for: .normal)
        return rightButton
    }()

    private let tabMenuStackView: UIStackView = {
        let tabMenuStackView = UIStackView()
        tabMenuStackView.axis = .horizontal
        tabMenuStackView.alignment = .fill
        tabMenuStackView.distribution = .fillEqually
        tabMenuStackView.spacing = 0
        return tabMenuStackView
    }()

    let tableView = UITableView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraint()
        setupTableView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setupUI() {
        addSubviews([tabMenuStackView, tableView])

        tabMenuStackView.addArrangedSubviews([leftTabView, rightTabView])
    }

    override func setupConstraint() {
        tabMenuStackView.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(44)
        }

        tableView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(tabMenuStackView.snp.bottom).offset(0)
        }
    }

    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension

        tableView.register(ApplicationFormTopTableViewCell.self, forCellReuseIdentifier: ApplicationFormTopTableViewCell.reuseIdentifier)
    }
}

extension ApplicationFormBaseView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ApplicationFormTopTableViewCell", for: indexPath) as? ApplicationFormTopTableViewCell else { return UITableViewCell() }
        return cell
    }
}
