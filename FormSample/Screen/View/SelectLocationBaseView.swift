//
//  SelectLocationBaseView.swift
//  FormSample
//
//  Created by siyeon park on 2023/11/24.
//

import UIKit
import SnapKit

final class SelectLocationBaseView: BaseView {
    
    var locationDataAction: (() -> Void)?
    var locationDataList: [String] = []
    var selectionLocation: String?
    
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

    private let floorPlanView: UIView = {
        let floorPlanView = UIView()
        floorPlanView.layer.cornerRadius = 6
        floorPlanView.backgroundColor = Asset.Color.green0F4F51.color
        return floorPlanView
    }()
    let floorPlanButton: UIButton = {
        let floorPlanButton = UIButton()
        floorPlanButton.titleLabel?.font = FontFamily.NotoSansKR.medium.font(size: 13)
        floorPlanButton.setTitleColor(.white, for: .normal)
        floorPlanButton.setTitle(L10n.formMessage18, for: .normal)
        floorPlanButton.setImage(UIImage(named: Asset.Icon.icLayout.name), for: .normal)
        return floorPlanButton
    }()

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()

    let shadowView: UIView = {
        let shadowView = UIView()
        shadowView.backgroundColor = Asset.Color.white.color
        return shadowView
    }()

    let bottomView: UIView = {
        let bottomView = UIView()
        bottomView.backgroundColor = Asset.Color.white.color
        return bottomView
    }()

    let selectBottomButton: UIButton = {
        let selectBottomButton = UIButton()
        selectBottomButton.backgroundColor = Asset.Color.green0F4F51.color
        selectBottomButton.layer.cornerRadius = 24
        selectBottomButton.layer.borderWidth = 1
        selectBottomButton.layer.borderColor = Asset.Color.grayEEF1F3.color.cgColor
        selectBottomButton.titleLabel?.font = FontFamily.NotoSansKR.bold.font(size: 15)
        selectBottomButton.setTitleColor(Asset.Color.white.color, for: .normal)
        selectBottomButton.setTitle("선택하기", for: .normal)
        return selectBottomButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraint()
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupUI() {
        addSubviews([mainView,
                     titleView,
                     dismissButton,
                     middleView,
                     floorPlanView,
                     collectionView,
                     shadowView,
                     bottomView])
        mainView.addSubviews([titleView,
                              middleView,
                              collectionView,
                              shadowView,
                              bottomView])
        middleView.addSubviews([contentBackView,
                                contentLabel,
                                floorPlanView,
                                floorPlanButton])
        titleView.addSubview(titleLabel)
        bottomView.addSubview(selectBottomButton)
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
            make.top.equalTo(middleView)
        }

        contentLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(contentBackView).inset(16)
            make.top.bottom.equalTo(contentBackView).inset(8)
        }

        floorPlanView.snp.makeConstraints { make in
            make.trailing.equalTo(mainView).inset(24)
            make.top.equalTo(contentBackView.snp.bottom).offset(16)
            make.bottom.equalTo(middleView.snp.bottom).offset(-8)
            make.width.equalTo(115)
            make.height.equalTo(38)
        }
        
        floorPlanButton.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalTo(floorPlanView)
        }
        
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(mainView)
            make.top.equalTo(middleView.snp.bottom).offset(8)
        }

        shadowView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(bottomView.snp.top)
        }

        bottomView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(mainView)
            make.top.equalTo(collectionView.snp.bottom).offset(16)
            make.bottom.equalTo(mainView.snp.bottom)
        }

        selectBottomButton.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalTo(bottomView).inset(24)
            make.height.equalTo(50)
        }
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(LocationCollectionViewCell.self, forCellWithReuseIdentifier: LocationCollectionViewCell.reuseIdentifier)
    }
}

extension SelectLocationBaseView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        locationDataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LocationCollectionViewCell", for: indexPath) as? LocationCollectionViewCell else { return
            UICollectionViewCell() }
        cell.locationLabel.text = selectionLocation
        let data = locationDataList[indexPath.row]

        cell.configure(with: data, isSelected: !cell.isSelectedLocation)
        cell.locationButton.addTarget(self, action: #selector(didSelectCellItem), for: .touchUpInside)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let numberOfItemRow: CGFloat = 3
        let spacingBetweenItems: CGFloat = 13.5
        // 한 줄에 아이템은 3개, 아이템 사이의 간격은 총 아이템 - 1
        let totalSpacing = (numberOfItemRow - 1) * spacingBetweenItems
        // collectionView Width 에서 아이템 사이 간격을 뺀 숫자
        let availableWidth = collectionView.bounds.width - totalSpacing
        //collectionView Width 에서 아이템 사이 간격을 뺀 숫자 / 아이템 갯수
        let calculatedItemWidth = availableWidth / numberOfItemRow
        
        return CGSize(width: calculatedItemWidth, height: 46)
    }

    @objc func didSelectCellItem(sender: UIButton) {
        print("cell tapped")
        guard let cell = sender.superview as? LocationCollectionViewCell,
              let indexPath = collectionView.indexPath(for: cell) else {
            return
        }

        let selectedCell = LocationCollectionViewCell()
        selectedCell.setOn(isSelectedLocation: !selectedCell.isSelectedLocation)
        print("cell bool \( selectedCell.isSelectedLocation)")
    }
}
