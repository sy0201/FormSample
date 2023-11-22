//
//  ApplicationFormBaseView.swift
//  FormSample
//
//  Created by siyeon park on 2023/11/21.
//

import UIKit
import SnapKit

final class ApplicationFormBaseView: BaseView {

    private let contentsView = UIView()

    private let topStackView: UIStackView = {
        let tabMenuStackView = UIStackView()
        tabMenuStackView.axis = .vertical
        tabMenuStackView.alignment = .fill
        tabMenuStackView.distribution = .fillProportionally
        tabMenuStackView.spacing = 0
        return tabMenuStackView
    }()

    private let navigationView = UIView()

    private let backButtonImage: UIImageView = {
        let backButtonImage = UIImageView()
        backButtonImage.image = UIImage(named: Asset.Icon.iArrowBack.name)
        return backButtonImage
    }()

    private let navigationLabel: UILabel = {
        let navigationLabel = UILabel()
        navigationLabel.font = FontFamily.NotoSansKR.bold.font(size: 16)
        navigationLabel.textColor = Asset.Color.black.color
        navigationLabel.text = L10n.formMessage1
        return navigationLabel
    }()

    let backButton = UIButton()

    private let apartmentView = UIView()

    private let pinImage: UIImageView = {
        let pinImage = UIImageView()
        pinImage.image = UIImage(named: Asset.Icon.icMapPin.name)
        return pinImage
    }()

    private let apartmentLabel: UILabel = {
        let apartmentLabel = UILabel()
        apartmentLabel.font = FontFamily.NotoSansKR.medium.font(size: 15)
        apartmentLabel.textColor = Asset.Color.gray505C65.color
        apartmentLabel.text = L10n.formMessage1
        return apartmentLabel
    }()

    private let leftTabView = UIView()

    private let leftTabLabel: UILabel = {
        let leftTabLabel = UILabel()
        leftTabLabel.font = FontFamily.NotoSansKR.bold.font(size: 15)
        leftTabLabel.textColor = Asset.Color.green0F4F51.color
        leftTabLabel.text = L10n.formMessage2
        return leftTabLabel
    }()

    let leftButton: UIButton = UIButton()

    let rightTabView = UIView()

    private let rightTabLabel: UILabel = {
        let rightTabLabel = UILabel()
        rightTabLabel.font = FontFamily.NotoSansKR.bold.font(size: 15)
        rightTabLabel.textColor = Asset.Color.green0F4F51.color
        rightTabLabel.text = L10n.formMessage3
        return rightTabLabel
    }()

    let rightButton = UIButton()

    private let tabMenuView = UIView()

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
        contentsView.backgroundColor = .white
        addSubviews([contentsView, topStackView, navigationView, apartmentView, tabMenuView, tabMenuStackView, leftTabLabel, rightTabLabel, leftButton, rightButton, tableView])

        topStackView.addArrangedSubviews([navigationView, apartmentView, tabMenuView])

        navigationView.addSubviews([backButtonImage, navigationLabel, backButton])
        apartmentView.addSubviews([pinImage, apartmentLabel])
        tabMenuView.addSubviews([tabMenuStackView])
        tabMenuStackView.addSubviews([leftTabView, rightTabView])
    }

    override func setupConstraint() {
        contentsView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        topStackView.snp.makeConstraints { make in
            make.leading.equalTo(contentsView.snp.leading)
            make.trailing.equalTo(contentsView.snp.trailing)
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
        }

        navigationView.snp.makeConstraints { make in
            make.leading.equalTo(topStackView.snp.leading)
            make.trailing.equalTo(topStackView.snp.trailing)
            make.top.equalTo(topStackView.snp.top)
            make.height.equalTo(56)
        }

        backButtonImage.snp.makeConstraints { make in
            make.leading.equalTo(navigationView.snp.leading).offset(16)
            make.top.equalTo(navigationView.snp.top).offset(16)
            make.bottom.equalTo(navigationView.snp.bottom).offset(-16)
            make.height.equalTo(24)
        }

        navigationLabel.snp.makeConstraints { make in
            make.leading.equalTo(backButtonImage.snp.trailing).offset(12)
            make.centerY.equalTo(navigationView.snp.centerY)
        }

        backButton.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalTo(navigationView)
        }

        apartmentView.snp.makeConstraints { make in
            make.leading.equalTo(topStackView.snp.leading)
            make.trailing.equalTo(topStackView.snp.trailing)
            make.top.equalTo(navigationView.snp.bottom)
        }

        pinImage.snp.makeConstraints { make in
            make.leading.equalTo(apartmentView.snp.leading).offset(24)
            make.top.equalTo(apartmentView.snp.top).offset(16)
            make.bottom.equalTo(apartmentView.snp.bottom).offset(-16)
            make.height.equalTo(16)
        }

        apartmentLabel.snp.makeConstraints { make in
            make.leading.equalTo(pinImage.snp.trailing).offset(4)
            make.centerY.equalTo(apartmentView.snp.centerY)
        }

        tabMenuView.snp.makeConstraints { make in
            make.leading.equalTo(apartmentView.snp.leading)
            make.trailing.equalTo(apartmentView.snp.trailing)
            make.top.equalTo(apartmentView.snp.bottom)
            make.bottom.equalTo(topStackView.snp.bottom)
            make.height.equalTo(44)
        }

        tabMenuStackView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(tabMenuView)
            make.top.equalTo(apartmentView.snp.bottom)
        }

        leftTabView.snp.makeConstraints { make in
            make.leading.top.bottom.equalTo(tabMenuStackView)
            make.width.equalTo(tabMenuStackView.snp.width).multipliedBy(0.5)
        }

        rightTabView.snp.makeConstraints { make in
            make.leading.equalTo(leftTabView.snp.trailing)
            make.trailing.top.bottom.equalTo(tabMenuStackView)
            make.width.equalTo(tabMenuStackView.snp.width).multipliedBy(0.5)
        }

        leftTabLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(leftTabView)
        }

        rightTabLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(rightTabView)
        }

        leftButton.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalTo(leftTabView)
        }

        rightButton.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalTo(rightTabView)
        }

        tableView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(topStackView.snp.bottom).offset(0)
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
