//
//  LocationBottomViewController.swift
//  FormSample
//
//  Created by siyeon park on 2023/11/26.
//

import UIKit

final class LocationBottomViewController: BaseViewController {

    let selectLocationBaseView = SelectLocationBaseView()
    var locationHandler: (String) -> Void = { _ in }
    private let locationViewModel = WriteFormViewModel()

    override func loadView() {
        view = selectLocationBaseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectLocationBaseView.setupCollectionView()
        getLocationData()
        setupButtonTapped()
    }

    func setupButtonTapped() {
        selectLocationBaseView.dismissButton.addTarget(self, action: #selector(dismissBottomView), for: .touchUpInside)

        selectLocationBaseView.floorPlanButton.addTarget(self, action: #selector(presentFloorPlan), for: .touchUpInside)

        selectLocationBaseView.selectBottomButton.addTarget(self, action: #selector(selectLocationButton), for: .touchUpInside)
    }

    @objc func dismissBottomView() {
        back(animated: true)
    }

    @objc func presentFloorPlan() {
        let presentBottomVC = PresentFloorViewController()

        let bottomSheetVC = CustomBottomSheetViewController(contentViewController: presentBottomVC)
        bottomSheetVC.modalPresentationStyle = .overFullScreen
        present(bottomSheetVC, animated: true)
    }

    @objc func selectLocationButton() {
        guard let selectedLocation = selectLocationBaseView.selectionLocation else {
            return
        }
        locationHandler(selectedLocation)
        back(animated: true)
    }
}

extension LocationBottomViewController {
    func getLocationData() {
        locationViewModel.fetchLocationData {
            self.selectLocationBaseView.locationDataList = self.locationViewModel.locationModel.map { $0.locationName }
        }
    }
}
