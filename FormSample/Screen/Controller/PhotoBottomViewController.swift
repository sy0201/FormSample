//
//  PhotoBottomViewController.swift
//  FormSample
//
//  Created by siyeon park on 2023/11/27.
//

import UIKit
import Photos

final class PhotoBottomViewController: BaseViewController {

    let selectPhotoBaseView = SelectPhotoBaseView()
    var imagePicker = UIImagePickerController()
    var imageHandler: (UIImage) -> () = { _ in }

    override func loadView() {
        view = selectPhotoBaseView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtonTapped()
    }
}

extension PhotoBottomViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func setupButtonTapped() {
        selectPhotoBaseView.dismissButton.addTarget(self, action: #selector(dismissBottomView), for: .touchUpInside)

        selectPhotoBaseView.zoomInButton.addTarget(self, action: #selector(cameraTapped), for: .touchUpInside)

        selectPhotoBaseView.zoomOutButton.addTarget(self, action: #selector(albumTapped), for: .touchUpInside)
    }

    @objc func dismissBottomView() {
        back(animated: true)
    }
    
    @objc func cameraTapped() {
        checkCameraPermission()
    }

    @objc func albumTapped() {
        checkAlbumPermission()
    }
    
    func checkCameraPermission() {
        AVCaptureDevice.requestAccess(for: .video) { [weak self] (granted: Bool) in
            guard let self = self else { return }
            if granted {
                self.openCamera(type: .camera)
            } else {
                self.goAppSetting()
            }
        }
    }

    func checkAlbumPermission() {
        PHPhotoLibrary.requestAuthorization( { status in
            switch status {
            case .authorized:

                self.openAlbum(type: .album)
            case .denied:

                self.goAppSetting()
            case .restricted, .notDetermined:

                PHPhotoLibrary.requestAuthorization { state in
                    if state == .authorized {
                        self.openAlbum(type: .album)
                    } else {
                        self.dismiss(animated: true)
                    }
                }
            default:
                break
            }
        })
    }

    func openCamera(type: Enum.PhotoType) {
        presentImagePicker(sourceType: .camera)
    }

    func openAlbum(type: Enum.PhotoType) {
        presentImagePicker(sourceType: .photoLibrary)

    }

    private func presentImagePicker(sourceType: UIImagePickerController.SourceType) {
        guard UIImagePickerController.isSourceTypeAvailable(sourceType) else {
            return
        }

        DispatchQueue.main.async {
            self.imagePicker.delegate = self
            self.imagePicker.sourceType = sourceType
            self.imagePicker.allowsEditing = false
            self.present(self.imagePicker, animated: true)
        }
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        if let cameraImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {

            if let imageData = cameraImage.jpegData(compressionQuality: 1.0) {

                guard let dataToImage = UIImage(data: imageData) else { return }
                self.imageHandler(dataToImage)
                self.back(animated: true)
            }
            self.dismiss(animated: true)
        }
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true)
    }

    private func goAppSetting() {

        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else { return }

        if UIApplication.shared.canOpenURL(settingsUrl) {
            UIApplication.shared.open(settingsUrl, options: [:], completionHandler: nil)
        }
    }
}
