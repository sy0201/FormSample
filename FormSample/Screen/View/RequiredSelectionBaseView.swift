//
//  RequiredSelectionBaseView.swift
//  FormSample
//
//  Created by siyeon park on 2023/11/24.
//

import UIKit
import SnapKit

final class RequiredSelectionBaseView: BaseView {
    
    var currentView: Enum.RequiredSelect = .location
    var locationDataList: [String] = [] {
        didSet {
            collectionView.reloadData()
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
    
    private let middleView = UIView()
    private let floorPlanView: UIView = {
        let floorPlanView = UIView()
        floorPlanView.layer.cornerRadius = 4
        floorPlanView.backgroundColor = Asset.Color.green0F4F51.color
        return floorPlanView
    }()
    private let floorPlanButton: UIButton = {
        let floorPlanButton = UIButton()
        floorPlanButton.titleLabel?.font = FontFamily.NotoSansKR.medium.font(size: 13)
        floorPlanButton.setTitleColor(.white, for: .normal)
        floorPlanButton.setTitle("평면도 보기", for: .normal)
        floorPlanButton.setImage(UIImage(named: Asset.Icon.icArrow.name), for: .normal)
        return floorPlanButton
    }()

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
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
                     middleView,
                     floorPlanView,
                     collectionView])
        mainView.addSubviews([titleView, collectionView])
        middleView.addSubviews([floorPlanView, floorPlanButton])
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
            make.leading.trailing.equalTo(titleView)
            make.top.equalTo(titleView.snp.bottom)
        }
        
        floorPlanView.snp.makeConstraints { make in
            make.trailing.equalTo(mainView).inset(24)
            make.top.equalTo(middleView.snp.top).inset(16)
            make.bottom.equalTo(middleView.snp.bottom).inset(8)
        }
        
        floorPlanButton.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalTo(floorPlanView)
        }
        
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(mainView)
            make.top.equalTo(floorPlanView.snp.bottom)
            make.bottom.equalTo(mainView.snp.bottom)
        }
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(LocationCollectionViewCell.self, forCellWithReuseIdentifier: LocationCollectionViewCell.reuseIdentifier)
    }
    
    func updateCollectionView(with data: [String]) {
        locationDataList = data
        collectionView.reloadData()
    }
}

extension RequiredSelectionBaseView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        locationDataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LocationCollectionViewCell", for: indexPath) as? LocationCollectionViewCell else { return
            UICollectionViewCell() }
        let data = locationDataList[indexPath.row]

        cell.configure(with: data)
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
