//
//  SelectRadioTableViewCell.swift
//  FormSample
//
//  Created by siyeon park on 2023/11/20.
//

import UIKit
import SnapKit

final class StackUnRegisterTableViewCell: UITableViewCell, ReuseIdentifying {

    var childCellData: [String] = []
    var isCheckRegister: Bool = false {
        didSet {
            self.changeState()
        }
    }

    let mainView = UIView()
    let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = 0
        return stackView
    }()
    private let topView = UIView()

    let selectImg: UIImageView = {
        let selectImg = UIImageView()
        selectImg.image = Asset.Icon.icCheckboxOff.image
        return selectImg
    }()
    private let labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.spacing = 4
        return stackView
    }()
    let locationLabel: UILabel = {
        let locationLabel = UILabel()
        locationLabel.font = FontFamily.NotoSansKR.medium.font(size: 15)
        locationLabel.textColor = Asset.Color.black.color
        locationLabel.text = "드레스룸"
        return locationLabel
    }()
    let checkButton = UIButton()

    private let countStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.spacing = 4
        return stackView
    }()
    let locationCountLabel: UILabel = {
        let locationCountLabel = UILabel()
        locationCountLabel.font = FontFamily.NotoSansKR.bold.font(size: 15)
        locationCountLabel.textColor = Asset.Color.green458E8F.color
        locationCountLabel.text = "3"
        return locationCountLabel
    }()

    let selectLocationCountLabel: UILabel = {
        let selectLocationCountLabel = UILabel()
        selectLocationCountLabel.font = FontFamily.NotoSansKR.regular.font(size: 16)
        selectLocationCountLabel.textColor = Asset.Color.green458E8F.color
        selectLocationCountLabel.text = "(3)"
        return selectLocationCountLabel
    }()

    let rightStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.spacing = 0
        return stackView
    }()

    let selectDeleteLabel: UILabel = {
        let selectDeleteLabel = UILabel()
        selectDeleteLabel.font = FontFamily.NotoSansKR.bold.font(size: 13)
        selectDeleteLabel.textColor = Asset.Color.grayCDD1D4.color
        selectDeleteLabel.text = "선택삭제"
        return selectDeleteLabel
    }()
    let moreDetailImg: UIImageView = {
        let moreImg = UIImageView()
        moreImg.image = Asset.Icon.icArrowBottom.image
        return moreImg
    }()
    let rightButton = UIButton()

    let tableView = UITableView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        print("DetailUnRegisterTableViewCell initialized")
        setupUI()
        setupConstraint()
        setupTableView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension StackUnRegisterTableViewCell {
    func setupUI() {
        selectionStyle = .none
        addSubview(mainView)

        mainView.addSubviews([mainStackView])
        mainStackView.addArrangedSubviews([topView, tableView])
        topView.addSubviews([selectImg, checkButton, labelStackView, rightStackView, rightButton])

        labelStackView.addArrangedSubviews([locationLabel, countStackView])
        countStackView.addArrangedSubviews([locationCountLabel, selectLocationCountLabel])
        rightStackView.addArrangedSubviews([selectDeleteLabel, moreDetailImg])

        setupTableView()
    }

    func setupConstraint() {
        mainView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        mainStackView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalTo(mainView)
        }

        topView.snp.makeConstraints { make in
            make.leading.trailing.top.equalTo(mainStackView)
        }

        selectImg.snp.makeConstraints { make in
            make.leading.equalTo(topView).offset(24)
            make.top.bottom.equalTo(topView).inset(18)
            make.height.equalTo(24)
        }

        checkButton.snp.makeConstraints { make in
            make.leading.top.bottom.equalTo(topView)
        }

        labelStackView.snp.makeConstraints { make in
            make.leading.equalTo(selectImg.snp.trailing).offset(8)
            make.trailing.equalTo(checkButton.snp.trailing)
            make.centerY.equalTo(selectImg.snp.centerY)
        }

        rightStackView.snp.makeConstraints { make in
            make.trailing.equalTo(topView.snp.trailing).inset(24)
            make.centerY.equalTo(topView.snp.centerY)
        }

        rightButton.snp.makeConstraints { make in
            make.trailing.top.bottom.equalTo(topView)
            make.leading.equalTo(topView)
        }

        tableView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(mainStackView)
            make.top.equalTo(topView.snp.bottom)
            make.bottom.equalTo(mainStackView.snp.bottom)
        }
    }

    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension

        tableView.register(DetailUnRegisterTableViewCell.self, forCellReuseIdentifier: DetailUnRegisterTableViewCell.reuseIdentifier)
    }

    func configureChildCellData() {
        // 자식 셀의 데이터 설정
        // 이 예제에서는 두 개의 자식 셀이 있다고 가정하고 각각에 대한 데이터 설정
        childCellData = [DetailUnRegisterTableViewCell.reuseIdentifier, DetailUnRegisterTableViewCell.reuseIdentifier]
        tableView.reloadData()
    }

    func configure(with data: String) {
        locationLabel.text = data
    }

    func setOn(isCheckRegister: Bool) {
        self.isCheckRegister = isCheckRegister
    }

    func changeState() {
        selectImg.image = isCheckRegister ? Asset.Icon.icCheckboxOn.image : Asset.Icon.icCheckboxOff.image
    }
}

extension StackUnRegisterTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("detail cell")
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailUnRegisterTableViewCell", for: indexPath) as? DetailUnRegisterTableViewCell else {
            return UITableViewCell() }
        //cell.configure(with: childCellData[indexPath.row])
        cell.backgroundColor = .red

        return cell
    }
}
