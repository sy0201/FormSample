//
//  RequiredSelectionBottomViewController.swift
//  FormSample
//
//  Created by siyeon park on 2023/11/26.
//

import UIKit

final class RequiredSelectionBottomViewController: UIViewController {

    let selectLocationBaseView = SelectLocationBaseView()
    private let locationViewModel = WriteFormViewModel()

    override func loadView() {
        view = selectLocationBaseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        getLocationData()
    }
    
    private func setupCollectionView() {
        selectLocationBaseView.setupCollectionView()
    }
}

extension RequiredSelectionBottomViewController {
    func getLocationData() {
        locationViewModel.fetchLocationData {
            self.selectLocationBaseView.locationDataList = self.locationViewModel.locationModel.map { $0.locationName }
        }
    }
}
