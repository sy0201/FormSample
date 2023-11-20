//
//  ViewController.swift
//  PRUGIO
//
//  Created by siyeon park on 2023/11/07.
//

import UIKit

final class MainViewController: BaseViewController {

    let mainView = MainView()
    private let viewModel = ApartmentViewModel()

    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getApartmentData()
        selectApartmentTapped()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mainView.gradationView.gradationView([.black.withAlphaComponent(0.6), .black.withAlphaComponent(0.0)])
    }
}

extension MainViewController {
    func selectApartmentTapped() {
        mainView.selectApartmentButton.addTarget(self, action: #selector(selectApartment), for: .touchUpInside)
    }

    @objc func selectApartment() {
        let selectApartmentBottomVC = SelectApartmentBottomViewController()

        let apartmentNameList = viewModel.apartmentNameData.map({ $0.apartmentName })
        selectApartmentBottomVC.selectApartmentBottomView.setRadioDataList(data: apartmentNameList)

        let bottomSheetVC = CustomBottomSheetViewController(contentViewController: selectApartmentBottomVC)

        selectApartmentBottomVC.apartmentNameHandler = { [self] text in
            mainView.apartmentComplexLabel.text = text

            if mainView.apartmentComplexLabel.text?.isEmpty != true {
                mainView.requestPreConfirmationButton.isHidden = false
            }
        }
        bottomSheetVC.modalPresentationStyle = .overFullScreen
        present(bottomSheetVC, animated: true)
    }
}

extension MainViewController {
    func getApartmentData() {
        viewModel.fetchApartmentData {}
    }
}
