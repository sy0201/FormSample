//
//  ApplicationFormViewController.swift
//  FormSample
//
//  Created by siyeon park on 2023/11/21.
//

import UIKit

final class ApplicationFormViewController: BaseViewController {

    let applicationFormView = ApplicationFormBaseView()
    var selectApartmentName: String = ""
    
    override func loadView() {
        view = applicationFormView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        applicationFormView.setCurrentTab(.left)
        getApartmentNameData()
        setupButtonTapped()
    }

    func getApartmentNameData() {
        applicationFormView.apartmentLabel.text = selectApartmentName
    }

    func setupButtonTapped() {
        applicationFormView.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)

        applicationFormView.leftButton.addTarget(self, action: #selector(leftTapped), for: .touchUpInside)

        applicationFormView.rightButton.addTarget(self, action: #selector(rightTapped), for: .touchUpInside)

        applicationFormView.createFormButtonAction = { [weak self] in
            self?.createFormButtonTapped()
        }
    }

    @objc func backButtonTapped() {
        back(animated: true)
    }

    @objc func leftTapped() {
        print("leftTapped 탭")
        applicationFormView.setCurrentTab(.left)
        applicationFormView.tabSelected(tab: .left)
    }

    @objc func rightTapped() {
        print("rightTapped 탭")
        applicationFormView.setCurrentTab(.right)
        applicationFormView.tabSelected(tab: .right)
    }

    func createFormButtonTapped() {
        print("바텀시트 오픈")
    }
}
