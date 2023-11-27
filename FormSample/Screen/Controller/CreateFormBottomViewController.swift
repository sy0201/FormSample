//
//  CreateFormBottomViewController.swift
//  FormSample
//
//  Created by siyeon park on 2023/11/23.
//

import UIKit

final class CreateFormBottomViewController: UIViewController {

    let createFormBaseView = CreateFormBaseView()
    private let viewModel = WriteFormViewModel()

    override func loadView() {
        view = createFormBaseView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getDefectiveData()
        setupButtonTapped()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.createFormBaseView.defectiveTextView.resignFirstResponder()
    }
}

extension CreateFormBottomViewController {
    func setupButtonTapped() {
        createFormBaseView.locationButton.addTarget(self, action: #selector(selectLocation), for: .touchUpInside)

        createFormBaseView.defectiveButton.addTarget(self, action: #selector(selectDefective), for: .touchUpInside)
    }
    
    @objc func selectLocation() {
        let requiredSelectionBottomVC = RequiredSelectionBottomViewController()

        let bottomSheetVC = CustomBottomSheetViewController(contentViewController: requiredSelectionBottomVC)

        requiredSelectionBottomVC.locationHandler = { [self] text in
            createFormBaseView.locationLabel.text = text
        }

        bottomSheetVC.modalPresentationStyle = .overFullScreen
        self.present(bottomSheetVC, animated: true, completion: nil)
    }
    
    @objc func selectDefective() {
        let defectiveBottomVC = DefectiveBottomViewController()

        let defectiveList = viewModel.defectiveDataList.map { $0.defectiveItem }
        defectiveBottomVC.selectDefectiveBaseView.setRadioDataList(data: defectiveList)

        let bottomSheetVC = CustomBottomSheetViewController(contentViewController: defectiveBottomVC)

        defectiveBottomVC.defectiveHandler = { [self] text in
            createFormBaseView.defectiveLabel.text = text
        }

        bottomSheetVC.modalPresentationStyle = .overFullScreen
        self.present(bottomSheetVC, animated: true, completion: nil)
    }
}

extension CreateFormBottomViewController {
    func getDefectiveData() {
        viewModel.fetchDefectiveData {}
    }
}
