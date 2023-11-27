//
//  CreateFormBottomViewController.swift
//  FormSample
//
//  Created by siyeon park on 2023/11/23.
//

import UIKit

final class CreateFormBottomViewController: BaseViewController {

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

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        createFormBaseView.shadowView.addTopShadow(shadowColor: UIColor.gray, shadowOpacity: 0.1, shadowRadius: 4, offset: CGSize(width: 0.0, height: -5.0))

        createFormBaseView.zoomInView.addDashedBorder(to: createFormBaseView.zoomInView, withRadius: 12, borderWidth: 1)
        createFormBaseView.zoomOutView.addDashedBorder(to: createFormBaseView.zoomOutView, withRadius: 12, borderWidth: 1)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.createFormBaseView.defectiveTextView.resignFirstResponder()
    }
}

extension CreateFormBottomViewController {
    func setupButtonTapped() {
        createFormBaseView.locationButton.addTarget(self, action: #selector(selectLocation), for: .touchUpInside)

        createFormBaseView.defectiveButton.addTarget(self, action: #selector(selectDefective), for: .touchUpInside)

        createFormBaseView.closeBottomButton.addTarget(self, action: #selector(dismissBottomView), for: .touchUpInside)

        createFormBaseView.saveBottomButton.addTarget(self, action: #selector(saveFormData), for: .touchUpInside)

        createFormBaseView.zoomInButton.addTarget(self, action: #selector(selectPhoto), for: .touchUpInside)

        createFormBaseView.zoomOutButton.addTarget(self, action: #selector(selectAlbum), for: .touchUpInside)
    }
    
    @objc func selectLocation() {
        let requiredSelectionBottomVC = LocationBottomViewController()

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

    @objc func dismissBottomView() {
        self.back(animated: true)
    }

    @objc func saveFormData() {

    }

    @objc func selectPhoto() {
        let selectPhotoBottomVC = PhotoBottomViewController()

        let bottomSheetVC = CustomBottomSheetViewController(contentViewController: selectPhotoBottomVC)

        if viewModel.writeFormModel.photoDataListDataType.isOptional {
            createFormBaseView.zoomInImageView.isHidden = true
        } else {
            createFormBaseView.zoomInImageView.isHidden = false
        }

        selectPhotoBottomVC.imageHandler = { img in
            self.viewModel.writeFormModel.photoDataListDataType.zoomInImage = img
            self.createFormBaseView.zoomInImageView.image = img
        }
        bottomSheetVC.modalPresentationStyle = .overFullScreen
        self.present(bottomSheetVC, animated: true, completion: nil)
    }

    @objc func selectAlbum() {
        let selectPhotoBottomVC = PhotoBottomViewController()

        let bottomSheetVC = CustomBottomSheetViewController(contentViewController: selectPhotoBottomVC)

        if viewModel.writeFormModel.photoDataListDataType.isOptional {
            createFormBaseView.zoomOutImageView.isHidden = true
        } else {
            createFormBaseView.zoomOutImageView.isHidden = false
        }

        selectPhotoBottomVC.imageHandler = { img in
            self.viewModel.writeFormModel.photoDataListDataType.zoomOutImage = img
            self.createFormBaseView.zoomOutImageView.image = img
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
