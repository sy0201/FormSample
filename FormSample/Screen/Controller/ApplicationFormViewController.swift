//
//  ApplicationFormViewController.swift
//  FormSample
//
//  Created by siyeon park on 2023/11/21.
//

import UIKit

final class ApplicationFormViewController: BaseViewController {

    let applicationFormView = ApplicationFormBaseView()
    let viewModel = FormViewModel()
    var selectApartmentName: String = ""
    var countInt: (WriteFormModel) -> Void = { _ in }
    override func loadView() {
        view = applicationFormView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getApartmentNameData()
        isNotReceivedHistory()
        setupButtonTapped()
        applicationFormView.countInt = viewModel.getTotalCount()
    }

    func getApartmentNameData() {
        applicationFormView.apartmentLabel.text = selectApartmentName
    }

    func isNotReceivedHistory() {
        if viewModel.getTotalCount() >= 1 {
            applicationFormView.rightPointView.isHidden = false
        }
        applicationFormView.rightPointView.isHidden = true
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
        applicationFormView.setCurrentTab(.left)
        applicationFormView.tabSelected(tab: .left)
        applicationFormView.tableView.reloadData()
    }

    @objc func rightTapped() {
        applicationFormView.setCurrentTab(.right)
        applicationFormView.tabSelected(tab: .right)
        applicationFormView.tableView.reloadData()
    }

    func createFormButtonTapped() {
        let createFormBottomVC = CreateFormBottomViewController()

        let bottomSheetVC = CustomBottomSheetViewController(contentViewController: createFormBottomVC)

        /**
        createFormBottomVC.saveWriteFormModel = { [self] writeFormModel in
            self.countInt(writeFormModel)

            viewModel.totalCountUpdateHandler = { [weak self] count in
                self?.countInt(writeFormModel)
                if viewModel.writeFormDataList[data.locationData] == nil {
                    viewModel.writeFormDataList[data.locationData] = []
                }
                viewModel.writeFormDataList[data.locationData]?.append(data)
                applicationFormView.countInt = viewModel.getTotalCount()
                applicationFormView.tableView.reloadData()
            }
        }*/

        createFormBottomVC.delegate = self

        bottomSheetVC.modalPresentationStyle = .overFullScreen
        present(bottomSheetVC, animated: true)
    }
}

extension ApplicationFormViewController: FormDelegate {
    func writeForm(data: WriteFormModel) {

        if viewModel.writeFormDataList[data.locationData] == nil {
            viewModel.writeFormDataList[data.locationData] = []
        }
        viewModel.writeFormDataList[data.locationData]?.append(data)
        applicationFormView.countInt = viewModel.getTotalCount()
        applicationFormView.tableView.reloadData()
    }
}
