//
//  CreateFormBottomViewController.swift
//  FormSample
//
//  Created by siyeon park on 2023/11/23.
//

import UIKit

final class CreateFormBottomViewController: UIViewController {

    let createFormBaseView = CreateFormBaseView()
    private let defectiveViewModel = WriteFormViewModel()

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
        createFormBaseView.localButton.addTarget(self, action: #selector(selectLocal), for: .touchUpInside)
        
        createFormBaseView.defectiveButton.addTarget(self, action: #selector(selectDefective), for: .touchUpInside)

        //createFormBaseView.unSelectedButton.addTarget(self, action: #selector(hiddenPhotoView), for: .touchUpInside)
    }
    
    @objc func selectLocal() {
        let requiredSelectionBottomVC = RequiredSelectionBottomViewController()
        
        let bottomSheetVC = CustomBottomSheetViewController(contentViewController: requiredSelectionBottomVC)
        
        bottomSheetVC.modalPresentationStyle = .overFullScreen
        self.present(bottomSheetVC, animated: true, completion: nil)
    }
    
    @objc func selectDefective() {
        let defectiveSelectionBottomVC = DefectiveBottomViewController()

        let defectiveList = defectiveViewModel.defectiveDataList.map { $0.defectiveItem }
        defectiveSelectionBottomVC.selectDefectiveBaseView.setRadioDataList(data: defectiveList)

        let bottomSheetVC = CustomBottomSheetViewController(contentViewController: defectiveSelectionBottomVC)

        defectiveSelectionBottomVC.defectiveHandler = { [self] text in
            createFormBaseView.defectiveLabel.text = text
        }

        bottomSheetVC.modalPresentationStyle = .overFullScreen
        self.present(bottomSheetVC, animated: true, completion: nil)
    }
}

extension CreateFormBottomViewController {
    func getDefectiveData() {
        defectiveViewModel.fetchDefectiveData {}
    }
}
