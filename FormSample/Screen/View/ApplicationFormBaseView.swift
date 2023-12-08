//
//  ApplicationFormBaseView.swift
//  FormSample
//
//  Created by siyeon park on 2023/11/21.
//

import UIKit
import SnapKit

final class ApplicationFormBaseView: BaseView {

    var currentTab: Enum.TabMenu = .left
    var createFormButtonAction: (() -> Void)?
    var countInt: Int = 0
    var defectiveString: String = ""
    var isTabMenuTapped: Bool = false {
        didSet {
            self.changeState()
        }
    }
    var viewModel: FormViewModel!

    private let mainBackgroundView = UIView()

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

    let apartmentLabel: UILabel = {
        let apartmentLabel = UILabel()
        apartmentLabel.font = FontFamily.NotoSansKR.medium.font(size: 15)
        apartmentLabel.textColor = Asset.Color.gray505C65.color
        apartmentLabel.text = L10n.formMessage1
        return apartmentLabel
    }()

    private let leftTabView = UIView()
    let leftSelectLineTabView: UIView = {
        let leftSelectLineTabView = UIView()
        leftSelectLineTabView.backgroundColor = Asset.Color.green0F4F51.color
        leftSelectLineTabView.isHidden = false
        return leftSelectLineTabView
    }()
    let leftTabLabel: UILabel = {
        let leftTabLabel = UILabel()
        leftTabLabel.font = FontFamily.NotoSansKR.bold.font(size: 15)
        leftTabLabel.textColor = Asset.Color.green0F4F51.color
        leftTabLabel.text = L10n.formMessage2
        return leftTabLabel
    }()
    let leftButton: UIButton = UIButton()

    let rightTabView = UIView()
    let rightSelectLineTabView: UIView = {
        let rightSelectLineTabView = UIView()
        rightSelectLineTabView.backgroundColor = Asset.Color.green0F4F51.color
        rightSelectLineTabView.isHidden = true
        return rightSelectLineTabView
    }()
    let rightTabLabel: UILabel = {
        let rightTabLabel = UILabel()
        rightTabLabel.font = FontFamily.NotoSansKR.bold.font(size: 15)
        rightTabLabel.textColor = Asset.Color.gray9DA4AA.color
        rightTabLabel.text = L10n.formMessage3
        return rightTabLabel
    }()
    let rightPointView: UIView = {
        let pointView = UIView()
        pointView.backgroundColor = .red
        pointView.layer.cornerRadius = 3
        return pointView
    }()
    let rightButton = UIButton()

    private let tabMenuView = UIView()
    private let tabLineView: UIView = {
        let tabLineView = UIView()
        tabLineView.backgroundColor = Asset.Color.grayEEF1F3.color
        return tabLineView
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
        setCurrentTab(.left)
        tabSelected(tab: .left)

        mainBackgroundView.backgroundColor = .white
        addSubviews([mainBackgroundView,
                     topStackView,
                     navigationView,
                     apartmentView,
                     tabMenuView,
                     tabMenuStackView,
                     leftTabLabel,
                     rightPointView,
                     rightTabLabel,
                     leftButton,
                     rightButton,
                     tableView])
        topStackView.addArrangedSubviews([navigationView,
                                          apartmentView,
                                          tabMenuView])

        navigationView.addSubviews([backButtonImage,
                                    navigationLabel,
                                    backButton])
        apartmentView.addSubviews([pinImage, apartmentLabel])
        tabMenuView.addSubviews([tabMenuStackView, tabLineView])
        tabMenuStackView.addSubviews([leftTabView,
                                      rightTabView,
                                      leftSelectLineTabView,
                                      rightSelectLineTabView])
    }

    override func setupConstraint() {
        mainBackgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        topStackView.snp.makeConstraints { make in
            make.leading.equalTo(mainBackgroundView.snp.leading)
            make.trailing.equalTo(mainBackgroundView.snp.trailing)
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

        tabLineView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(tabMenuView)
            make.height.equalTo(1)
        }

        tabMenuStackView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(tabMenuView)
            make.top.equalTo(apartmentView.snp.bottom)
            make.bottom.equalTo(tabMenuView.snp.bottom)
        }

        leftTabView.snp.makeConstraints { make in
            make.leading.top.bottom.equalTo(tabMenuStackView)
            make.width.equalTo(tabMenuStackView.snp.width).multipliedBy(0.5)
        }

