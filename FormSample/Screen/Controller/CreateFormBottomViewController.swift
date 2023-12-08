//
//  CreateFormBottomViewController.swift
//  FormSample
//
//  Created by siyeon park on 2023/11/23.
//

import UIKit

final class CreateFormBottomViewController: BaseViewController {

    let createFormBaseView = CreateBaseView()
    var viewModel = WriteFormViewModel()
    var delegate: FormDelegate?
    var saveWriteFormModel: (WriteFormModel) -> Void = { _ in }

    override func loadView() {
        view = createFormBaseView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getDefectiveData()
        setupButtonTapped()
        setupValidate()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.createFormBaseView.contentTextView.resignFirstResponder()
    }
}

extension CreateFormBottomViewController {
    func setupButtonTapped() {
        createFormBaseView.closeBottomButton.addTarget(self, action: #selector(dismissBottomView), for: .touchUpInside)

        createFormBaseView.saveBottomButton.addTarget(self, action: #selector(saveFormData), for: .touchUpInside)

        createFormBaseView.locationButton.addTarget(self, action: #selector(selectLocation), for: .touchUpInside)

        createFormBaseView.defectiveButton.addTarget(self, action: #selector(selectDefective), for: .touchUpInside)

        createFormBaseView.unSelectedPhotoButton.addTarget(self, action: #selector(unSelectPhoto), for: .touchUpInside)

        createFormBaseView.zoomInButton.addTarget(self, action: #selector(selectPhoto), for: .touchUpInside)

        createFormBaseView.zoomInDeleteButton.addTarget(self, action: #selector(deleteZoomInImage), for: .touchUpInside)

        createFormBaseView.zoomOutDeleteButton.addTarget(self, action: #selector(deleteZoomOutImage), for: .touchUpInside)

        createFormBaseView.zoomOutButton.addTarget(self, action: #selector(selectAlbum), for: .touchUpInside)

        createFormBaseView.didChangeContentHandler = { [self] text in
            createFormBaseView.contentTextView.text = text
            viewModel.writeFormModel.contentData = text
            setupValidate()
        }
    }

    @objc func dismissBottomView() {
        back(animated: true)
    }

    @objc func saveFormData() {
        setupValidate()
        //saveWriteFormModel(viewModel.writeFormModel)
        delegate?.writeForm(data: self.viewModel.writeFormModel)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.4) {
            self.back(animated: true)

        }
    }

    @objc func selectLocation() {
        let requiredSelectionBottomVC = LocationBottomViewController()

        let bottomSheetVC = CustomBottomSheetViewController(contentViewController: requiredSelectionBottomVC)

        requiredSelectionBottomVC.locationHandler = { [self] text in
            createFormBaseView.locationLabel.text = text
            viewModel.writeFormModel.locationData = text
            setupValidate()
        }

        present(bottomSheetVC, animated: true, completion: nil)
    }

    @objc func selectDefective() {
        let defectiveBottomVC = DefectiveBottomViewController()

        let defectiveList = viewModel.defectiveDataList.map { $0.defectiveItem }
        defectiveBottomVC.selectDefectiveBaseView.setRadioDataList(data: defectiveList)

        let bottomSheetVC = CustomBottomSheetViewController(contentViewController: defectiveBottomVC)

        defectiveBottomVC.defectiveHandler = { [self] text in
            createFormBaseView.defectiveLabel.text = text
            viewModel.writeFormModel.defectiveData = text
            setupValidate()
        }

        bottomSheetVC.modalPresentationStyle = .overFullScreen
        present(bottomSheetVC, animated: true, completion: nil)
    }

    @objc func unSelectPhoto() {
        createFormBaseView.isAttachment = !createFormBaseView.isAttachment
        createFormBaseView.changeState()
        let isUnselectedPhoto = !viewModel.writeFormModel.photoDataListDataType.isOptional
        viewModel.writeFormModel.photoDataListDataType.isOptional = isUnselectedPhoto
        setupValidate()
    }

    @objc func selectPhoto() {
        let selectPhotoBottomVC = PhotoBottomViewController()

        let bottomSheetVC = CustomBottomSheetViewController(contentViewController: selectPhotoBottomVC)

        if viewModel.writeFormModel.photoDataListDataType.isOptional {
            createFormBaseView.zoomInImageView.isHidden = true
            viewModel.writeFormModel.photoDataListDataType.zoomInImage = nil
            setupValidate()
        } else {
            createFormBaseView.zoomInImageView.isHidden = false
        }

        selectPhotoBottomVC.imageHandler = { [self] img in
            viewModel.writeFormModel.photoDataListDataType.zoomInImage = img
            createFormBaseView.zoomInImageView.image = img
            createFormBaseView.zoomInDeleteButton.isHidden = false
            setupValidate()
        }
        bottomSheetVC.modalPresentationStyle = .overFullScreen
        present(bottomSheetVC, animated: true, completion: nil)
    }

    @objc func deleteZoomInImage() {
        createFormBaseView.zoomInImageView.image = nil
        viewModel.writeFormModel.photoDataListDataType.zoomInImage = nil
        createFormBaseView.zoomInDeleteButton.isHidden = true
    }

    @objc func selectAlbum() {
        let selectPhotoBottomVC = PhotoBottomViewController()

        let bottomSheetVC = CustomBottomSheetViewController(contentViewController: selectPhotoBottomVC)

        if viewModel.writeFormModel.photoDataListDataType.isOptional {
            createFormBaseView.zoomOutImageView.isHidden = true
            viewModel.writeFormModel.photoDataListDataType.zoomOutImage = nil
            setupValidate()
        } else {
            createFormBaseView.zoomOutImageView.isHidden = false
        }

        selectPhotoBottomVC.imageHandler = { [self] img in
            viewModel.writeFormModel.photoDataListDataType.zoomOutImage = img
            createFormBaseView.zoomOutImageView.image = img
            createFormBaseView.zoomOutDeleteButton.isHidden = false
            setupValidate()
        }
        bottomSheetVC.modalPresentationStyle = .overFullScreen
        present(bottomSheetVC, animated: true, completion: nil)
    }

    @objc func deleteZoomOutImage() {
        createFormBaseView.zoomOutImageView.image = nil
        viewModel.writeFormModel.photoDataListDataType.zoomOutImage = nil
        createFormBaseView.zoomOutDeleteButton.isHidden = true
    }

    func setupValidate() {
        createFormBaseView.saveBottomButton.isEnabled = isFormValid()
        createFormBaseView.saveBottomButton.alpha = createFormBaseView.saveBottomButton.isEnabled ? 1.0 : 0.4
    }

    private func isFormValid() -> Bool {
        let locationData = !viewModel.writeFormModel.locationData.isEmpty
        let defectiveData = !viewModel.writeFormModel.defectiveData.isEmpty
        let isUnselectedPhoto = viewModel.writeFormModel.photoDataListDataType.isOptional
        let hasZoomInImage = isUnselectedPhoto ? true : viewModel.writeFormModel.photoDataListDataType.zoomInImage != nil
        let hasZoomOutImage = isUnselectedPhoto ? true : viewModel.writeFormModel.photoDataListDataType.zoomOutImage != nil
        let contentData = !viewModel.writeFormModel.contentData.isEmpty

        let validationCheck = [locationData, isUnselectedPhoto, defectiveData, contentData]
        return validationCheck.allSatisfy { $0 }
    }
}

extension CreateFormBottomViewController {
    func getDefectiveData() {
        viewModel.fetchDefectiveData {}
    }
}
