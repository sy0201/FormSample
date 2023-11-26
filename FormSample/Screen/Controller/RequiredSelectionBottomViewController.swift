//
//  RequiredSelectionBottomViewController.swift
//  FormSample
//
//  Created by siyeon park on 2023/11/26.
//

import UIKit

final class RequiredSelectionBottomViewController: UIViewController {

    let requiredSelectionBaseView = RequiredSelectionBaseView()
    private let locationViewModel = WriteFormViewModel()

    override func loadView() {
        view = requiredSelectionBaseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        getLocationData()
    }
    
    private func setupCollectionView() {
        requiredSelectionBaseView.setupCollectionView()
    }
}

extension RequiredSelectionBottomViewController {
    func getLocationData() {
        locationViewModel.fetchLocationData {
            self.requiredSelectionBaseView.locationDataList = self.locationViewModel.locationModel.map { $0.locationName }
        }
    }
}