        leftSelectLineTabView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(leftTabView)
            make.height.equalTo(3)
        }

        rightTabView.snp.makeConstraints { make in
            make.leading.equalTo(leftTabView.snp.trailing)
            make.trailing.top.bottom.equalTo(tabMenuStackView)
            make.width.equalTo(tabMenuStackView.snp.width).multipliedBy(0.5)
        }

        rightSelectLineTabView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(rightTabView)
            make.height.equalTo(3)
        }

        leftTabLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(leftTabView)
        }

        rightTabLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(rightTabView)
        }

        rightPointView.snp.makeConstraints { make in
            make.leading.equalTo(rightTabLabel.snp.trailing).offset(4)
            make.bottom.equalTo(rightTabLabel.snp.top)
            make.width.height.equalTo(6)
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

        tableView.backgroundColor = Asset.Color.backgroundF7F2EF.color
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension

        tableView.register(ApplicationFormTopTableViewCell.self, forCellReuseIdentifier: ApplicationFormTopTableViewCell.reuseIdentifier)
        tableView.register(CreateFormTableViewCell.self, forCellReuseIdentifier: CreateFormTableViewCell.reuseIdentifier)
        tableView.register(EmptyUnRegisterTableViewCell.self, forCellReuseIdentifier: EmptyUnRegisterTableViewCell.reuseIdentifier)

        tableView.register(UnRegisterTableViewCell.self, forCellReuseIdentifier: UnRegisterTableViewCell.reuseIdentifier)
        tableView.register(DetailUnRegisterTableViewCell.self, forCellReuseIdentifier: DetailUnRegisterTableViewCell.reuseIdentifier)
    }

    func tabSelected(tab: Enum.TabMenu) {
        setupButton(view: leftSelectLineTabView, label: leftTabLabel, isTabMenuTapped: tab == .left)
        setupButton(view: rightSelectLineTabView, label: rightTabLabel, isTabMenuTapped: tab == .right)
    }

    private func setupButton(view: UIView, label: UILabel, isTabMenuTapped: Bool) {
        if isTabMenuTapped {
            view.isHidden = false
            label.textColor = Asset.Color.green0F4F51.color

        } else {
            view.isHidden = true
            label.textColor = Asset.Color.gray9DA4AA.color
        }
    }

    func setCurrentTab(_ type: Enum.TabMenu) {
        currentTab = type
    }

    func changeState() {
        let isSelected = isTabMenuTapped

        leftSelectLineTabView.isHidden = isSelected
        rightSelectLineTabView.isHidden = isSelected

        leftTabLabel.font = isSelected ? FontFamily.NotoSansKR.bold.font(size: 15) : FontFamily.NotoSansKR.medium.font(size: 15)
        rightTabLabel.font = isSelected ? FontFamily.NotoSansKR.bold.font(size: 15) : FontFamily.NotoSansKR.medium.font(size: 15)

        let textColor = isSelected ? Asset.Color.green0F4F51.color : Asset.Color.gray9DA4AA.color
        leftTabLabel.textColor = textColor
        rightTabLabel.textColor = textColor
    }
}

extension ApplicationFormBaseView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        switch currentTab {
        case .left:
            return 2
        case .right:
            let headerCount = 1
            return headerCount + viewModel.locationKeys.count
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch currentTab {
        case .left:
            return 1

        case .right:
            if section == 0 {
                return 1
            } else {
                if viewModel.selectedLocationIndex == section {
                    let key = viewModel.locationKeys[section - 1]
                    let list = viewModel.writeFormDataList[key]
                    return (list?.count ?? 0) + 1
                } else {
                    return 1
                }
            }
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch currentTab {
        case .left:
            if indexPath.section == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "ApplicationFormTopTableViewCell", for: indexPath) as? ApplicationFormTopTableViewCell else {
                    return UITableViewCell() }
                cell.setupConfiguration(.left)
                return cell
            }
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CreateFormTableViewCell", for: indexPath) as? CreateFormTableViewCell else {
                return UITableViewCell() }
            cell.createFormCellButtonAction = { [weak self] in
                self?.handleCreateFormButton()
            }
            return cell

        case .right:

            if viewModel.getTotalCount() == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "EmptyUnRegisterTableViewCell", for: indexPath) as? EmptyUnRegisterTableViewCell else {
                    return UITableViewCell() }

                return cell
            }

            if indexPath.section == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "ApplicationFormTopTableViewCell", for: indexPath) as? ApplicationFormTopTableViewCell else {
                    return UITableViewCell() }
                cell.setupConfiguration(.right)
                return cell
            }

            let locationKey = viewModel.locationKeys[indexPath.section - 1]

            guard let formModels = viewModel.getWriteFormModels(forKey: locationKey) else {
                return UITableViewCell()
            }

            if indexPath.row == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "UnRegisterTableViewCell", for: indexPath) as? UnRegisterTableViewCell else {
                    return UITableViewCell()
                }

                cell.configure(with: locationKey)
                return cell

            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailUnRegisterTableViewCell", for: indexPath) as? DetailUnRegisterTableViewCell else {
                    return UITableViewCell()
                }

                let defectiveData = formModels[indexPath.row - 1].defectiveData
                cell.configure(with: defectiveData)
                cell.zoomInImageView.image = formModels[indexPath.row - 1].photoDataListDataType.zoomInImage
                cell.zoomOutImageView.image = formModels[indexPath.row - 1].photoDataListDataType.zoomOutImage
                return cell
            }
        }
    }

    func handleCreateFormButton() {
        createFormButtonAction?()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 { return }
        if viewModel.selectedLocationIndex == indexPath.section {
            viewModel.selectedLocationIndex = -1
        } else {
            viewModel.selectedLocationIndex = indexPath.section
        }

        if indexPath.row == 0 {
            tableView.reloadData()
        }
    }
}
